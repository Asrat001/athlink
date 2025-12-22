import 'dart:async';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/core/services/socket_service.dart';
import 'package:athlink/features/message/domain/models/chat_attachment.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/repository/chat_repository.dart';
import 'package:athlink/features/message/presentation/providers/states/chat_state.dart';
import 'package:athlink/features/message/presentation/providers/states/uploading_state-provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/di.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final ChatRepository _repository;
  final SocketIoService _socketService;
  final String _conversationId;
  final Ref _ref;

  Timer? _typingTimer;
  bool _isTyping = false;
  bool _isLoadingMore = false; // Prevent multiple concurrent loads

  ChatNotifier({
    required ChatRepository repository,
    required String conversationId,
    required Ref ref,
  }) : _repository = repository,
       _socketService = sl<SocketIoService>(),
       _conversationId = conversationId,
       _ref = ref,
       super(const ChatState.initial()) {
    _init();
  }

  /// Initialize: setup socket connection, join conversation, load messages, listen for real-time updates
  Future<void> _init() async {
    // Initialize socket connection with token
    final token = await sl<LocalStorageService>().getAccessToken();
    if (token != null && token.isNotEmpty) {
      _socketService.initConnection(token);
    }

    // Join conversation and setup listeners
    _socketService.joinConversation(_conversationId);
    _listenToNewMessages();
    _listenToTyping();
    _listenToReadReceipts();

    // Load initial messages
    await loadMessages();

    // Mark all unread messages as read when entering conversation
    markAllMessagesAsRead();
  }

  /// Load messages from REST API
  Future<void> loadMessages({int page = 1}) async {
    // Only show loading state for initial load (page 1)
    // For pagination, keep the loaded state to preserve scroll position
    if (page == 1) {
      state = ChatState.loading(
        messages: state.maybeMap(
          loaded: (s) => s.messages,
          error: (s) => s.messages,
          orElse: () => [],
        ),
        typingUsers: _getTypingUsers(),
      );
    }

    final response = await _repository.getMessages(
      conversationId: _conversationId,
      page: page,
      limit: 50,
    );

    response.when(
      success: (messages) {
        // API returns oldest-first (chronological order) - no reversal needed!
        final currentMessages = state.maybeMap(
          loaded: (s) => s.messages,
          loading: (s) => s.messages,
          orElse: () => <ChatMessage>[],
        );

        // Page 1: newest page of messages (most recent)
        // Page 2+: older messages that should appear BEFORE current ones
        final updatedMessages = page == 1
            ? messages
            : [...messages, ...currentMessages];

        state = ChatState.loaded(
          messages: updatedMessages,
          typingUsers: _getTypingUsers(),
          hasMore: messages.length >= 50,
          currentPage: page,
        );
      },
      failure: (error) {
        state = ChatState.error(
          message: error.toString(),
          messages: state.maybeMap(
            loaded: (s) => s.messages,
            loading: (s) => s.messages,
            orElse: () => [],
          ),
          typingUsers: _getTypingUsers(),
        );
      },
    );
  }

  /// Load more messages (pagination)
  Future<void> loadMoreMessages() async {
    // Prevent multiple concurrent loads
    if (_isLoadingMore) return;

    final currentPage = state.maybeMap(
      loaded: (s) => s.currentPage,
      orElse: () => 1,
    );

    final hasMore = state.maybeMap(
      loaded: (s) => s.hasMore,
      orElse: () => false,
    );

    if (hasMore) {
      _isLoadingMore = true;
      await loadMessages(page: currentPage + 1);
      _isLoadingMore = false;
    }
  }

  /// Listen for new messages from Socket.IO
  void _listenToNewMessages() {
    _socketService.onMessageReceived((message) {
      if (message.conversationId == _conversationId) {
        final currentMessages = state.maybeMap(
          loaded: (s) => s.messages,
          loading: (s) => s.messages,
          error: (s) => s.messages,
          orElse: () => <ChatMessage>[],
        );

        state = ChatState.loaded(
          messages: [...currentMessages, message],
          typingUsers: _getTypingUsers(),
          hasMore: state.maybeMap(loaded: (s) => s.hasMore, orElse: () => true),
          currentPage: state.maybeMap(
            loaded: (s) => s.currentPage,
            orElse: () => 1,
          ),
        );

        // Only mark as read if the message is NOT from the current user (incoming message)
        final currentUserId = sl<LocalStorageService>().getUserData()?.id ?? '';
        if (message.sender.id != currentUserId) {
          _socketService.markMessageAsRead(_conversationId, message.id);
        }
      }
    });
  }

  /// Mark all unread messages as read when viewing conversation
  void markAllMessagesAsRead() {
    final currentUserId = sl<LocalStorageService>().getUserData()?.id ?? '';
    final messages = state.maybeMap(
      loaded: (s) => s.messages,
      orElse: () => <ChatMessage>[],
    );

    // Check if there are any messages to mark as read
    final hasUnreadMessages = messages.any(
      (m) => m.sender.id != currentUserId && m.status != 'read',
    );

    if (!hasUnreadMessages) return;

    // Send socket events for each unread message
    for (final message in messages) {
      if (message.sender.id != currentUserId && message.status != 'read') {
        _socketService.markMessageAsRead(_conversationId, message.id);
      }
    }

    // Update local state immediately so recipient sees ✓✓
    final updatedMessages = messages.map((message) {
      if (message.sender.id != currentUserId && message.status != 'read') {
        return message.copyWith(status: 'read');
      }
      return message;
    }).toList();

    state = ChatState.loaded(
      messages: updatedMessages,
      typingUsers: _getTypingUsers(),
      hasMore: state.maybeMap(loaded: (s) => s.hasMore, orElse: () => true),
      currentPage: state.maybeMap(
        loaded: (s) => s.currentPage,
        orElse: () => 1,
      ),
    );
  }

  /// Upload a file and update the shared upload state
  Future<List<ChatAttachment>?> uploadFile(
    List<({String filePath, String fileName})> files,
  ) async {
    // 1. Set Loading
    _ref.read(uploadStateProvider.notifier).state = const AsyncValue.loading();

    try {
      // 2. Perform Upload
      final response = await _repository.uploadFile(files: files);

      return response.when(
        success: (attachments) {
          // 3. Set Success (with URL)
          _ref.read(uploadStateProvider.notifier).state = AsyncValue.data(
            attachments,
          );
          return attachments;
        },
        failure: (error) {
          // 4. Set Error
          _ref.read(uploadStateProvider.notifier).state = AsyncValue.error(
            error,
            StackTrace.current,
          );
          return null;
        },
      );
    } catch (e, st) {
      _ref.read(uploadStateProvider.notifier).state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Send a message
  void sendMessage(
    String content, {
    String type = 'text',
    List<ChatAttachment>? mediaUrls,
  }) {
    _socketService.sendMessage(
      conversationId: _conversationId,
      content: content,
      type: type,
      mediaUrls: mediaUrls,
      onResponse: (response) {
        if (response['success'] == true) {
          try {
            final newMessage = ChatMessage.fromJson(response['data']);

            final exists = state.maybeMap(
              loaded: (s) => s.messages.any((m) => m.id == newMessage.id),
              orElse: () => false,
            );

            if (!exists) {
              final currentMessages = state.maybeMap(
                loaded: (s) => s.messages,
                loading: (s) => s.messages,
                error: (s) => s.messages,
                orElse: () => <ChatMessage>[],
              );

              state = ChatState.loaded(
                messages: [...currentMessages, newMessage],
                typingUsers: _getTypingUsers(),
                hasMore: state.maybeMap(
                  loaded: (s) => s.hasMore,
                  orElse: () => true,
                ),
                currentPage: state.maybeMap(
                  loaded: (s) => s.currentPage,
                  orElse: () => 1,
                ),
              );
            }
          } catch (e) {
            print('Error parsing sent message response: $e');
          }
        } else {
          state = ChatState.error(
            message: response['error'] ?? 'Failed to send message',
            messages: state.maybeMap(
              loaded: (s) => s.messages,
              loading: (s) => s.messages,
              error: (s) => s.messages,
              orElse: () => [],
            ),
            typingUsers: _getTypingUsers(),
          );
        }
      },
    );
  }

  /// Start typing indicator (with debounce)
  void startTyping() {
    if (!_isTyping) {
      _socketService.sendTypingStart(_conversationId);
      _isTyping = true;
    }

    _typingTimer?.cancel();
    _typingTimer = Timer(const Duration(seconds: 2), () {
      stopTyping();
    });
  }

  /// Stop typing indicator
  void stopTyping() {
    if (_isTyping) {
      _socketService.sendTypingStop(_conversationId);
      _isTyping = false;
    }
    _typingTimer?.cancel();
  }

  /// Listen for typing indicators from other users
  void _listenToTyping() {
    _socketService.onTyping(
      (data) {
        final conversationId = data['conversationId'];
        final userId = data['userId'];
        final userName = data['userName'] ?? 'Someone';

        if (conversationId == _conversationId && userId != null) {
          _addTypingUser(userId, userName);
        }
      },
      (data) {
        final conversationId = data['conversationId'];
        final userId = data['userId'];

        if (conversationId == _conversationId && userId != null) {
          _removeTypingUser(userId);
        }
      },
    );
  }

  /// Listen for read receipts and update message status
  void _listenToReadReceipts() {
    _socketService.onMessageRead((data) {
      try {
        final messageId = data['messageId'] as String?;
        final conversationId = data['conversationId'] as String?;

        if (messageId == null || conversationId != _conversationId) return;

        // Update the message status in our state
        final currentMessages = state.maybeMap(
          loaded: (s) => s.messages,
          loading: (s) => s.messages,
          error: (s) => s.messages,
          orElse: () => <ChatMessage>[],
        );

        // Find and update the message status
        final updatedMessages = currentMessages.map((message) {
          if (message.id == messageId) {
            return message.copyWith(status: 'read');
          }
          return message;
        }).toList();

        state = ChatState.loaded(
          messages: updatedMessages,
          typingUsers: _getTypingUsers(),
          hasMore: state.maybeMap(loaded: (s) => s.hasMore, orElse: () => true),
          currentPage: state.maybeMap(
            loaded: (s) => s.currentPage,
            orElse: () => 1,
          ),
        );
      } catch (e) {
        print('Error handling read receipt: $e');
      }
    });
  }

  /// Add typing user
  void _addTypingUser(String userId, String userName) {
    final currentTyping = _getTypingUsers();
    if (!currentTyping.containsKey(userId)) {
      final newTyping = Map<String, String>.from(currentTyping);
      newTyping[userId] = userName;

      state = state.map(
        initial: (s) => s,
        loading: (s) => s.copyWith(typingUsers: newTyping),
        loaded: (s) => s.copyWith(typingUsers: newTyping),
        error: (s) => s.copyWith(typingUsers: newTyping),
      );
    }
  }

  /// Remove typing user
  void _removeTypingUser(String userId) {
    final currentTyping = _getTypingUsers();
    if (currentTyping.containsKey(userId)) {
      final newTyping = Map<String, String>.from(currentTyping);
      newTyping.remove(userId);

      state = state.map(
        initial: (s) => s,
        loading: (s) => s.copyWith(typingUsers: newTyping),
        loaded: (s) => s.copyWith(typingUsers: newTyping),
        error: (s) => s.copyWith(typingUsers: newTyping),
      );
    }
  }

  /// Get current typing users
  Map<String, String> _getTypingUsers() {
    return state.maybeMap(
      loading: (s) => s.typingUsers,
      loaded: (s) => s.typingUsers,
      error: (s) => s.typingUsers,
      orElse: () => {},
    );
  }

  @override
  void dispose() {
    _typingTimer?.cancel();
    _socketService.leaveConversation(_conversationId);
    _socketService.disconnect();
    super.dispose();
  }
}
