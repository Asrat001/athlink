import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EmptyPostsState extends StatelessWidget {
  const EmptyPostsState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40.0),
      child: CustomText(
        title: "No posts yet",
        fontSize: 14,
        textColor: AppColors.textGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}