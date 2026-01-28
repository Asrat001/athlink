import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_theme.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CostBreakdownSummaryBody extends StatelessWidget {
  final List<CostItem> costs;
  final double budget;

  const CostBreakdownSummaryBody({
    super.key,
    required this.costs,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Budget",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$${NumberFormat('#,###').format(budget)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: CustomPaint(
                painter: MultiColorPiePainter(items: costs, total: budget),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...costs.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: e.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    e.title,
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  "\$${NumberFormat('#,###').format(e.amount)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
