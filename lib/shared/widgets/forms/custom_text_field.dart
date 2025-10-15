import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:athlink/shared/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double labelFontSize;

  CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.labelFontSize = 12,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: GoogleFonts.roboto(color: AppColors.black),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
        labelStyle: GoogleFonts.roboto(
          color: AppColors.grey,
          fontSize: labelFontSize,
        ),
        filled: false,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.black, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
