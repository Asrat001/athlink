import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FundedLevelSummary extends StatelessWidget {
  final double fundedPercentage;
  final double? totalAmount;

  const FundedLevelSummary({
    super.key,
    required this.fundedPercentage,
    this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    // Percentage can be 0-1.0 or 0-100 depending on source
    final normalizedPercentage = fundedPercentage > 1.0
        ? fundedPercentage / 100
        : fundedPercentage;

    final currencyFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 0,
    );

    final fundedAmount = (totalAmount ?? 0.0) * normalizedPercentage;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: normalizedPercentage,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(Colors.orange),
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${(normalizedPercentage * 100).toInt()}% funded",
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (totalAmount != null && totalAmount! > 0)
                Text(
                  "${currencyFormatter.format(fundedAmount)} / ${currencyFormatter.format(totalAmount)}",
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
