import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfilePrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;
  final bool isBordered;

  const ProfilePrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.color,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            border: isBordered
                ? Border.all(color: AppColors.white.withValues(alpha: 0.38))
                : null,
          ),
          child: Container(
            height: 52,
            alignment: Alignment.center,
            child: CustomText(
              title: label,
              textColor: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
