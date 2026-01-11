import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FundingProgressCard extends StatelessWidget {
  const FundingProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 4,
            children: [
              const CustomText(
                title: 'LA 2028 Olympics',
                fontSize: 18,
                textColor: AppColors.white,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomText(
                    title: 'April 2028 - May 2028',
                    fontSize: 10,
                    textColor: AppColors.white.withOpacity(0.38),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: '\$400,000',
                fontSize: 11,
                textColor: AppColors.white.withOpacity(0.38),
              ),
              CustomText(
                title: 'Goal: \$1,000,000',
                fontSize: 11,
                textColor: AppColors.white.withOpacity(0.38),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Custom Gradient Progress Bar
          Stack(
            children: [
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.4, // 40% progress
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.orangeGradientStart,
                        AppColors.orangeGradientEnd,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
