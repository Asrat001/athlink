import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PostsHeader extends StatelessWidget {
  final VoidCallback onAddPressed;
  final bool isSelf;
  final bool isDarkMode;

  const PostsHeader({
    super.key,
    required this.onAddPressed,
    this.isSelf = true,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              title: "Posts",
              fontSize: 20,
              textColor: isDarkMode ? Colors.white : AppColors.black,
            ),
          ),
          if (isSelf)
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
                color: isDarkMode ? Colors.white : AppColors.black,
              ),
              onPressed: onAddPressed,
            ),
        ],
      ),
    );
  }
}
