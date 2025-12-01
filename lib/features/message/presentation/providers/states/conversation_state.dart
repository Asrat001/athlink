import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_state.freezed.dart';

@freezed
class ConversationState with _$ConversationState {
  const factory ConversationState.initial() = _Initial;
  const factory ConversationState.loading() = _Loading;
  const factory ConversationState.loaded({
    @Default([]) List<Conversation> conversations,
    @Default([]) List<ChatMessage> messages,
  }) = _Loaded;
  const factory ConversationState.error(String error) = _Error;
}
