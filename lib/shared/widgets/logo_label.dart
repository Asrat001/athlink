
import 'package:athlink/shared/extensions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';

class LogoLabel extends StatelessWidget {
  final double size;
  final TextAlign align;
  const LogoLabel({super.key, this.size = 50,this.align=TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: align,
      TextSpan(
        text: "ET-",
        style:GoogleFonts.bebasNeue(
        color: Colors.white,
        fontSize: context.isTablet ? 60 : size,
        fontWeight: FontWeight.w700,
      ),
        children: [
          TextSpan(
            text: "Podcast",
            style:GoogleFonts.bebasNeue(
              fontSize: context.isTablet ? 60 : size,
              fontWeight: FontWeight.w700,
              color: AppColors.primary
            ),
          ),
        ],
      ),
    );
  }
}