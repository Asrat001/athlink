import 'dart:io';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onPickImage;
  final File? localImage;

  const ProfileHeader({
    super.key,
    required this.isEditing,
    required this.onPickImage,
    this.localImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/default-athlete-cover.jpg'),
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
                    backgroundImage: localImage != null
                        ? FileImage(localImage!) as ImageProvider
                        : const AssetImage(
                            'assets/images/default-athlete-icon.jpg',
                          ),
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
