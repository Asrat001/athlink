import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final bool isOrange;
  const InfoTile({
    required this.label,
    required this.value,
    this.isOrange = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(title: label, fontSize: 12, textColor: Colors.white38),
        const SizedBox(height: 8),
        CustomText(
          title: value,
          fontSize: 16,
          textColor: isOrange ? AppColors.orangeGradientStart : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
