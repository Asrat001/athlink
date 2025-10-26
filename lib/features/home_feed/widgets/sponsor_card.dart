import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SponsorCard extends StatelessWidget {
  final String name;
  final String category;
  final String imageUrl;

  const SponsorCard({
    super.key,
    required this.name,
    required this.category,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 130,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 110,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                // Circular Logo Overlay - Centered perfectly
                Positioned(
                  bottom: -30,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.black,
                      border: Border.all(color: AppColors.white, width: 3),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "P",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          // Name
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 4),

          // Category
          Text(
            category,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: AppColors.grey),
          ),

          const SizedBox(height: 10),

          // Buttons Row
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconButton(Icons.share_outlined),
                const SizedBox(width: 12),
                _iconButton(Icons.chat_bubble_outline),
                const SizedBox(width: 12),
                _iconButton(Icons.favorite_border),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      height: 34,
      width: 34,
      decoration: const BoxDecoration(
        color: AppColors.grey600,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.white, size: 18),
    );
  }
}
