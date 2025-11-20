import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ChatBubbleText extends StatelessWidget {
  final ChatMessage message;

  const ChatBubbleText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.fromMe;
    final radius = BorderRadius.only(
      topLeft: Radius.circular(isMe ? 12 : 6),
      topRight: Radius.circular(isMe ? 6 : 12),
      bottomLeft: const Radius.circular(12),
      bottomRight: const Radius.circular(12),
    );

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: isMe ? 60 : 12,
          right: isMe ? 12 : 60,
          top: 8,
          bottom: 6,
        ),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.72,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: isMe ? AppColors.extraLightGreen : AppColors.white,
                borderRadius: radius,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.03),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CustomText(
                title: message.text ?? '',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            CustomText(
              title: message.time ?? '',
              fontSize: 11,
              fontWeight: FontWeight.w400,
              textColor: AppColors.grey600,
            ),
          ],
        ),
      ),
    );
  }
}
