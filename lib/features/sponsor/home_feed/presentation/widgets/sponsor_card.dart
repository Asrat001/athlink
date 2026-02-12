import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';

class SponsorCard extends StatelessWidget {
  final String name;
  final String category;
  final String? bannerImageUrl;
  final String? profileImageUrl;
  final bool isDarkMode;
  final VoidCallback? onTap;

  const SponsorCard({
    super.key,
    required this.name,
    required this.category,
    this.bannerImageUrl,
    this.profileImageUrl,
    this.isDarkMode = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(24),
          border: isDarkMode ? Border.all(color: Colors.white12) : null,
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Banner Image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    child: bannerImageUrl != null && bannerImageUrl!.isNotEmpty
                        ? Image.network(
                            bannerImageUrl!,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(color: AppColors.grey),
                          )
                        : Container(
                            height: 100,
                            width: double.infinity,
                            color: AppColors.primary.withValues(alpha: 0.1),
                            child: const Icon(
                              Icons.business,
                              color: AppColors.primary,
                              size: 40,
                            ),
                          ),
                  ),

                  // Profile Image / Avatar
                  Positioned(
                    bottom: -30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDarkMode ? AppColors.black : AppColors.white,
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.black
                                : AppColors.white,
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child:
                              profileImageUrl != null &&
                                  profileImageUrl!.isNotEmpty
                              ? Image.network(
                                  profileImageUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      _buildDefaultAvatar(),
                                )
                              : _buildDefaultAvatar(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 35),
            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                name,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ),

            const SizedBox(height: 4),

            // Category
            Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white60 : AppColors.primary,
              ),
            ),

            const SizedBox(height: 12),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconButton(Icons.share_outlined),
                const SizedBox(width: 12),
                _iconButton(Icons.chat_bubble_outline),
                const SizedBox(width: 12),
                _iconButton(Icons.favorite_border),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: AppColors.primary,
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'P',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return CircularIconButton(
      size: 32,
      backgroundColor: AppColors.extraLightGrey,
      child: Icon(icon, color: AppColors.textPrimary, size: 16),
    );
  }
}
