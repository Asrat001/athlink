import 'package:flutter/material.dart';

/// A reusable circular icon button widget with customizable size, colors, and borders.
///
/// This widget provides a consistent circular button design across the app,
/// eliminating duplicate implementations and ensuring visual consistency.
///
/// Example usage:
/// ```dart
/// CircularIconButton(
///   size: 40,
///   backgroundColor: AppColors.white.withValues(alpha: 0.4),
///   child: const Icon(Icons.bookmark, color: AppColors.white, size: 22),
///   onPressed: () => handleAction(),
/// )
/// ```
class CircularIconButton extends StatelessWidget {
  /// The widget to display inside the circular button (typically an Icon or SvgPicture)
  final Widget child;

  /// Callback function when the button is pressed
  final VoidCallback? onPressed;

  /// The diameter of the circular button (default: 40)
  final double size;

  /// The background color of the button (default: Colors.white)
  final Color backgroundColor;

  /// Optional border color
  final Color? borderColor;

  /// Optional border width (only applied if borderColor is provided)
  final double? borderWidth;

  /// Whether to add ink splash effect on tap (default: true)
  final bool enableInkWell;

  const CircularIconButton({
    super.key,
    required this.child,
    this.onPressed,
    this.size = 40,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.borderWidth,
    this.enableInkWell = true,
  });

  @override
  Widget build(BuildContext context) {
    final button = Container(
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
      child: child,
    );

    // If no onPressed callback, return non-interactive button
    if (onPressed == null) {
      return button;
    }

    // Add ink well effect if enabled
    if (enableInkWell) {
      return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(size / 2),
        child: button,
      );
    }

    // Simple GestureDetector without ripple effect
    return GestureDetector(
      onTap: onPressed,
      child: button,
    );
  }
}
