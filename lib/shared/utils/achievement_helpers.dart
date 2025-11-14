import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';

/// Helper class for achievement-related utilities
///
/// Provides centralized logic for achievement display, including
/// rank color mapping and difficulty level colors.
class AchievementHelpers {
  // Private constructor to prevent instantiation
  AchievementHelpers._();

  /// Get color for achievement rank (gold, silver, bronze)
  ///
  /// Supports various rank formats:
  /// - Numeric: "1", "2", "3"
  /// - Ordinal: "1st", "2nd", "3rd"
  /// - Named: "gold", "silver", "bronze"
  ///
  /// Returns default color for unrecognized ranks.
  static Color getRankColor(String? rank) {
    if (rank == null || rank.isEmpty) {
      return AppColors.lightGrey;
    }

    final normalizedRank = rank.toLowerCase().trim();

    switch (normalizedRank) {
      case '1':
      case '1st':
      case 'first':
      case 'gold':
        return const Color(0xFFFFD700); // Gold

      case '2':
      case '2nd':
      case 'second':
      case 'silver':
        return AppColors.lightGrey; // Silver

      case '3':
      case '3rd':
      case 'third':
      case 'bronze':
        return const Color(0xFFCD7F32); // Bronze

      default:
        return AppColors.grey;
    }
  }

  /// Get color for achievement difficulty level
  ///
  /// Supports difficulty levels:
  /// - Hard/International: Red
  /// - Medium/National: Orange
  /// - Easy/Regional/Local: Green
  ///
  /// Returns default color for unrecognized difficulties.
  static Color getDifficultyColor(String? difficulty) {
    if (difficulty == null || difficulty.isEmpty) {
      return AppColors.grey;
    }

    final normalizedDifficulty = difficulty.toLowerCase().trim();

    switch (normalizedDifficulty) {
      case 'hard':
      case 'difficult':
      case 'international':
      case 'world':
        return Colors.red;

      case 'medium':
      case 'moderate':
      case 'national':
      case 'country':
        return Colors.orange;

      case 'easy':
      case 'simple':
      case 'regional':
      case 'local':
      case 'state':
        return Colors.green;

      default:
        return AppColors.grey;
    }
  }

  /// Get difficulty label with proper formatting
  ///
  /// Capitalizes first letter for display.
  static String formatDifficulty(String? difficulty) {
    if (difficulty == null || difficulty.isEmpty) {
      return 'Unknown';
    }

    return difficulty[0].toUpperCase() + difficulty.substring(1).toLowerCase();
  }

  /// Get rank label with proper formatting
  ///
  /// Ensures consistent rank display format.
  static String formatRank(String? rank) {
    if (rank == null || rank.isEmpty) {
      return '-';
    }

    return rank;
  }
}
