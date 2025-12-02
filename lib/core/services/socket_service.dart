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

    _socket!.onConnect((_) {
      print('Socket Connected');
    });

    _socket!.onDisconnect((_) {
      print('Socket Disconnected');
    });

    _socket!.onConnectError((data) {
      print('Socket Connection Error: $data');
    });
  }

  // Send a message
  void sendMessage({
    required String conversationId,
    required String content,
    required String type,
    Function(dynamic)? onResponse,
  }) {
    _socket?.emitWithAck(
      'message:send',
      {'conversationId': conversationId, 'content': content, 'type': type},
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
      print('🔌 SOCKET EVENT: message:new received');
      print('Data: $data');
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
    print('🔌 Emitting conversation:join for $conversationId');
    if (_socket?.connected == true) {
      _socket?.emit('conversation:join', {'conversationId': conversationId});
    } else {
      print('❌ Socket not connected when trying to join conversation');
    }
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
    Function(String conversationId) onStart,
    Function(String conversationId) onStop,
  ) {
    _socket?.on('typing:start', (data) {
      if (data != null && data['conversationId'] != null) {
        onStart(data['conversationId']);
      }
    });

    _socket?.on('typing:stop', (data) {
      if (data != null && data['conversationId'] != null) {
        onStop(data['conversationId']);
      }
    });
  }

  // Disconnect
  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }
}
