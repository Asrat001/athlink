# ChatNotifier Usage Guide

## Overview
`ChatNotifier` manages the state for individual chat conversations with real-time Socket.IO integration.

## Provider Setup

The `chatProvider` uses `.family` to create separate instances for each conversation:

```dart
final chatProvider = StateNotifierProvider.family<ChatNotifier, ChatState, String>(
  (ref, conversationId) => ChatNotifier(
    repository: sl<ChatRepository>(),
    socketService: socketService,
    conversationId: conversationId,
  ),
);
```

## Usage in MessageDetailScreen

### 1. Basic Setup

```dart
class MessageDetailScreen extends ConsumerStatefulWidget {
  final String conversationId;
  
  const MessageDetailScreen({required this.conversationId});
  
  @override
  ConsumerState<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends ConsumerState<MessageDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider(widget.conversationId));
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        subtitle: _buildTypingIndicator(chatState),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList(chatState)),
          _buildMessageInput(),
        ],
      ),
    );
  }
}
```

### 2. Display Messages

```dart
Widget _buildMessageList(ChatState state) {
  return state.when(
    initial: () => const Center(child: Text('Loading...')),
    loading: (messages, typingUsers) => messages.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : _buildList(messages),
    loaded: (messages, typingUsers, hasMore, currentPage) {
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.extentAfter < 200 &&
              hasMore) {
            ref.read(chatProvider(widget.conversationId).notifier)
                .loadMoreMessages();
          }
          return false;
        },
        child: _buildList(messages),
      );
    },
    error: (message, messages, typingUsers) => Column(
      children: [
        if (messages.isNotEmpty) Expanded(child: _buildList(messages)),
        Text('Error: $message', style: TextStyle(color: Colors.red)),
      ],
    ),
  );
}

Widget _buildList(List<ChatMessage> messages) {
  return ListView.builder(
    reverse: true,
    itemCount: messages.length,
    itemBuilder: (context, index) {
      final message = messages[messages.length - 1 - index];
      return MessageBubble(message: message);
    },
  );
}
```

### 3. Send Message

```dart
void _sendMessage() {
  final content = _messageController.text.trim();
  if (content.isEmpty) return;
  
  ref.read(chatProvider(widget.conversationId).notifier)
      .sendMessage(content);
  
  _messageController.clear();
}

Widget _buildMessageInput() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (_) => _handleTyping(),
            decoration: InputDecoration(
              hintText: 'Type a message...',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _sendMessage,
        ),
      ],
    ),
  );
}
```

### 4. Typing Indicators

```dart
Timer? _typingDebounce;

void _handleTyping() {
  final notifier = ref.read(chatProvider(widget.conversationId).notifier);
  notifier.startTyping();
  
  _typingDebounce?.cancel();
  _typingDebounce = Timer(const Duration(seconds: 2), () {
    notifier.stopTyping();
  });
}

Widget? _buildTypingIndicator(ChatState state) {
  final typingUsers = state.maybeMap(
    loading: (s) => s.typingUsers,
    loaded: (s) => s.typingUsers,
    error: (s) => s.typingUsers,
    orElse: () => <String>[],
  );
  
  if (typingUsers.isEmpty) return null;
  
  return Text(
    'Someone is typing...',
    style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
  );
}

@override
void dispose() {
  _typingDebounce?.cancel();
  _messageController.dispose();
  super.dispose();
}
```

### 5. Load More Messages (Pagination)

```dart
// Automatically handled in NotificationListener above
// Or manually trigger:
void _loadMore() {
  ref.read(chatProvider(widget.conversationId).notifier)
      .loadMoreMessages();
}
```

## Key Features

✅ **Auto-initialization**: Joins conversation and loads messages on creation  
✅ **Real-time updates**: Listens for new messages via Socket.IO  
✅ **Typing indicators**: Debounced (2 seconds)  
✅ **Pagination**: Load more messages on scroll  
✅ **Read receipts**: Auto-marks messages as read  
✅ **Clean state**: Freezed union for type-safe state management  
✅ **Auto-cleanup**: Leaves conversation on dispose  

## State Structure

```dart
ChatState.initial()                          // Initial state
ChatState.loading(messages, typingUsers)     // Loading more messages
ChatState.loaded(messages, typingUsers, hasMore, currentPage)  // Success
ChatState.error(message, messages, typingUsers)  // Error (preserves messages)
```

## Important Notes

1. **Provider Family**: Each conversation gets its own notifier instance
2. **Auto-dispose**: Provider auto-disposes when no longer watched
3. **Message Order**: Messages are stored oldest-first, display newest-first
4. **Typing Debounce**: Built-in 2-second debounce for typing indicators
5. **Error Handling**: Errors preserve existing messages for better UX
