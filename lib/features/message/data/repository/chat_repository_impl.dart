import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/message/data/datasource/chat_remote_datasource.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/models/contact.dart';
import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/domain/models/send_message_request.dart';
import 'package:athlink/features/message/domain/repository/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource _remoteDataSource;

  ChatRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<Conversation>>> getConversations({
    int page = 1,
    int limit = 20,
  }) async {
    return await _remoteDataSource.getConversations(page: page, limit: limit);
  }

  @override
  Future<ApiResponse<List<ChatMessage>>> getMessages({
    required String conversationId,
    int page = 1,
    int limit = 50,
  }) async {
    return await _remoteDataSource.getMessages(
      conversationId: conversationId,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<ApiResponse<ChatMessage>> sendMessage(
    SendMessageRequest request,
  ) async {
    return await _remoteDataSource.sendMessage(request);
  }

  @override
  Future<ApiResponse<String>> uploadFile({
    required String filePath,
    required String fileName,
  }) async {
    return await _remoteDataSource.uploadFile(
      filePath: filePath,
      fileName: fileName,
    );
  }

  @override
  Future<ApiResponse<String>> uploadAudio({
    required String audioPath,
    required Duration duration,
  }) async {
    return await _remoteDataSource.uploadAudio(
      audioPath: audioPath,
      duration: duration,
    );
  }

  @override
  Future<ApiResponse<bool>> markMessageAsRead(String messageId) async {
    return await _remoteDataSource.markMessageAsRead(messageId);
  }

  @override
  Future<ApiResponse<bool>> markConversationAsRead(
    String conversationId,
  ) async {
    return await _remoteDataSource.markConversationAsRead(conversationId);
  }

  @override
  Future<ApiResponse<bool>> deleteMessage(String messageId) async {
    return await _remoteDataSource.deleteMessage(messageId);
  }

  @override
  Future<ApiResponse<List<Contact>>> getContacts({
    ContactType? type,
    String? searchQuery,
  }) async {
    return await _remoteDataSource.getContacts(
      type: type,
      searchQuery: searchQuery,
    );
  }

  @override
  Future<ApiResponse<Conversation>> createOrGetConversation({
    required String participantId,
    required ContactType participantType,
  }) async {
    return await _remoteDataSource.createOrGetConversation(
      participantId: participantId,
      participantType: participantType,
    );
  }

  @override
  Future<ApiResponse<String>> generateMeetLink() async {
    return await _remoteDataSource.generateMeetLink();
  }

  @override
  Future<ApiResponse<List<ChatMessage>>> searchMessages({
    required String conversationId,
    required String query,
  }) async {
    return await _remoteDataSource.searchMessages(
      conversationId: conversationId,
      query: query,
    );
  }

  @override
  Future<ApiResponse<bool>> toggleMuteConversation({
    required String conversationId,
    required bool isMuted,
  }) async {
    return await _remoteDataSource.toggleMuteConversation(
      conversationId: conversationId,
      isMuted: isMuted,
    );
  }

  @override
  Future<ApiResponse<bool>> togglePinConversation({
    required String conversationId,
    required bool isPinned,
  }) async {
    return await _remoteDataSource.togglePinConversation(
      conversationId: conversationId,
      isPinned: isPinned,
    );
  }

  @override
  Future<ApiResponse<bool>> deleteConversation(String conversationId) async {
    return await _remoteDataSource.deleteConversation(conversationId);
  }
}
