import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:athlink/shared/theme/app_colors.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  double? borderRadius;

  CustomEmailField({
    super.key,
    required this.controller,
    this.validator,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      style: GoogleFonts.inter(color: AppColors.black),
      decoration: InputDecoration(
        errorMaxLines: 5,
        labelText: 'Email Address',
        prefixIcon: Icon(Icons.email_outlined, color: AppColors.grey),
        labelStyle: GoogleFonts.inter(color: AppColors.grey, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: AppColors.lightGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: AppColors.black, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
