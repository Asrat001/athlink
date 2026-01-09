import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
    required this.label,
    this.onSeeMore,
    this.noSeeMore = true,
  });
  final String label;
  final bool noSeeMore;
  final VoidCallback? onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.bebasNeue(
            fontSize: 24,
            height: 1.5,
            letterSpacing: 0.45,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (!noSeeMore)
          TextButton(
            onPressed: onSeeMore,
            clipBehavior: Clip.none,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
            ),
            child: Text(
              "See more",
              style: GoogleFonts.bebasNeue(
                fontSize: 14,
                height: 1.5,
                letterSpacing: 0.45,
                color: AppColors.primary.withOpacity(0.78),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}
