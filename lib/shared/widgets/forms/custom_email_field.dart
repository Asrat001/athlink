import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomEmailField extends StatelessWidget {
  final TextEditingController controller;

  const CustomEmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.roboto(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Email Address',
        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[600]),
        labelStyle: GoogleFonts.roboto(color: Colors.grey[600], fontSize: 12),
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
