import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;

  const factory ChatState.loading({
    @Default([]) List<ChatMessage> messages,
    @Default({}) Map<String, String> typingUsers,
  }) = _Loading;

  const factory ChatState.loaded({
    required List<ChatMessage> messages,
    @Default({}) Map<String, String> typingUsers,
    @Default(true) bool hasMore,
    @Default(1) int currentPage,
  }) = _Loaded;

  const factory ChatState.error({
    required String message,
    @Default([]) List<ChatMessage> messages,
    @Default({}) Map<String, String> typingUsers,
  }) = _Error;
}
