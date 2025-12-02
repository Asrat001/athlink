import 'package:athlink/di.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/date_formatter.dart';

class ChatBubbleFile extends StatelessWidget {
  final ChatMessage message;

  const ChatBubbleFile({super.key, required this.message});

  void _openFile(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<LocalStorageService>().getUserData()?.id ?? '';
    final isMe = message.isFromMe(currentUserId);
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
            GestureDetector(
              onTap: () => _openFile(context),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.72,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isMe
                      ? AppColors.extraLightGreen
                      : AppColors.lightGreen,
                  borderRadius: radius,
                  border: Border.all(
                    color: isMe ? AppColors.primary : AppColors.success,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: isMe
                          ? AppColors.primary
                          : AppColors.success,
                      child: const Icon(
                        Icons.description,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: message.fileName ?? 'File',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.textPrimary,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4),
                          CustomText(
                            title: "${message.fileSize} ${message.fileType}",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.grey600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            CustomText(
              title: DateFormatter.formatDateTime(message.createdAt),
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
