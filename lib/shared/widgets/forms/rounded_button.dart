import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.submitting = false,
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.borderRadius = 50,
    this.borderSide,
    this.elevation,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,

    this.letterSpacing,
    this.height,
    this.width,
    this.icon,
    this.iconGap = 8.0,
    this.alignment = MainAxisAlignment.center,
  });

  final String label;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool submitting;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final double borderRadius;
  final BorderSide? borderSide;
  final double? elevation;
  final double fontSize;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final double? height;
  final double? width;
  final Widget? icon;
  final double iconGap;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: submitting ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return disabledBackgroundColor ??
                  AppColors.grey.withValues(alpha: .12);
            }
            return backgroundColor ?? AppColors.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.disabled)) {
              return disabledForegroundColor ??
                  AppColors.white.withValues(alpha: .38);
            }
            return foregroundColor ?? AppColors.white;
          }),
          padding: WidgetStateProperty.all(padding),
          elevation: WidgetStateProperty.all(elevation),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderSide ?? BorderSide.none,
            ),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.pressed)) {
              return (foregroundColor ?? AppColors.white).withValues(
                alpha: 0.1,
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return (foregroundColor ?? AppColors.white).withValues(
                alpha: 0.04,
              );
            }
            return null;
          }),
        ),
        child: submitting
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: foregroundColor ?? AppColors.white,
                  ),
                ),
              )
            : icon != null
            ? Row(
                mainAxisAlignment: alignment,
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  SizedBox(width: iconGap),
                  CustomText(
                    title: label,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    letterSpacing: letterSpacing,
                    textColor: foregroundColor ?? AppColors.white,
                  ),
                ],
              )
            : CustomText(
                title: label,
                fontSize: fontSize,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing,
                textColor: foregroundColor ?? AppColors.white,
              ),
      ),
    );
  }
}
