import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FundingProgressCard extends StatelessWidget {
  final CampaignDetailModel? campaign;
  const FundingProgressCard({super.key, this.campaign});

  @override
  Widget build(BuildContext context) {
    if (campaign == null) return const SizedBox.shrink();

    final title = campaign?.title?.text ?? "";
    final fundedPercentage = campaign?.title?.fundedPercentage ?? 0.0;
    final totalAmount = campaign?.financialGoal?.totalAmount ?? 0.0;
    final deadline = campaign?.financialGoal?.deadline;

    final fundedAmount = totalAmount * (fundedPercentage / 100);

    String formattedDeadline = "";
    if (deadline != null) {
      try {
        final date = DateTime.parse(deadline);
        formattedDeadline = DateFormat('MMMM yyyy').format(date);
      } catch (e) {
        formattedDeadline = deadline;
      }
    }

    final currencyFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 0,
    );

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  title: title,
                  fontSize: 18,
                  textColor: AppColors.white,
                ),
              ),
              if (formattedDeadline.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CustomText(
                    title: formattedDeadline,
                    fontSize: 10,
                    textColor: AppColors.white.withOpacity(0.38),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: currencyFormatter.format(fundedAmount),
                fontSize: 11,
                textColor: AppColors.white.withOpacity(0.38),
              ),
              CustomText(
                title: 'Goal: ${currencyFormatter.format(totalAmount)}',
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
                widthFactor: (fundedPercentage / 100).clamp(0.0, 1.0),
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
