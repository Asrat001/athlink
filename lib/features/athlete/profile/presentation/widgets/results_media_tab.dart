import 'dart:io';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

class ResultMediaTab extends StatelessWidget {
  final List<File> mediaFiles;
  final VoidCallback onUpload;
  final Function(int index) onDelete;

  const ResultMediaTab({
    super.key,
    required this.mediaFiles,
    required this.onUpload,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (mediaFiles.isEmpty) return _buildEmptyState();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: mediaFiles.length + 1,
      itemBuilder: (context, index) {
        // The last item is always the "Add More" button
        if (index == mediaFiles.length) {
          return _buildAddMoreButton();
        }

        return _buildMediaItem(index);
      },
    );
  }

  Widget _buildMediaItem(int index) {
    return Stack(
      children: [
        // The Image
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(mediaFiles[index], fit: BoxFit.cover),
          ),
        ),

        // The Cancel/Delete Icon
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => onDelete(index),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: AppColors.white, size: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddMoreButton() {
    return GestureDetector(
      onTap: onUpload,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGreyCard,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
        ),
        child: const Icon(Icons.add, color: AppColors.white, size: 30),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: GestureDetector(
        onTap: onUpload,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                color: AppColors.orangeGradientStart,
                size: 40,
              ),
              SizedBox(height: 12),
              CustomText(
                title: "Upload Media",
                fontSize: 16,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 8),
              CustomText(
                title: "Select photos or videos from your gallery",
                fontSize: 12,
                textColor: Colors.white38,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
