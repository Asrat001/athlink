import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Widget icon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  double labelFontSize;

  CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.labelFontSize = 12,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.roboto(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon,
        labelStyle: GoogleFonts.roboto(
          color: Colors.grey[600],
          fontSize: labelFontSize,
        ),
        filled: false,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.grey[800]!, width: 1.5),
        ),
      ),
    );
  }
}
