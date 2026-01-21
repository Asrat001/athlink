import 'package:athlink/features/message/domain/models/chat_attachment.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIoService {
  io.Socket? _socket;
  final String _baseUrl = "http://139.59.141.150:4000";

  // Initialize connection
  void initConnection(String token) {
    if (_socket != null && _socket!.connected) return;

    _socket = io.io(
      _baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'token': token})
          .disableAutoConnect()
          .build(),
    );

    _socket!.connect();

    _socket!.onConnect((_) {});

    _socket!.onDisconnect((_) {});

    _socket!.onConnectError((data) {});
  }

  // Send a message
  void sendMessage({
    required String conversationId,
    required String content,
    required String type,
    List<ChatAttachment>? mediaUrls,
    Function(dynamic)? onResponse,
  }) {
    _socket?.emitWithAck(
      'message:send',
      {
        'conversationId': conversationId,
        'content': content,
        'type': type,
        'media': mediaUrls,
      },
      ack: (response) {
        if (onResponse != null) {
          onResponse(response);
        }
      },
    );
  }

  // Listen for new messages
  void onMessageReceived(Function(ChatMessage) callback) {
    _socket?.on('message:new', (data) {
      try {
        final message = ChatMessage.fromJson(data);
        callback(message);
      } catch (e) {
        print('Error parsing new message: $e');
      }
    });
  }

  // Join conversation
  void joinConversation(String conversationId) {
    if (_socket?.connected == true) {
      _socket?.emit('conversation:join', {'conversationId': conversationId});
    } else {}
  }

  // Leave conversation
  void leaveConversation(String conversationId) {
    _socket?.emit('conversation:leave', {'conversationId': conversationId});
  }

  // Mark message as read
  void markMessageAsRead(String conversationId, String messageId) {
    _socket?.emit('message:read', {
      'conversationId': conversationId,
      'messageId': messageId,
    });
  }

  // Listen for read receipts
  void onMessageRead(Function(dynamic) callback) {
    _socket?.on('message:read', (data) {
      callback(data);
    });
  }

  // Typing indicators
  void sendTypingStart(String conversationId) {
    _socket?.emit('typing:start', {'conversationId': conversationId});
  }

  void sendTypingStop(String conversationId) {
    _socket?.emit('typing:stop', {'conversationId': conversationId});
  }

  void onTyping(
    Function(Map<String, dynamic> data) onStart,
    Function(Map<String, dynamic> data) onStop,
  ) {
    _socket?.on('typing:start', (data) {
      if (data != null) {
        onStart(Map<String, dynamic>.from(data));
      }
    });

    _socket?.on('typing:stop', (data) {
      if (data != null) {
        onStop(Map<String, dynamic>.from(data));
      }
    });
  }

  // Online Status
  void getOnlineStatus(
    List<String> userIds,
    Function(Map<String, bool>) onResult,
  ) {
    _socket?.emitWithAck(
      'users:getOnlineStatus',
      {'userIds': userIds},
      ack: (response) {
        if (response['success'] == true && response['data'] != null) {
          final data = Map<String, dynamic>.from(response['data']);
          final statusMap = data.map(
            (key, value) => MapEntry(key, value as bool),
          );
          onResult(statusMap);
        }
      },
    );
  }

  void onUserOnlineStatusChanged(
    Function(String userId, bool isOnline) callback,
  ) {
    _socket?.on('user:online', (data) {
      if (data != null && data['userId'] != null) {
        callback(data['userId'], true);
      }
    });

    _socket?.on('user:offline', (data) {
      if (data != null && data['userId'] != null) {
        callback(data['userId'], false);
      }
    });
  }

  // Connection Events
  /// Listen for connection request received
  void onConnectionRequest(
    Function(String connectionId, String requesterId) callback,
  ) {
    _socket?.on('connection:request', (data) {
      if (data != null &&
          data['connectionId'] != null &&
          data['requesterId'] != null) {
        callback(data['connectionId'], data['requesterId']);
      }
    });
  }

  /// Listen for connection accepted
  void onConnectionAccepted(
    Function(String connectionId, String acceptedBy) callback,
  ) {
    _socket?.on('connection:accepted', (data) {
      if (data != null &&
          data['connectionId'] != null &&
          data['acceptedBy'] != null) {
        callback(data['connectionId'], data['acceptedBy']);
      }
    });
  }

  /// Listen for connection rejected
  void onConnectionRejected(Function(String connectionId) callback) {
    _socket?.on('connection:rejected', (data) {
      if (data != null && data['connectionId'] != null) {
        callback(data['connectionId']);
      }
    });
  }

  // Disconnect
  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }
}
