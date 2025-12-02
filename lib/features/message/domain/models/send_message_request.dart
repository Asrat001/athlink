import 'package:freezed_annotation/freezed_annotation.dart';
import 'chat_message.dart';

part 'send_message_request.freezed.dart';
part 'send_message_request.g.dart';

@freezed
abstract class SendMessageRequest with _$SendMessageRequest {
  const factory SendMessageRequest({
    required String conversationId,
    required String receiverId,
    required String type, // 'text', 'image', 'file', etc.
    String? content,
    String? mediaUrl,
    String? fileName,
    String? fileSize,
    String? fileType,
    Duration? duration,
    String? proposalId,
    String? meetLink,
  }) = _SendMessageRequest;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);
}
