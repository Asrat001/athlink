import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/video_preview_dialog.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Job card widget displaying job information
class JobCard extends StatefulWidget {
  final Map<String, dynamic> job;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const JobCard({
    super.key,
    required this.job,
    required this.onTap,
    this.onDelete,
    this.onEdit,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  VideoPlayerController? _videoController;
  bool _videoInitialized = false;

  String get _mediaUrl => widget.job["mediaUrl"] as String? ?? '';
  String get _videoUrl => widget.job["videoUrl"] as String? ?? '';
  bool get _hasImage => _mediaUrl.isNotEmpty;
  bool get _hasVideo => _videoUrl.isNotEmpty;

  @override
  void initState() {
    super.initState();
    if (_hasVideo) {
      _initVideo();
    }
  }

  Future<void> _initVideo() async {
    try {
      _videoController = VideoPlayerController.networkUrl(Uri.parse(_videoUrl));
      await _videoController!.initialize();
      _videoController!.setLooping(true);
      _videoController!.setVolume(0);
      _videoController!.play();
      if (mounted) setState(() => _videoInitialized = true);
    } catch (e) {
      debugPrint('Job card video error: $e');
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
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Media section: video or image
            if (_hasVideo) ...[
              _buildVideoPreview(),
              const SizedBox(height: 16),
            ] else if (_hasImage) ...[
              _buildImageThumbnail(),
              const SizedBox(height: 16),
            ],

            // Header row
            _buildHeader(context),
            const SizedBox(height: 16),

            // Price + title
            _buildPriceAndTitle(),

            const SizedBox(height: 12),
            const Divider(color: AppColors.extraLightGrey, height: 1),
            const SizedBox(height: 12),

            // Tags
            _buildTags(),

            const SizedBox(height: 20),

            // Action icons
            _buildActionIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPreview() {
    return GestureDetector(
      onTap: () {
        VideoPreviewDialog.show(context, videoUrl: _videoUrl);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: double.infinity,
          height: 180,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Video or placeholder
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
                  color: AppColors.black.withValues(alpha: 0.05),
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
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

  Widget _buildImageThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        _mediaUrl,
        width: double.infinity,
        height: 160,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.lightGrey, width: 2),
                ),
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.black,
                  backgroundImage: NetworkImage(widget.job["agencyLogo"]),
                  onBackgroundImageError: (_, __) =>
                      const Icon(Icons.work, color: AppColors.white),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 4,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        // Title + subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: widget.job["agencyName"],
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            CustomText(
              title: widget.job["location"],
              fontSize: 14,
              textColor: AppColors.grey,
            ),
          ],
        ),
        const Spacer(),

        // More icon with PopupMenu
        PopupMenuButton<String>(
          icon: const Icon(
            Icons.more_vert,
            size: 22,
            color: AppColors.lightGrey,
          ),
          onSelected: (value) {
            if (value == 'delete' && widget.onDelete != null) {
              widget.onDelete!();
            } else if (value == 'edit' && widget.onEdit != null) {
              widget.onEdit!();
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit_outlined, color: AppColors.primary, size: 20),
                  SizedBox(width: 8),
                  CustomText(title: 'Edit', textColor: AppColors.primary),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete_outline, color: AppColors.red, size: 20),
                  SizedBox(width: 8),
                  CustomText(title: 'Delete', textColor: AppColors.red),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceAndTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: widget.job["price"],
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        const SizedBox(height: 6),
        CustomText(
          title: widget.job["title"],
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ],
    );
  }

  Widget _buildTags() {
    final tags = widget.job["tags"] as List;
    if (tags.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: tags
          .map<Widget>(
            (tag) =>
                CustomText(title: tag, fontSize: 12, textColor: AppColors.blue),
          )
          .toList(),
    );
  }

  Widget _buildActionIcons() {
    return CustomText(
      title: widget.job["endDate"] ?? "End: TBD",
      fontSize: 14,
      textColor: AppColors.grey,
      fontWeight: FontWeight.w500,
    );
  }
}
