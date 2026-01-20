import 'dart:developer';

import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/features/message/domain/models/chat_attachment.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/models/contact.dart';
import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/domain/models/send_message_request.dart';
import 'package:dio/dio.dart';

class ChatRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  ChatRemoteDataSource(this._httpClient);

  /// Get all conversations for the current user
  Future<ApiResponse<List<Conversation>>> getConversations({
    int page = 1,
    int limit = 20,
  }) async {
    final queryParams = <String, dynamic>{'page': page, 'limit': limit};

    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get('/chat/conversations', queryParameters: queryParams);
      },
      fromData: (data) {
        final conversations = data['data'] as List;
        return conversations
            .map((json) => Conversation.fromJson(json))
            .toList();
      },
    );
  }

  /// Get messages for a specific conversation
  Future<ApiResponse<List<ChatMessage>>> getMessages({
    required String conversationId,
    int page = 1,
    int limit = 50,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get(
              '/chat/conversations/$conversationId/messages',
              queryParameters: {'page': page, 'limit': limit},
            );
      },
      fromData: (data) {
        final messages = data['data'] as List;
        return messages.map((json) => ChatMessage.fromJson(json)).toList();
      },
    );
  }

  /// Send a message
  Future<ApiResponse<ChatMessage>> sendMessage(
    SendMessageRequest request,
  ) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().post(
          '/messages/send',
          data: request.toJson(),
        );
      },
      fromData: (data) => ChatMessage.fromJson(data['data']),
    );
  }

  /// Upload a file
  Future<ApiResponse<List<ChatAttachment>>> uploadFile({
    required List<({String filePath, String fileName})> files,
  }) async {
    final multipartFiles = await Future.wait(
      files.map(
        (f) => MultipartFile.fromFile(f.filePath, filename: f.fileName),
      ),
    );
    final formData = FormData.fromMap({'files': multipartFiles});

    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post('/chat/upload', data: formData);
      },
      fromData: (data) {
        final uploadData = data['data'];
        if (uploadData is List) {
          if (uploadData.isEmpty) throw Exception("Upload returned empty list");
          return uploadData
              .map((json) => ChatAttachment.fromJson(json))
              .toList();
        } else {
          throw Exception("Upload returned empty list");
        }
      },
    );
  }

  /// Upload an audio file
  Future<ApiResponse<String>> uploadAudio({
    required String audioPath,
    required Duration duration,
  }) async {
    final fileName = audioPath.split('/').last;

    final formData = FormData.fromMap({
      'audio': await MultipartFile.fromFile(audioPath, filename: fileName),
      'duration': duration.inSeconds,
    });

    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().post(
          '/messages/upload/audio',
          data: formData,
        );
      },
      fromData: (data) => data['data']['audioUrl'] as String,
    );
  }

  /// Mark message as read
  Future<ApiResponse<bool>> markMessageAsRead(String messageId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().patch('/messages/$messageId/read');
      },
      fromData: (data) => data['success'] as bool? ?? true,
    );
  }

  /// Mark all messages in a conversation as read
  Future<ApiResponse<bool>> markConversationAsRead(
    String conversationId,
  ) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().patch(
          '/messages/conversations/$conversationId/read-all',
        );
      },
      fromData: (data) => data['success'] as bool? ?? true,
    );
  }

  /// Delete a message
  Future<ApiResponse<bool>> deleteMessage(String messageId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().delete('/messages/$messageId');
      },
      fromData: (data) => data['success'] as bool? ?? true,
    );
  }

  /// Get all contacts
  Future<ApiResponse<List<Contact>>> getContacts({
    ContactType? type,
    String? searchQuery,
  }) async {
    final queryParams = <String, dynamic>{};

    if (type != null) {
      queryParams['type'] = type.name;
    }

    if (searchQuery != null && searchQuery.isNotEmpty) {
      queryParams['search'] = searchQuery;
    }

    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().get(
          '/messages/contacts',
          queryParameters: queryParams,
        );
      },
      fromData: (data) {
        final contacts = data['data'] as List;
        return contacts.map((json) => Contact.fromJson(json)).toList();
      },
    );
  }

  /// Create or get existing conversation
  Future<ApiResponse<Conversation>> createOrGetConversation({
    required String participantId,
    required ContactType participantType,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).post(
          '/chat/conversations',
          data: {
            'participantId': participantId,
            'participantType': participantType.name,
          },
        );
      },
      fromData: (data) {
        log("data: ${data['data']}");
        return Conversation.fromJson(data['data']);
      },
    );
  }

  /// Generate Google Meet link
  Future<ApiResponse<String>> generateMeetLink() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().post('/messages/meet/generate');
      },
      fromData: (data) => data['data']['meetLink'] as String,
    );
  }

  /// Search messages within a conversation
  Future<ApiResponse<List<ChatMessage>>> searchMessages({
    required String conversationId,
    required String query,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().get(
          '/messages/conversations/$conversationId/search',
          queryParameters: {'q': query},
        );
      },
      fromData: (data) {
        final messages = data['data'] as List;
        return messages.map((json) => ChatMessage.fromJson(json)).toList();
      },
    );
  }

  /// Toggle mute conversation
  Future<ApiResponse<bool>> toggleMuteConversation({
    required String conversationId,
    required bool isMuted,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().patch(
          '/messages/conversations/$conversationId/mute',
          data: {'isMuted': isMuted},
        );
      },
      fromData: (data) => data['success'] as bool? ?? true,
    );
  }

  /// Toggle pin conversation
  Future<ApiResponse<bool>> togglePinConversation({
    required String conversationId,
    required bool isPinned,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().patch(
          '/messages/conversations/$conversationId/pin',
          data: {'isPinned': isPinned},
        );
      },
      fromData: (data) => data['success'] as bool? ?? true,
    );
  }

  /// Delete conversation
  Future<ApiResponse<bool>> deleteConversation(String conversationId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client().delete(
          '/messages/conversations/$conversationId',
        );
      },
      fromData: (data) => data['success'] as bool? ?? true,
    );
  }
}
