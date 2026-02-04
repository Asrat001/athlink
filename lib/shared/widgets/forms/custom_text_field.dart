import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:athlink/shared/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget? icon;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double labelFontSize;
  final double? borderRadius;
  final Color? textColor;
  final Color? cursorColor;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.label,
    this.icon,
    required this.controller,
    this.labelFontSize = 12,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.borderRadius = 50,
    this.maxLines = 1,
    this.textColor,
    this.cursorColor,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      inputFormatters: inputFormatters,
      cursorColor: cursorColor,
      style: GoogleFonts.inter(color: textColor ?? AppColors.black),
      decoration: InputDecoration(
        errorMaxLines: 5,
        labelText: label,
        prefixIcon: icon,
        labelStyle: GoogleFonts.inter(
          color: AppColors.grey,
          fontSize: labelFontSize,
        ),
        filled: false,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ), // Changed to white for dark theme
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
