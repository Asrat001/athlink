import 'package:athlink/di.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/presentation/widgets/chat_message_footer.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChatBubbleImage extends StatelessWidget {
  final ChatMessage message;

  const ChatBubbleImage({super.key, required this.message});

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

    final imageUrl = message.media?.firstOrNull?.url ?? '';
    final fullUrl = imageUrl.startsWith('http')
        ? imageUrl
        : fileBaseUrl + imageUrl;

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
              child: ClipRRect(
                borderRadius: radius,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Open full screen image
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: EdgeInsets.zero,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            InteractiveViewer(child: Image.network(fullUrl)),
                            Positioned(
                              top: 40,
                              right: 20,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Image.network(
                    fullUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 200,
                        width: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 150,
                        width: 200,
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            ChatMessageFooter(message: message, isMe: isMe),
          ],
        ),
      ),
    );
  }
}
