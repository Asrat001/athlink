import 'package:athlink/features/sponsor/watchlist/presentation/providers/watchlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/circular_icon_button.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Pure presentational widget - no business logic, just displays data
/// Fully responsive using LayoutBuilder
class AthleteCard extends ConsumerWidget {
  final String? athleteId;
  final String name;
  final String club;
  final String age;
  final String flag;
  final String image;
  final String sponsorshipDone;
  final double rating;
  final List<Achievement> achievements;
  final String? position;
  final String? level;
  final String? sportCategory;
  final VoidCallback? onTap;
  final String highestSocialMediaPresence;
  final double size;

  const AthleteCard({
    super.key,
    this.athleteId,
    required this.name,
    required this.club,
    required this.age,
    required this.flag,
    required this.image,
    this.sponsorshipDone = "",
    this.rating = 0,
    this.achievements = const [],
    this.position,
    this.level,
    this.sportCategory,
    this.onTap,
    required this.highestSocialMediaPresence,
    this.size = 240.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use available height and width from parent
        final availableHeight = constraints.maxHeight;
        final availableWidth = constraints.maxWidth;

        // Card width: responsive but clamped
        final cardWidth = availableWidth.clamp(size, size);

        // Card takes 75% of available height for main content
        // Reserve 25% for footer
        final mainCardHeight = availableHeight * 0.72;
        final footerHeight = availableHeight * 0.25;

        // Proportional sizing based on card width
        final scale = cardWidth / 280;

        return SizedBox(
          width: cardWidth,
          // margin: EdgeInsets.only(right: 16 * scale),
          child: GestureDetector(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Main card container
                SizedBox(
                  height: mainCardHeight,
                  width: cardWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(20 * scale),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.05),
                          offset: const Offset(0, 3),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(
                      16 * scale,
                      16 * scale,
                      16 * scale,
                      0,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Athlete image (bottom-left, sized to fit)
                        _buildAthleteImage(mainCardHeight * 0.7),

                        // Athlete info (top-left)
                        _buildAthleteInfo(scale),

                        // Flag (top-right)
                        _buildFlag(28 * scale),

                        // Action buttons (right side: rating, bookmark, share)
                        _buildActionButtons(scale, mainCardHeight, ref),
                      ],
                    ),
                  ),
                ),

                // Card footer
                SizedBox(
                  height: footerHeight,
                  width: cardWidth,
                  child: _buildCardFooter(scale),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // MARK: - Helper Methods

  Widget _buildAthleteInfo(double scale) {
    return Positioned(
      top: 0,
      left: 0,
      right: 60 * scale, // Leave space for flag/rating
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: name,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            textColor: AppColors.white,
            maxLines: 1,
          ),
          SizedBox(height: 4 * scale),
          CustomText(
            title: club,
            fontSize: 13,
            textColor: AppColors.white,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.3,
            maxLines: 1,
          ),
          SizedBox(height: 4 * scale),
          CustomText(
            title: 'Age: $age',
            fontSize: 12,
            textColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  Widget _buildAthleteImage(double maxHeight) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Image.network(
          image,
          height: maxHeight,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              height: maxHeight,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return SizedBox(
              height: maxHeight,
              child: Image.asset(
                "assets/images/athlete.png",
                height: maxHeight,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFlag(double flagSize) {
    return Positioned(
      top: 0,
      right: 0,
      child: ClipOval(
        child: Image.asset(
          "assets/images/flag.png",
          height: flagSize,
          width: flagSize,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: flagSize,
              width: flagSize,
              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildActionButtons(double scale, double cardHeight, WidgetRef ref) {
    final iconSize = 28 * scale;
    final badgeSize = 16 * scale;
    final spacing = 10 * scale;

    // Watch if this athlete is in watchlist
    final isInWatchlist = ref
        .watch(watchlistIdsProvider)
        .contains(athleteId ?? '');

    return Positioned(
      right: 0,
      top: cardHeight * 0.2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Rating badge with star
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircularIconButton(
                size: iconSize,
                backgroundColor: AppColors.white.withValues(alpha: 0.4),
                child: Icon(
                  Icons.star_border,
                  color: AppColors.white,
                  size: 20 * scale,
                ),
              ),
              if (rating > 0)
                Positioned(
                  right: -2,
                  top: -2,
                  child: Container(
                    height: badgeSize,
                    width: badgeSize,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      rating.toString(),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 6 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: spacing),

          // Bookmark button with dynamic state
          CircularIconButton(
            size: iconSize,
            backgroundColor: isInWatchlist
                ? AppColors
                      .primary // Filled background when bookmarked
                : AppColors.white.withValues(
                    alpha: 0.4,
                  ), // Transparent when not bookmarked
            onPressed: () async {
              if (athleteId == null || athleteId!.isEmpty) return;

              // Toggle watchlist
              await ref
                  .read(watchlistProvider.notifier)
                  .toggleWatchlist(athleteId: athleteId!);
            },
            child: Icon(
              isInWatchlist
                  ? Icons.bookmark
                  : Icons.bookmark_border, // Filled vs outlined
              color: AppColors.white,
              size: 20 * scale,
            ),
          ),

          SizedBox(height: spacing),

          // Share button
          CircularIconButton(
            size: iconSize,
            backgroundColor: AppColors.white.withValues(alpha: 0.4),
            child: Icon(Icons.share, color: AppColors.white, size: 20 * scale),
          ),
        ],
      ),
    );
  }

  Widget _buildCardFooter(double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4 * scale, vertical: 4 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: name,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            textColor: AppColors.textPrimary,
            maxLines: 1,
          ),
          SizedBox(height: 2 * scale),
          CustomText(
            title: highestSocialMediaPresence.isEmpty
                ? "unavailable"
                : highestSocialMediaPresence,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            textColor: AppColors.grey,
            maxLines: 1,
          ),
          SizedBox(height: 2 * scale),
          CustomText(
            title:
                "${sponsorshipDone.isEmpty ? "0" : sponsorshipDone} jobs done",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            textColor: AppColors.grey,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
