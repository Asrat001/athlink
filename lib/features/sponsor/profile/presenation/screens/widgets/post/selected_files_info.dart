import 'dart:io';

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SelectedFilesInfo extends StatelessWidget {
  final File? image;
  final File? video;
  final String? initialImageUrl;
  final String? initialVideoUrl;

  const SelectedFilesInfo({
    super.key,
    this.image,
    this.video,
    this.initialImageUrl,
    this.initialVideoUrl,
  });

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null)
          FileInfoItem(
            icon: Icons.image,
            name: image!.path.split('/').last,
            size: _formatFileSize(image!.lengthSync()),
            type: 'New Image',
          ),
        if (image == null && initialImageUrl != null)
          const FileInfoItem(
            icon: Icons.image,
            name: 'Existing Image',
            size: '',
            type: 'Image',
          ),
        if (video != null)
          FileInfoItem(
            icon: Icons.videocam,
            name: video!.path.split('/').last,
            size: _formatFileSize(video!.lengthSync()),
            type: 'New Video',
          ),
        if (video == null && initialVideoUrl != null)
          const FileInfoItem(
            icon: Icons.videocam,
            name: 'Existing Video',
            size: '',
            type: 'Video',
          ),
      ],
    );
  }
}

class FileInfoItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final String size;
  final String type;

  const FileInfoItem({
    super.key,
    required this.icon,
    required this.name,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.extraLightGrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '$type • $size',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
