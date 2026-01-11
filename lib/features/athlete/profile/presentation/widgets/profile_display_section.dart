import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileDisplaySection extends StatelessWidget {
  final ProfileModel profile;
  final VoidCallback onEditToggle;

  const ProfileDisplaySection({
    super.key,
    required this.profile,
    required this.onEditToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomText(
                title: profile.name,
                fontSize: 30,
                textColor: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: onEditToggle,
              icon: Icon(
                Icons.edit_outlined,
                color: AppColors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 18,
              color: AppColors.orangeGradientStart,
            ),
            const SizedBox(width: 8),
            CustomText(
              title: profile.location,
              fontSize: 14,
              textColor: AppColors.orangeGradientStart,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomText(
          title: profile.bio,
          fontSize: 15,
          textColor: AppColors.white.withValues(alpha: 0.7),
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
