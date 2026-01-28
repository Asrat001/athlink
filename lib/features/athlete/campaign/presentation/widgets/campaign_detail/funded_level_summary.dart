import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FundedLevelSummary extends StatelessWidget {
  final double fundedPercentage;

  const FundedLevelSummary({super.key, required this.fundedPercentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fundedPercentage,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(Colors.orange),
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${(fundedPercentage * 100).toInt()}% funded",
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
