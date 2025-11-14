import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Helper class for navigation-related utilities
///
/// Provides centralized navigation logic including overlay navigation
/// and common navigation patterns.
class NavigationHelpers {
  // Private constructor to prevent instantiation
  NavigationHelpers._();

  /// Navigate to a full-screen overlay with fade transition
  ///
  /// Used for athlete detail overlays and similar full-screen modals.
  /// The overlay has a transparent background and can be dismissed by tapping outside.
  ///
  /// Example:
  /// ```dart
  /// NavigationHelpers.pushOverlay(
  ///   context,
  ///   AthleteDetailOverlay(athleteId: '123'),
  /// );
  /// ```
  static Future<T?> pushOverlay<T>(
    BuildContext context,
    Widget page, {
    bool barrierDismissible = true,
    Color barrierColor = AppColors.transparent,
  }) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder<T>(
        barrierDismissible: barrierDismissible,
        opaque: false,
        barrierColor: barrierColor,
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      ),
    );
  }

  /// Navigate to a page with slide from right transition
  ///
  /// Standard navigation with a slide-in animation from the right.
  ///
  /// Example:
  /// ```dart
  /// NavigationHelpers.pushSlideRight(context, ProfileScreen());
  /// ```
  static Future<T?> pushSlideRight<T>(BuildContext context, Widget page) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  /// Navigate to a page with fade transition
  ///
  /// Simple fade-in animation for page transitions.
  ///
  /// Example:
  /// ```dart
  /// NavigationHelpers.pushFade(context, SettingsScreen());
  /// ```
  static Future<T?> pushFade<T>(BuildContext context, Widget page) {
    return Navigator.push<T>(
      context,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  /// Pop the current route with optional result
  ///
  /// Wrapper around Navigator.pop for consistency.
  ///
  /// Example:
  /// ```dart
  /// NavigationHelpers.pop(context);
  /// NavigationHelpers.pop(context, result: userData);
  /// ```
  static void pop<T>(BuildContext context, {T? result}) {
    Navigator.pop<T>(context, result);
  }

  /// Pop all routes until reaching a specific route
  ///
  /// Useful for navigating back to a specific screen.
  ///
  /// Example:
  /// ```dart
  /// NavigationHelpers.popUntil(context, (route) => route.isFirst);
  /// ```
  static void popUntil(BuildContext context, bool Function(Route<dynamic>) predicate) {
    Navigator.popUntil(context, predicate);
  }

  /// Check if Navigator can pop
  ///
  /// Returns true if there are previous routes in the navigation stack.
  ///
  /// Example:
  /// ```dart
  /// if (NavigationHelpers.canPop(context)) {
  ///   NavigationHelpers.pop(context);
  /// }
  /// ```
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }
}
