import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Image.asset('assets/images/back.png'),
              onPressed: onBack ?? () => Navigator.pop(context),
              padding: const EdgeInsets.only(left: 12, right: 12),
              constraints: const BoxConstraints(),
            ),

            // Centered title
            CustomText(
              title: title.toUpperCase(),

              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              textColor: AppColors.black,
            ),

            // Placeholder to center the title
            const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
