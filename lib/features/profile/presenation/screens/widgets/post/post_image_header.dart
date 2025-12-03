import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class PostImageHeader extends StatelessWidget {
  final String imageUrl;

  const PostImageHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.network(
            imageUrl,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          top: 12,
          left: 12,
          child: ActiveBadge(),
        ),
      ],
    );
  }
}

class ActiveBadge extends StatelessWidget {
  const ActiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const CustomText(
        title: 'Active',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        textColor: AppColors.black,
      ),
    );
  }
}