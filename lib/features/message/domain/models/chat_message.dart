import 'package:athlink/features/message/domain/models/message_sender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const ChatMessage._(); // Enable custom methods

  const factory ChatMessage({
    @JsonKey(name: '_id') required String id,
    required String conversationId,
    required MessageSender sender,
    required String content,
    required String type, // 'text', 'image', 'file', etc.
    String? mediaUrl,
    @Default('sent') String status, // 'sent', 'delivered', 'read'
    required DateTime createdAt,
    required DateTime updatedAt,

    // UI-specific fields for special message types
    String? proposalId,
    String? proposalTitle,
    String? proposalSubtitle,
    String? proposalLogo,
    String? meetLink,
    String? meetThumbnail,
    String? fileName,
    String? fileSize,
    String? fileType,
    String? audioPath,
    Duration? duration,
  }) = _ChatMessage;

  // Computed property for UI
  bool isFromMe(String currentUserId) => sender.id == currentUserId;

  // Helper getters for backward compatibility
  bool get isRead => status == 'read';
  bool get isDelivered => status == 'delivered' || status == 'read';

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
