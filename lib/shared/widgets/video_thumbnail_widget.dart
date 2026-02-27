import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/video_preview_dialog.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoThumbnailWidget extends StatefulWidget {
  final String videoUrl;
  final double height;
  final double width;
  final bool isDarkMode;

  const VideoThumbnailWidget({
    super.key,
    required this.videoUrl,
    this.height = 180,
    this.width = 280,
    this.isDarkMode = false,
  });

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  VideoPlayerController? _videoController;
  bool _videoInitialized = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );
      await _videoController!.initialize();
      // Notice: explicitly *not* calling .play() to prevent autoplay
      if (mounted) setState(() => _videoInitialized = true);
    } catch (e) {
      debugPrint('Video thumbnail init error: $e');
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        VideoPreviewDialog.show(context, videoUrl: widget.videoUrl);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Video thumbnail or placeholder
              if (_videoInitialized && _videoController != null)
                FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    width: _videoController!.value.size.width,
                    height: _videoController!.value.size.height,
                    child: VideoPlayer(_videoController!),
                  ),
                )
              else
                Container(
                  color: widget.isDarkMode
                      ? Colors.white10
                      : AppColors.black.withValues(alpha: 0.05),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: widget.isDarkMode
                          ? Colors.white54
                          : AppColors.primary,
                    ),
                  ),
                ),
              // Play button overlay
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
