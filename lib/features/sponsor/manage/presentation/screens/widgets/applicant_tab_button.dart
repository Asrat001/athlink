import 'package:athlink/features/sponsor/manage/presentation/screens/manage_enums.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// Tab button for applicant view
class ApplicantTabButton extends StatelessWidget {
  final ApplicantTab tab;
  final ApplicantTab activeTab;
  final String label;
  final VoidCallback onTap;

  const ApplicantTabButton({
    super.key,
    required this.tab,
    required this.activeTab,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = activeTab == tab;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.greyScaffoldBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: CustomText(
              title: label,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              textColor: isActive ? AppColors.black : AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
