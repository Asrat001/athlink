import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  bool showBackButton = true;

  CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Icon(Icons.arrow_back),
      ),
      title: CustomText(
        title: title,

        textColor: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 1.4,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
