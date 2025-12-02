# Socket.IO Service Usage Guide

## Provider Setup

The `SocketIoService` is registered as a `FutureProvider` because it needs to asynchronously fetch the auth token from `LocalStorageService`:

```dart
final socketServiceProvider = FutureProvider<SocketIoService>((ref) async {
  final service = SocketIoService();
  final token = await sl<LocalStorageService>().getAccessToken();
  if (token != null && token.isNotEmpty) {
    service.initConnection(token);
  }
  ref.onDispose(() => service.disconnect());
  return service;
});
```

## Usage in UI

### 1. Basic Usage (Watching the Provider)

```dart
class ChatDetailScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socketAsync = ref.watch(socketServiceProvider);
    
    return socketAsync.when(
      data: (socketService) {
        // Socket is ready, use it here
        return YourChatUI(socketService: socketService);
      },
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
```

### 2. Sending Messages

```dart
void sendMessage(WidgetRef ref, String conversationId, String message) {
  final socketAsync = ref.read(socketServiceProvider);
  
  socketAsync.whenData((socketService) {
    socketService.sendMessage(
      conversationId: conversationId,
      content: message,
      type: 'text',
      onResponse: (response) {
        if (response['success']) {
          print('Message sent successfully');
        } else {
          print('Error: ${response['error']}');
        }
      },
    );
  });
}
```

### 3. Listening for New Messages

```dart
@override
void initState() {
  super.initState();
  
  // Listen for new messages
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ref.read(socketServiceProvider).whenData((socketService) {
      socketService.onMessageReceived((message) {
        // Handle new message
        print('New message: ${message.content}');
        // Update your state/UI here
      });
    });
  });
}
```

### 4. Join/Leave Conversation

```dart
// When entering chat screen
ref.read(socketServiceProvider).whenData((socketService) {
  socketService.joinConversation(conversationId);
});

// When leaving chat screen
@override
void dispose() {
  ref.read(socketServiceProvider).whenData((socketService) {
    socketService.leaveConversation(conversationId);
  });
  super.dispose();
}
```

### 5. Typing Indicators

```dart
// When user starts typing
void onTypingStart(WidgetRef ref, String conversationId) {
  ref.read(socketServiceProvider).whenData((socketService) {
    socketService.sendTypingStart(conversationId);
  });
}

// When user stops typing (use a debouncer)
void onTypingStop(WidgetRef ref, String conversationId) {
  ref.read(socketServiceProvider).whenData((socketService) {
    socketService.sendTypingStop(conversationId);
  });
}

// Listen for typing from other users
ref.read(socketServiceProvider).whenData((socketService) {
  socketService.onTyping(
    (conversationId) => print('User is typing in $conversationId'),
    (conversationId) => print('User stopped typing in $conversationId'),
  );
});
```

## Important Notes

1. **FutureProvider**: Since we use `FutureProvider`, you must handle the async state with `.when()` or `.whenData()`.
2. **Auto-dispose**: The socket automatically disconnects when the provider is disposed.
3. **Token Refresh**: If the token changes (e.g., after re-login), you may need to invalidate the provider:
   ```dart
   ref.invalidate(socketServiceProvider);
   ```
4. **Error Handling**: Always check the response in callbacks to handle errors gracefully.
