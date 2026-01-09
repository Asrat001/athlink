import 'dart:io';
import 'dart:typed_data';

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MediaSelectionRow extends StatelessWidget {
  final VoidCallback onImageSelected;
  final VoidCallback onVideoSelected;
  final Uint8List? imageBytes;
  final Uint8List? videoThumbnail;
  final File? selectedImage;
  final File? selectedVideo;
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
            isSelected: selectedImage != null,
            thumbnail: imageBytes,
            onTap: onImageSelected,
            onRemove: onImageRemoved,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: MediaBox(
            icon: Icons.videocam_outlined,
            isImage: false,
            isSelected: selectedVideo != null,
            thumbnail: videoThumbnail,
            onTap: onVideoSelected,
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
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const MediaBox({
    super.key,
    required this.icon,
    required this.isImage,
    required this.isSelected,
    required this.thumbnail,
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
                child: Image.memory(
                  thumbnail!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderIcon(icon);
                  },
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
    return Center(
      child: Icon(
        icon,
        color: AppColors.lightGrey,
        size: 40,
      ),
    );
  }
}