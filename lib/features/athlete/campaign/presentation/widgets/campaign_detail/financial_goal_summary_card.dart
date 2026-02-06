import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinancialGoalSummaryCard extends StatelessWidget {
  final FinancialGoalData goal;
  final CampaignTitleModel? campaignTitle;

  const FinancialGoalSummaryCard({
    super.key,
    required this.goal,
    this.campaignTitle,
  });

  String _getDurationString(DateTime deadline) {
    final now = DateTime.now();
    if (deadline.isBefore(now)) return "Ended";

    int years = deadline.year - now.year;
    int months = deadline.month - now.month;
    int days = deadline.day - now.day;

    if (days < 0) {
      final lastDayOfPrevMonth = DateTime(deadline.year, deadline.month, 0).day;
      days += lastDayOfPrevMonth;
      months--;
    }

    if (months < 0) {
      months += 12;
      years--;
    }

    final parts = <String>[];
    if (years > 0) parts.add("$years ${years == 1 ? 'year' : 'years'}");
    if (months > 0) parts.add("$months ${months == 1 ? 'month' : 'months'}");
    if (days > 0) parts.add("$days ${days == 1 ? 'day' : 'days'}");

    if (parts.isEmpty) return "Today";
    return "${parts.join(', ')} remaining";
  }

  @override
  Widget build(BuildContext context) {
    final durationString = _getDurationString(goal.deadline);
    final rawFunded = campaignTitle?.fundedPercentage ?? 0.0;
    // Normalize if the value comes as a whole number (0-100) instead of decimal (0.0-1.0)
    final fundedPercentage = rawFunded > 1.0 ? rawFunded / 100 : rawFunded;
    final fundedAmount = goal.amount * fundedPercentage;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                campaignTitle?.text ?? '',
                style: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "\$${NumberFormat('#,###').format(fundedAmount)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Goal: \$${NumberFormat('#,###').format(goal.amount)}",
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              Expanded(
                child: Text(
                  durationString,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fundedPercentage,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(Colors.orange),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${(fundedPercentage * 100).toInt()}% funded",
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
