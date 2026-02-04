import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileEditSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController bioController;

  const ProfileEditSection({
    super.key,
    required this.nameController,
    required this.locationController,
    required this.bioController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          title: 'Edit Your Profile',
          fontSize: 22,
          textColor: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 25),
        _buildLabel("Full Name"),
        CustomTextField(
          label: 'Enter your full name',
          controller: nameController,
          borderRadius: 12,
          textColor: AppColors.white,
          cursorColor: AppColors.white,
          inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],
        ),
        const SizedBox(height: 16),
        _buildLabel("Location"),
        CustomTextField(
          label: 'Enter your location',
          controller: locationController,
          borderRadius: 12,
          textColor: AppColors.white,
          cursorColor: AppColors.white,
        ),
        const SizedBox(height: 16),
        _buildLabel("Bio"),
        CustomTextField(
          label: 'Add some details about yourself',
          controller: bioController,
          borderRadius: 12,
          textColor: AppColors.white,
          cursorColor: AppColors.white,
          maxLines: 4,
        ),
      ],
    );
  }

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8, left: 4),
    child: CustomText(
      title: text,
      fontSize: 14,
      textColor: AppColors.white.withValues(alpha: 0.6),
    ),
  );
}
