# Read Receipts Optimization Proposal

## 🚨 Current Limitation
Currently, the client identifies all unread messages locally and emits a `message:read` socket event for **each individual message**.

### The Problem
- **Scalability**: If a user opens a conversation with 50 unread messages, the client emits **50 separate socket events**.
- **Performance**: This floods the server with requests and triggers 50 separate database updates and 50 separate broadcast events to the sender.
- **Race Conditions**: Rapid-fire updates can lead to inconsistent states or UI flickering on the sender's side.

---

## 🚀 Proposed Solution: "Mark Until" Strategy (Recommended)

Instead of marking messages individually, the client sends a single event indicating that the user has read up to a specific message. The backend then handles marking that message and all preceding ones as read.

### 1. New Socket Event
**Event Name**: `message:read:until`

**Payload**:
```json
{
  "conversationId": "conv_12345",
  "lastReadMessageId": "msg_98765",
  "userId": "user_abc"
}
```

### 2. Backend Logic
When receiving this event, the backend should:
1.  Identify the conversation and the user.
2.  Perform a bulk update in the database:
    ```javascript
    // Example Mongoose logic
    await Message.updateMany(
      {
        conversationId: conversationId,
        createdAt: { $lte: messageTimestamp }, // Or use _id if sortable
        sender: { $ne: userId }, // Don't mark own messages
        status: { $ne: 'read' }
      },
      { $set: { status: 'read' } }
    );
    ```
3.  **Broadcast a single event** to the sender (and other devices of the recipient) to update their UI:
    ```javascript
    io.to(senderId).emit('message:read:batch', {
      conversationId: conversationId,
      upToMessageId: lastReadMessageId,
      readBy: userId
    });
    ```

### 3. Client Logic (Mobile App)
- **On Conversation Open**: Client finds the **latest** unread message and emits `message:read:until` with its ID.
- **On New Message**: When a new message arrives via socket while the chat is open, client emits `message:read:until` (or the existing single `message:read`) for that new message.

---

## 📦 Alternative Solution: Batch IDs

If "Mark Until" is too complex due to timestamp/ordering logic, we can use a simple batch list.

**Event Name**: `message:read:batch`

**Payload**:
```json
{
  "conversationId": "conv_12345",
  "messageIds": ["msg_1", "msg_2", "msg_3", ...]
}
```

**Backend Logic**:
- `updateMany` where `_id` is in `messageIds`.
- Broadcast the list of IDs to the sender.

---

## ✅ Benefits
1.  **O(1) Network Calls**: 1 request per session instead of N.
2.  **Reduced DB Load**: 1 bulk update instead of N writes.
3.  **Cleaner UI**: Sender sees all ticks turn blue simultaneously.
