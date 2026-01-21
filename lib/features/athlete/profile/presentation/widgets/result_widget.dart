import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class ResultTableHeader extends StatelessWidget {
  const ResultTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.orangeGradientStart.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 2,
            child: CustomText(
              title: 'DATE',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: 'POSITION',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomText(
              title: 'COMPETITION',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: 'DIVISION',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final ResultData data;
  const ResultItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.black,
        border: Border(
          bottom: BorderSide(
            color: AppColors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: CustomText(
              title: DateFormatter.formatFromISO(data.date),
              fontWeight: FontWeight.w400,
              textColor: AppColors.white.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: data.position,
              textColor: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: data.competition,
                  textColor: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 6),
                Text(
                  data.location,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(2),
                //   child: Image.network(
                //     data.flagUrl,
                //     width: 22,
                //     height: 14,
                //     fit: BoxFit.cover,
                //     errorBuilder: (context, error, stackTrace) => Icon(
                //       Icons.flag,
                //       size: 14,
                //       color: AppColors.white.withValues(alpha: 0.3),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: data.division,
              textColor: AppColors.white.withValues(alpha: 0.4),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ResultEmptyState extends StatelessWidget {
  final VoidCallback? onAdd;
  final bool isSelf;

  const ResultEmptyState({super.key, this.onAdd, this.isSelf = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 100,
            color: AppColors.white.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 24),
          CustomText(
            title: isSelf
                ? 'No competition results yet.'
                : 'No results found for this athlete.',
            fontSize: 18,
            textColor: AppColors.white.withValues(alpha: 0.38),
          ),
          if (isSelf && onAdd != null) ...[
            const SizedBox(height: 40),
            ResultBottomActions(
              label: 'Add Result',
              onAdd: onAdd!,
              showCircleButton: false,
            ),
          ],
        ],
      ),
    );
  }
}

class ResultBottomActions extends StatelessWidget {
  final String label;
  final VoidCallback onAdd;
  final bool showCircleButton;

  const ResultBottomActions({
    super.key,
    required this.label,
    required this.onAdd,
    this.showCircleButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          if (showCircleButton)
            GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.white.withValues(alpha: 0.3),
                    width: 1.5,
                  ),
                ),
                child: const Icon(Icons.add, color: AppColors.white, size: 28),
              ),
            ),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.darkGreyCard,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.white.withValues(alpha: 0.05),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, color: AppColors.white, size: 18),
                  const SizedBox(width: 8),
                  CustomText(
                    title: label,
                    textColor: AppColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
