import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String value;
  final String label;
  final Color? textColor;

  const InfoItem({
    super.key,
    required this.value,
    required this.label,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          title: value,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          textColor: textColor ?? AppColors.primary,
        ),
        const SizedBox(height: 4),
        CustomText(
          title: label,
          fontSize: 12,
          textColor: textColor ?? AppColors.grey,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
