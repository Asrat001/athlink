import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String label;
  final String value;
  const StatItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
      return Column(
      children: [
        CustomText(title: label, fontSize: 14, textColor: AppColors.grey),
        const SizedBox(height: 6),
        CustomText(title: value, fontSize: 18, fontWeight: FontWeight.w700),
      ],
    );
  }
}