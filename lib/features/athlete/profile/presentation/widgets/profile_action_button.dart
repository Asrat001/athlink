import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool isBordered;

  const ProfileActionButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    this.isBordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: isBordered
              ? Border.all(color: AppColors.white.withValues(alpha: 0.38))
              : null,
        ),
        child: CustomText(
          title: title,
          textColor: AppColors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class QuickActionTile extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const QuickActionTile({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: AppColors.darkGreyCard,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.05)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 12),
            CustomText(
              title: label,
              fontSize: 14,
              textColor: AppColors.orangeGradientStart,
            ),
          ],
        ),
      ),
    );
  }
}
