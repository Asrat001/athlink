import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';

class CampaignSectionTile extends StatelessWidget {
  final String title;
  final String description;
  final String buttonLabel;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onTap;

  const CampaignSectionTile({
    super.key,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.isExpanded,
    required this.onToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: title,
                  fontSize: 16,
                  textColor: AppColors.lightGrey,
                  fontWeight: FontWeight.w400,
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          CustomText(
            title: description,
            fontSize: 14,
            textColor: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 24),
          RoundedButton(
            label: buttonLabel,
            onPressed: onTap,
            icon: const Icon(Icons.add, color: AppColors.white, size: 18),
            backgroundColor: AppColors.darkGreyCard.withOpacity(0.5),
            height: 48,
          ),
        ],
      ],
    );
  }
}
