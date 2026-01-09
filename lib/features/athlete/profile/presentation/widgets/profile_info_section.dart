import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileInfoSection extends StatelessWidget {
  final bool isEditing;
  final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController bioController;
  final VoidCallback onEditToggle;

  const ProfileInfoSection({
    super.key,
    required this.isEditing,
    required this.nameController,
    required this.locationController,
    required this.bioController,
    required this.onEditToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (!isEditing) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  title: nameController.text,
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
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  'https://flagcdn.com/w40/sn.png',
                  width: 22,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.flag,
                    size: 18,
                    color: AppColors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CustomText(
                title: locationController.text,
                fontSize: 14,
                textColor: AppColors.orangeGradientStart,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomText(
            title: bioController.text,
            fontSize: 15,
            textColor: AppColors.white.withValues(alpha: 0.7),
            fontWeight: FontWeight.w400,
          ),
        ],
      );
    }

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
          label: 'Mariya Osteen',
          controller: nameController,
          borderRadius: 12,
          textColor: AppColors.white,
        ),
        const SizedBox(height: 16),
        _buildLabel("Location"),
        CustomTextField(
          label: 'Los Angeles, CA',
          controller: locationController,
          borderRadius: 12,
          textColor: AppColors.white,
        ),
        const SizedBox(height: 16),
        _buildLabel("Bio"),
        CustomTextField(
          label: 'Add some details about yourself',
          controller: bioController,
          borderRadius: 12,
          textColor: AppColors.white,
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
