import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatSearchBar extends StatelessWidget {
  const ChatSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    required this.hint,
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey600.withValues(alpha: .3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(
              alpha: 0.04,
            ), // Replaced Colors.black
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          SvgPicture.asset(
            "assets/images/search.svg",
            colorFilter: ColorFilter.mode(AppColors.grey600, BlendMode.srcIn),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: GoogleFonts.inter(
                fontSize: 15,
                color: AppColors.black,
              ), // Replaced Colors.black
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.inter(
                  fontSize: 15,
                  color: AppColors.grey600,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
