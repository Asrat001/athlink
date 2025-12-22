import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/message/domain/models/chat_attachment.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/models/contact.dart';
import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/domain/models/send_message_request.dart';

abstract class ChatRepository {
  /// Get all conversations for the current user
  Future<ApiResponse<List<Conversation>>> getConversations({
    int page = 1,
    int limit = 20,
  });

  /// Get messages for a specific conversation
  Future<ApiResponse<List<ChatMessage>>> getMessages({
    required String conversationId,
    int page = 1,
    int limit = 50,
  });

  /// Send a text message
  Future<ApiResponse<ChatMessage>> sendMessage(SendMessageRequest request);

  /// Upload a file and get the file URL
  Future<ApiResponse<List<ChatAttachment>>> uploadFile({
    required List<({String filePath, String fileName})> files,
  });

  /// Upload an audio file and get the audio URL
  Future<ApiResponse<String>> uploadAudio({
    required String audioPath,
    required Duration duration,
  });

  /// Mark message as read
  Future<ApiResponse<bool>> markMessageAsRead(String messageId);

  /// Mark all messages in a conversation as read
  Future<ApiResponse<bool>> markConversationAsRead(String conversationId);

  /// Delete a message
  Future<ApiResponse<bool>> deleteMessage(String messageId);

  /// Get all contacts (athletes and sponsors)
  Future<ApiResponse<List<Contact>>> getContacts({
    ContactType? type,
    String? searchQuery,
  });

  /// Create or get existing conversation with a user
  Future<ApiResponse<Conversation>> createOrGetConversation({
    required String participantId,
    required ContactType participantType,
  });

  /// Generate Google Meet link
  Future<ApiResponse<String>> generateMeetLink();

  /// Search messages within a conversation
  Future<ApiResponse<List<ChatMessage>>> searchMessages({
    required String conversationId,
    required String query,
  });

  /// Mute/unmute conversation
  Future<ApiResponse<bool>> toggleMuteConversation({
    required String conversationId,
    required bool isMuted,
  });

  /// Pin/unpin conversation
  Future<ApiResponse<bool>> togglePinConversation({
    required String conversationId,
    required bool isPinned,
  });

  /// Delete conversation
  Future<ApiResponse<bool>> deleteConversation(String conversationId);
}
