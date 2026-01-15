import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGreyCard,
      body: SizedBox.expand(
        child: Center(
          child: CustomText(title: "Coming soon", textColor: AppColors.white),
        ),
      ),
    );
  }
}
