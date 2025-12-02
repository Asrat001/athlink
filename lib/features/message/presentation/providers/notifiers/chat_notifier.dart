import 'dart:async';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/core/services/socket_service.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/repository/chat_repository.dart';
import 'package:athlink/features/message/presentation/providers/states/chat_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/di.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  final ChatRepository _repository;
  final SocketIoService _socketService;
  final String _conversationId;

  Timer? _typingTimer;
  bool _isTyping = false;

  ChatNotifier({
    required ChatRepository repository,
    required String conversationId,
  }) : _repository = repository,
       _socketService = sl<SocketIoService>(),
       _conversationId = conversationId,
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
  }

  /// Load messages from REST API
  Future<void> loadMessages({int page = 1}) async {
    state = ChatState.loading(
      messages: state.maybeMap(
        loaded: (s) => s.messages,
        error: (s) => s.messages,
        orElse: () => [],
      ),
      typingUsers: _getTypingUsers(),
    );

    final response = await _repository.getMessages(
      conversationId: _conversationId,
      page: page,
      limit: 50,
    );

    response.when(
      success: (messages) {
        final currentMessages = state.maybeMap(
          loaded: (s) => s.messages,
          loading: (s) => s.messages,
          orElse: () => <ChatMessage>[],
        );

        final updatedMessages = page == 1
            ? messages
            : [...currentMessages, ...messages];

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
    final currentPage = state.maybeMap(
      loaded: (s) => s.currentPage,
      orElse: () => 1,
    );

    final hasMore = state.maybeMap(
      loaded: (s) => s.hasMore,
      orElse: () => false,
    );

    if (hasMore) {
      await loadMessages(page: currentPage + 1);
    }
  }

  /// Listen for new messages from Socket.IO
  void _listenToNewMessages() {
    _socketService.onMessageReceived((message) {
      print('🔔 MESSAGE RECEIVED VIA SOCKET');
      print('Message ID: ${message.id}');
      print('Message ConversationId: ${message.conversationId}');
      print('Current ConversationId: $_conversationId');
      print('Match: ${message.conversationId == _conversationId}');

      if (message.conversationId == _conversationId) {
        print('✅ Adding message to state');
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

        // Mark as read
        _socketService.markMessageAsRead(_conversationId, message.id);
      } else {
        print('❌ Message for different conversation - ignoring');
      }
    });
  }

  /// Send a message
  void sendMessage(String content, {String type = 'text'}) {
    debugPrint('📤 ChatNotifier.sendMessage called with content: "$content"');
    debugPrint('✅ Sending message via socket...');
    // Send via socket
    _socketService.sendMessage(
      conversationId: _conversationId,
      content: content,
      type: type,
      onResponse: (response) {
        if (response['success'] == true) {
          // ✅ Server confirmed! Add the message to UI immediately.
          // We do this here because the server likely doesn't broadcast 'message:new' back to the sender.
          try {
            final newMessage = ChatMessage.fromJson(response['data']);

            // Check if we already have it (to prevent duplicates if server DOES echo)
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
          // Handle error
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
      (conversationId) {
        if (conversationId == _conversationId) {
          _addTypingUser(
            'other_user',
          ); // You'll need to get actual user ID from socket data
        }
      },
      (conversationId) {
        if (conversationId == _conversationId) {
          _removeTypingUser('other_user');
        }
      },
    );
  }

  /// Listen for read receipts
  void _listenToReadReceipts() {
    _socketService.onMessageRead((data) {
      // Update message status to 'read'
      // You can implement this based on your ChatMessage model
    });
  }

  /// Add typing user
  void _addTypingUser(String userId) {
    final currentTyping = _getTypingUsers();
    if (!currentTyping.contains(userId)) {
      state = state.map(
        initial: (s) => s,
        loading: (s) => s.copyWith(typingUsers: [...s.typingUsers, userId]),
        loaded: (s) => s.copyWith(typingUsers: [...s.typingUsers, userId]),
        error: (s) => s.copyWith(typingUsers: [...s.typingUsers, userId]),
      );
    }
  }

  /// Remove typing user
  void _removeTypingUser(String userId) {
    final currentTyping = _getTypingUsers();
    state = state.map(
      initial: (s) => s,
      loading: (s) => s.copyWith(
        typingUsers: s.typingUsers.where((id) => id != userId).toList(),
      ),
      loaded: (s) => s.copyWith(
        typingUsers: s.typingUsers.where((id) => id != userId).toList(),
      ),
      error: (s) => s.copyWith(
        typingUsers: s.typingUsers.where((id) => id != userId).toList(),
      ),
    );
  }

  /// Get current typing users
  List<String> _getTypingUsers() {
    return state.maybeMap(
      loading: (s) => s.typingUsers,
      loaded: (s) => s.typingUsers,
      error: (s) => s.typingUsers,
      orElse: () => [],
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
