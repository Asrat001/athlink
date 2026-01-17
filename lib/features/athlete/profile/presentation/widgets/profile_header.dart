import 'dart:io';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onPickImage;
  final VoidCallback onPickCover;
  final File? localImage;
  final File? localCoverImage;
  final String? remoteImageUrl;
  final String? remoteCoverUrl;

  const ProfileHeader({
    super.key,
    required this.isEditing,
    required this.onPickImage,
    required this.onPickCover,
    this.localImage,
    this.localCoverImage,
    this.remoteImageUrl,
    this.remoteCoverUrl,
  });

  ImageProvider _getProfileImage() {
    if (localImage != null) return FileImage(localImage!);
    if (remoteImageUrl != null && remoteImageUrl!.isNotEmpty) {
      return NetworkImage('$fileBaseUrl$remoteImageUrl');
    }
    return const AssetImage('assets/images/default-athlete-icon.jpg');
  }

  ImageProvider _getCoverImage() {
    if (localCoverImage != null) return FileImage(localCoverImage!);
    if (remoteCoverUrl != null && remoteCoverUrl!.isNotEmpty) {
      return NetworkImage('$fileBaseUrl$remoteCoverUrl');
    }
    return const AssetImage('assets/images/default-athlete-cover.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: isEditing ? onPickCover : null,
          child: Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _getCoverImage(),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.6, 1.0],
                  colors: [
                    AppColors.transparent,
                    AppColors.black.withValues(alpha: 0.3),
                    AppColors.black,
                  ],
                ),
              ),
              child: isEditing
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: AppColors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            CustomText(
                              title: "Change Cover",
                              fontSize: 12,
                              textColor: AppColors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),

        Positioned(
          bottom: -45,
          left: 20,
          child: GestureDetector(
            onTap: isEditing ? onPickImage : null,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.darkGreyCard,
                    backgroundImage: _getProfileImage(),
                  ),
                  if (isEditing)
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.white,
                            size: 24,
                          ),
                          SizedBox(height: 4),
                          CustomText(
                            title: "Change Photo",
                            fontSize: 10,
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
