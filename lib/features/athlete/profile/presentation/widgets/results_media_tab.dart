import 'dart:io';
import 'package:athlink/shared/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

class ResultMediaTab extends StatelessWidget {
  final List<File> mediaFiles;
  final List<String> mediaUrls;
  final VoidCallback? onUpload;
  final Function(int index, bool isFile)? onDelete;
  final bool isSelf;

  const ResultMediaTab({
    super.key,
    required this.mediaFiles,
    this.mediaUrls = const [],
    this.onUpload,
    this.onDelete,
    this.isSelf = true,
  });

  @override
  Widget build(BuildContext context) {
    final totalItems = mediaFiles.length + mediaUrls.length;
    if (totalItems == 0) return _buildEmptyState();

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      // If not self, don't add the extra slot for the "Add" button
      itemCount: isSelf ? totalItems + 1 : totalItems,
      itemBuilder: (context, index) {
        if (isSelf && index == totalItems) {
          return _buildAddMoreButton();
        }

        // Determine if the item is a URL or a File
        // URLs come first, then Files
        if (index < mediaUrls.length) {
          return _buildMediaItem(index, isFile: false);
        } else {
          return _buildMediaItem(index - mediaUrls.length, isFile: true);
        }
      },
    );
  }

  Widget _buildMediaItem(int index, {required bool isFile}) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isFile
                ? Image.file(mediaFiles[index], fit: BoxFit.cover)
                : Image.network(
                    fileBaseUrl + mediaUrls[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: AppColors.white,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.darkGreyCard,
                      child: const Icon(Icons.error, color: AppColors.error),
                    ),
                  ),
          ),
        ),

        // Only show delete icon if it's the user's own profile
        if (isSelf && onDelete != null)
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => onDelete!(index, isFile),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: AppColors.white,
                  size: 16,
                ),
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
        onTap: isSelf ? onUpload : null, // Disable tap for viewers
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.white.withValues(alpha: 0.1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelf
                    ? Icons.cloud_upload_outlined
                    : Icons.image_not_supported_outlined,
                color: AppColors.orangeGradientStart,
                size: 40,
              ),
              const SizedBox(height: 12),
              CustomText(
                title: isSelf ? "Upload Media" : "No Media Available",
                fontSize: 16,
                textColor: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              CustomText(
                title: isSelf
                    ? "Select photos or videos from your gallery"
                    : "The athlete hasn't uploaded any media for this result yet.",
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
