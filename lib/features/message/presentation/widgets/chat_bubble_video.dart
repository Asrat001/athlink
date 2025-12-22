import 'dart:io';
import 'package:athlink/di.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/presentation/widgets/chat_message_footer.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ChatBubbleVideo extends StatefulWidget {
  final ChatMessage message;

  const ChatBubbleVideo({super.key, required this.message});

  @override
  State<ChatBubbleVideo> createState() => _ChatBubbleVideoState();
}

class _ChatBubbleVideoState extends State<ChatBubbleVideo> {
  String? _thumbnailPath;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _generateThumbnail();
  }

  Future<void> _generateThumbnail() async {
    try {
      final imageUrl = widget.message.media?.firstOrNull?.url ?? '';
      if (imageUrl.isEmpty) return;

      final fullUrl = imageUrl.startsWith('http')
          ? imageUrl
          : fileBaseUrl + imageUrl;

      final fileName = await VideoThumbnail.thumbnailFile(
        video: fullUrl,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
        maxHeight: 200,
        quality: 75,
      );

      if (mounted) {
        setState(() {
          _thumbnailPath = fileName;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error generating thumbnail: $e");
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _launchVideo() async {
    final imageUrl = widget.message.media?.firstOrNull?.url ?? '';
    if (imageUrl.isEmpty) return;

    final fullUrl = imageUrl.startsWith('http')
        ? imageUrl
        : fileBaseUrl + imageUrl;
    final uri = Uri.parse(fullUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not launch video')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<LocalStorageService>().getUserData()?.id ?? '';
    final isMe = widget.message.isFromMe(currentUserId);
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
                  onTap: _launchVideo,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_thumbnailPath != null)
                        Image.file(
                          File(_thumbnailPath!),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        )
                      else
                        Container(
                          width: 200,
                          height: 200,
                          color: Colors.black12,
                          child: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : const Icon(
                                  Icons.videocam_off,
                                  color: Colors.grey,
                                ),
                        ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ChatMessageFooter(message: widget.message, isMe: isMe),
          ],
        ),
      ),
    );
  }
}
