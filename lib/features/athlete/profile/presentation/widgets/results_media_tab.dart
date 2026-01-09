import 'dart:io';

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ResultMediaTab extends StatelessWidget {
  final List<File> mediaFiles;
  final VoidCallback onUpload;

  const ResultMediaTab({
    super.key,
    required this.mediaFiles,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    if (mediaFiles.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onUpload,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.cloud_upload_outlined,
                    color: AppColors.orangeGradientStart,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const CustomText(
                    title: "Upload Media",
                    fontSize: 16,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    title: "Click to upload images or videos\nfrom your device",
                    fontSize: 12,
                    textColor: AppColors.white.withValues(alpha: 0.38),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          CustomText(
            title: "No media uploaded yet.",
            fontSize: 14,
            textColor: AppColors.white.withValues(alpha: 0.38),
          ),
        ],
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      // +1 to show an "Add More" button at the end of the list
      itemCount: mediaFiles.length + 1,
      itemBuilder: (context, index) {
        if (index == mediaFiles.length) {
          return GestureDetector(
            onTap: onUpload,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkGreyCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
              ),
              child: const Icon(Icons.add, color: AppColors.white, size: 30),
            ),
          );
        }

        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.file(mediaFiles[index], fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: Container(color: AppColors.black.withValues(alpha: 0.1)),
              ),
            ],
          ),
        );
      },
    );
  }
}
