import 'package:athlink/di.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/message/domain/models/chat_attachment.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/presentation/widgets/chat_message_footer.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class ChatBubbleFile extends StatelessWidget {
  final ChatMessage message;

  const ChatBubbleFile({super.key, required this.message});

  void _openFile(BuildContext context, ChatAttachment? attachment) async {
    if (attachment != null) {
      final complitePath = fileBaseUrl + attachment.url;
      try {
        AppHelpers.showLoadingToast(context, "Opening file");
        final dir = await getTemporaryDirectory();
        final fileName =
            attachment.filename ?? 'document.${attachment.type ?? 'pdf'}';
        final filePath = '${dir.path}/$fileName';
        await Dio().download(complitePath, filePath);
        final result = await OpenFilex.open(filePath);
        if (result.type != ResultType.done && context.mounted) {
          AppHelpers.showErrorFlash(context, 'No app found to open this file');
        }
      } catch (e) {
        if (context.mounted) {
          AppHelpers.showErrorToast(context, "Failed to open file");
        }
      }
    } else {
      if (context.mounted) {
        AppHelpers.showErrorToast(context, "Attachment not found");
      }
    }
  }

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
            ListView.builder(
              shrinkWrap: true,
              itemCount: message.media?.length ?? 0,
              itemBuilder: (context, index) {
                final attachment = message.media?[index];
                return GestureDetector(
                  onTap: () => _openFile(context, attachment),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.72,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe
                          ? AppColors.extraLightGreen
                          : AppColors.lightBackground,
                      borderRadius:
                          message.media != null && message.media!.length > 1
                          ? BorderRadius.circular(0)
                          : radius,
                      border: Border.all(
                        color: isMe ? AppColors.primary : AppColors.success,
                        width:
                            message.media != null && message.media!.length > 1
                            ? 0
                            : 1,
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
                                title: attachment?.filename ?? 'File',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                textColor: AppColors.textPrimary,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              CustomText(
                                title:
                                    "${AppHelpers.formatFileSize(attachment?.size)} • ${attachment?.type ?? "file"}",
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
                );
              },
            ),
            ChatMessageFooter(message: message, isMe: isMe),
          ],
        ),
      ),
    );
  }
}
