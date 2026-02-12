import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class JobDetailModal extends StatelessWidget {
  final JobPost job;
  final bool isDarkMode;

  const JobDetailModal({super.key, required this.job, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    // Calculate timeline duration
    String timelineDuration = 'N/A';
    if (job.timeline.startDate != null && job.timeline.endDate != null) {
      final duration = job.timeline.endDate!.difference(
        job.timeline.startDate!,
      );
      final months = (duration.inDays / 30).round();
      if (months > 0) {
        timelineDuration = '$months month${months != 1 ? 's' : ''}';
      }
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.white24
                    : AppColors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Title
          Row(
            children: [
              Expanded(
                child: CustomText(
                  title: job.title,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  textColor: isDarkMode ? Colors.white : AppColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Media Gallery
          if (job.mediaUrls.isNotEmpty) ...[
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: job.mediaUrls.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      UrlHelper.getFullImageUrl(job.mediaUrls[index]),
                      height: 180,
                      width: 280,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 180,
                        width: 280,
                        color: isDarkMode
                            ? Colors.white10
                            : AppColors.lightGrey,
                        child: Icon(
                          Icons.image_not_supported,
                          color: isDarkMode ? Colors.white38 : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
          ],

          CustomText(
            title: 'Description',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            textColor: isDarkMode ? Colors.white : AppColors.black,
          ),
          const SizedBox(height: 6),
          CustomText(
            title: job.description,
            fontSize: 14,
            textColor: isDarkMode ? Colors.white70 : AppColors.grey,
          ),
          const SizedBox(height: 18),

          if (job.requirements.isNotEmpty) ...[
            CustomText(
              title: 'Requirements',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              textColor: isDarkMode ? Colors.white : AppColors.black,
            ),
            const SizedBox(height: 6),
            CustomText(
              title: job.requirements,
              fontSize: 14,
              textColor: isDarkMode ? Colors.white70 : AppColors.grey,
            ),
            const SizedBox(height: 18),
          ],

          Row(
            children: [
              CustomText(
                title: 'Payment',
                fontSize: 14,
                textColor: isDarkMode ? Colors.white70 : AppColors.grey,
              ),
              const SizedBox(width: 12),
              CustomText(
                title: job.price != null && job.price.toString().isNotEmpty
                    ? '${AppHelpers.getCurrencySymbol(job.currency)}${job.price}'
                    : 'Not specified',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                textColor: isDarkMode ? Colors.white : AppColors.black,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Timeline',
                fontSize: 14,
                textColor: isDarkMode ? Colors.white70 : AppColors.grey,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: isDarkMode ? Colors.white70 : AppColors.grey,
                  ),
                  const SizedBox(width: 8),
                  CustomText(
                    title: job.timeline.startDate != null
                        ? '${job.timeline.startDate!.day}/${job.timeline.startDate!.month}/${job.timeline.startDate!.year}'
                        : 'N/A',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: isDarkMode ? Colors.white : AppColors.black,
                  ),
                  CustomText(
                    title: '  →  ',
                    fontSize: 14,
                    textColor: isDarkMode ? Colors.white70 : AppColors.black,
                  ),
                  CustomText(
                    title: job.timeline.endDate != null
                        ? '${job.timeline.endDate!.day}/${job.timeline.endDate!.month}/${job.timeline.endDate!.year}'
                        : 'N/A',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textColor: isDarkMode ? Colors.white : AppColors.black,
                  ),
                  if (timelineDuration != 'N/A')
                    CustomText(
                      title: ' ($timelineDuration)',
                      fontSize: 14,
                      textColor: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
