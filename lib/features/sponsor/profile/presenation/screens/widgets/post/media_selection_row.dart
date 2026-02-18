import 'dart:io';
import 'dart:typed_data';

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/video_preview_dialog.dart';
import 'package:flutter/material.dart';

class MediaSelectionRow extends StatelessWidget {
  final VoidCallback onImageSelected;
  final VoidCallback onVideoSelected;
  final Uint8List? imageBytes;
  final Uint8List? videoThumbnail;
  final File? selectedImage;
  final File? selectedVideo;
  final String? initialImageUrl;
  final String? initialVideoUrl;
  final VoidCallback onImageRemoved;
  final VoidCallback onVideoRemoved;

  const MediaSelectionRow({
    super.key,
    required this.onImageSelected,
    required this.onVideoSelected,
    required this.imageBytes,
    required this.videoThumbnail,
    required this.selectedImage,
    required this.selectedVideo,
    required this.initialImageUrl,
    required this.initialVideoUrl,
    required this.onImageRemoved,
    required this.onVideoRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MediaBox(
            icon: Icons.image_outlined,
            isImage: true,
            isSelected: selectedImage != null || initialImageUrl != null,
            thumbnail: imageBytes,
            imageUrl: initialImageUrl,
            onTap: onImageSelected,
            onRemove: onImageRemoved,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: MediaBox(
            icon: Icons.videocam_outlined,
            isImage: false,
            isSelected: selectedVideo != null || initialVideoUrl != null,
            thumbnail: videoThumbnail,
            imageUrl: initialVideoUrl,
            onTap: (selectedVideo != null || initialVideoUrl != null)
                ? () => VideoPreviewDialog.show(
                    context,
                    videoFile: selectedVideo,
                    videoUrl: initialVideoUrl,
                  )
                : onVideoSelected,
            onRemove: onVideoRemoved,
          ),
        ),
      ],
    );
  }
}

class MediaBox extends StatelessWidget {
  final IconData icon;
  final bool isImage;
  final bool isSelected;
  final Uint8List? thumbnail;
  final String? imageUrl;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const MediaBox({
    super.key,
    required this.icon,
    required this.isImage,
    required this.isSelected,
    required this.thumbnail,
    this.imageUrl,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.success.withValues(alpha: .3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            if (thumbnail != null && isSelected)
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Stack(
                  children: [
                    Image.memory(
                      thumbnail!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholderIcon(icon);
                      },
                    ),
                    if (!isImage)
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            else if (imageUrl != null && isSelected && isImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.network(
                  imageUrl!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderIcon(icon);
                  },
                ),
              )
            else if (imageUrl != null && isSelected && !isImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_circle_fill,
                            color: AppColors.primary,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Video',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              _buildPlaceholderIcon(icon),
            if (isSelected)
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 12,
                  ),
                ),
              ),
            if (isSelected)
              Positioned(
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: onRemove,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: AppColors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon(IconData icon) {
    return Center(child: Icon(icon, color: AppColors.lightGrey, size: 40));
  }
}
