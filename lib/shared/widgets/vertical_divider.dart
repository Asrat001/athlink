import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 50,
      color: AppColors.grey,
    );
  }
}