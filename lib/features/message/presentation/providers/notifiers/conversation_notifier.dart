import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/domain/repository/chat_repository.dart';
import 'package:athlink/features/message/presentation/providers/states/conversation_state.dart';

class ConversationNotifier extends StateNotifier<ConversationState> {
  final ChatRepository _chatRepository;
  ConversationNotifier(this._chatRepository)
    : super(const ConversationState.initial());

  Future<void> getMessages({
    required String conversationId,
    int page = 1,
    int limit = 50,
  }) async {
    List<Conversation> currentConversations = [];
    state.mapOrNull(loaded: (s) => currentConversations = s.conversations);

    state = const ConversationState.loading();
    final response = await _chatRepository.getMessages(
      conversationId: conversationId,
      page: page,
      limit: limit,
    );
    response.when(
      success: (data) {
        state = ConversationState.loaded(
          messages: data,
          conversations: currentConversations,
        );
      },
      failure: (error) {
        state = ConversationState.error(
          NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> getConversations({int page = 1, int limit = 50}) async {
    List<ChatMessage> currentMessages = [];
    state.mapOrNull(loaded: (s) => currentMessages = s.messages);

    state = const ConversationState.loading();
    final response = await _chatRepository.getConversations(
      page: page,
      limit: limit,
    );
    response.when(
      success: (data) {
        state = ConversationState.loaded(
          conversations: data,
          messages: currentMessages,
        );
      },
      failure: (error) {
        state = ConversationState.error(
          NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }
}
