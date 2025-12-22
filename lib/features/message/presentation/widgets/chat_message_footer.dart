import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:flutter/material.dart';

/// A reusable footer widget for chat messages showing timestamp and status.
///
/// Displays:
/// - Smart contextual timestamp (Today: "2:30 PM", Yesterday: "Yesterday, 2:30 PM", etc.)
/// - Message status indicator with appropriate icon (sending, sent, delivered, read)
class ChatMessageFooter extends StatelessWidget {
  final ChatMessage message;
  final bool isMe;

  const ChatMessageFooter({
    super.key,
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormatter.formatChatTimestamp(message.createdAt),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.grey600,
            ),
          ),
          const SizedBox(width: 4),
          _buildStatusIcon(),
        ],
      ),
    );
  }

  Widget _buildStatusIcon() {
    final status = message.status;

    switch (status) {
      case 'sending':
        return SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: AppColors.grey600,
          ),
        );
      case 'sent':
        return const Icon(Icons.check, size: 14, color: AppColors.grey600);
      case 'delivered':
        return const Icon(Icons.done_all, size: 14, color: AppColors.grey600);
      case 'read':
        return Icon(
          Icons.done_all,
          size: 14,
          color: isMe ? AppColors.primary : AppColors.success,
        );
      default:
        return const Icon(Icons.check, size: 14, color: AppColors.grey600);
    }
  }
}
