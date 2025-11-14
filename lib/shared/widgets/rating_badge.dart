import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Rating badge widget that displays a star icon with a circular badge
///
/// Shows a rating value in a small circular badge positioned on top
/// of a star icon. Commonly used for displaying athlete ratings.
///
/// Example:
/// ```dart
/// RatingBadge(
///   rating: '4.9',
///   size: 40,
///   badgeColor: AppColors.error,
/// )
/// ```
class RatingBadge extends StatelessWidget {
  /// The rating value to display (e.g., "4.9")
  final String rating;

  /// Size of the container (both width and height)
  final double size;

  /// Background color of the container
  final Color backgroundColor;

  /// Color of the star icon
  final Color iconColor;

  /// Size of the star icon
  final double iconSize;

  /// Background color of the rating badge
  final Color badgeColor;

  /// Text color of the rating value
  final Color badgeTextColor;

  /// Size of the rating badge circle
  final double badgeSize;

  /// Font size of the rating text
  final double badgeFontSize;

  /// Border color of the container (optional)
  final Color? borderColor;

  /// Border width (if borderColor is provided)
  final double? borderWidth;

  const RatingBadge({
    super.key,
    required this.rating,
    this.size = 40,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.white,
    this.iconSize = 22,
    this.badgeColor = AppColors.error,
    this.badgeTextColor = AppColors.white,
    this.badgeSize = 22,
    this.badgeFontSize = 10,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main circular container with star icon
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: borderColor != null && borderWidth != null
                  ? Border.all(color: borderColor!, width: borderWidth!)
                  : null,
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.star_border,
              color: iconColor,
              size: iconSize,
            ),
          ),

          // Rating badge positioned at top-right
          Positioned(
            right: 0,
            top: -5,
            child: Container(
              height: badgeSize,
              width: badgeSize,
              decoration: BoxDecoration(
                color: badgeColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                rating,
                style: TextStyle(
                  color: badgeTextColor,
                  fontSize: badgeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
