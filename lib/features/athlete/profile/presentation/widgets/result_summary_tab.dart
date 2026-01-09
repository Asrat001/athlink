import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ResultSummaryTab extends StatelessWidget {
  final TextEditingController controller;
  const ResultSummaryTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Competition Summary",
            fontSize: 16,
            textColor: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            maxLines: 8,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              hintText:
                  "Write your thoughts, highlights, and notes about this competition ...",
              hintStyle: TextStyle(
                color: AppColors.white.withValues(alpha: 0.24),
                fontSize: 13,
              ),
              fillColor: AppColors.white.withValues(alpha: 0.05),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.white.withValues(alpha: 0.1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColors.darkGreyCard,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: const CustomText(
                  title: "Save Summary",
                  fontSize: 14,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
