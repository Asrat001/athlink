
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ChatSeparator extends StatelessWidget {
  final String label;
  final bool isHelper;

  const ChatSeparator({
    super.key,
    required this.label,
    required this.isHelper,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.greyBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomText(
            title: label,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            textColor: AppColors.grey600,
          ),
        ),
      ),
    );
  }
}