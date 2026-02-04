import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

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
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: 'POSITION',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomText(
              title: 'COMPETITION',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: 'DIVISION',
              textColor: AppColors.orangeGradientStart,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
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
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Builder(
              builder: (context) {
                if (!data.position.contains('/')) {
                  return CustomText(
                    title: data.position,
                    textColor: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  );
                }
                final parts = data.position.split('/');
                return RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: parts[0],
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      TextSpan(
                        text: '/${parts[1]}',
                        style: TextStyle(
                          color: AppColors.white.withValues(alpha: 0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  title: data.competition,
                  textColor: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  data.location,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomText(
              title: data.division,
              textColor: AppColors.white.withValues(alpha: 0.4),
              fontSize: 12,
              textAlign: TextAlign.center,
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
            ResultBottomActions(label: 'Add Result', onAdd: onAdd!),
          ],
        ],
      ),
    );
  }
}

class ResultBottomActions extends StatelessWidget {
  final String label;
  final VoidCallback onAdd;

  const ResultBottomActions({
    super.key,
    required this.label,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: GestureDetector(
          onTap: onAdd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.darkGreyCard,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.white.withAlpha((0.1 * 255).round()),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: AppColors.white, size: 20),
                const SizedBox(width: 8),
                CustomText(
                  title: label,
                  textColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
