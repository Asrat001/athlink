import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EmptyPostsState extends StatelessWidget {
  final bool isDarkMode;

  const EmptyPostsState({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: CustomText(
        title: "No posts yet",
        fontSize: 14,
        textColor: isDarkMode ? Colors.white54 : AppColors.textGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}
