import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailView extends ConsumerWidget {
  const JobDetailView({
    super.key,
    required this.selectedJobIndex,
    required this.onJobBack,
  });
  final int? selectedJobIndex;
  final VoidCallback onJobBack;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobListState = ref.watch(jobListProvider);

    // Get real job data
    final apiJobs = jobListState.jobPosts;
    if (selectedJobIndex == null || selectedJobIndex! >= apiJobs.length) {
      return const Center(child: Text('Job not found'));
    }

    final selectedJob = apiJobs[selectedJobIndex!];
    final companyLogo = jobListState.companyLogo;
    final companyName = jobListState.companyName ?? 'Company';

    // Calculate timeline duration
    String timelineDuration = 'N/A';
    if (selectedJob.timeline.startDate != null &&
        selectedJob.timeline.endDate != null) {
      final duration = selectedJob.timeline.endDate!.difference(
        selectedJob.timeline.startDate!,
      );
      final months = (duration.inDays / 30).round();
      if (months > 0) {
        timelineDuration = '$months month${months != 1 ? 's' : ''}';
      }
    }

    return SingleChildScrollView(
      key: const ValueKey('job_detail_view'),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row: back + logo + agency name + location
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: companyLogo != null && companyLogo.isNotEmpty
                    ? NetworkImage(UrlHelper.getFullImageUrl(companyLogo))
                    : null,
                backgroundColor: AppColors.lightGrey,
                child: companyLogo == null || companyLogo.isEmpty
                    ? const Icon(Icons.business, color: AppColors.grey)
                    : null,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: companyName,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    CustomText(
                      title: selectedJob.location,
                      fontSize: 14,
                      textColor: AppColors.grey,
                    ),
                  ],
                ),
              ),

              GestureDetector(
                onTap: onJobBack,
                child: const Icon(Icons.arrow_back, color: AppColors.black),
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 18),

          // Sport + Title
          Row(
            children: [
              if (selectedJob.sportId.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Image.network(
                    UrlHelper.getFullImageUrl(selectedJob.sportId.icon),
                    width: 24,
                    height: 24,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),
              Expanded(
                child: CustomText(
                  title: '${selectedJob.sportId.name}: ${selectedJob.title}',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  textColor: AppColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Media Gallery
          if (selectedJob.mediaUrls.isNotEmpty) ...[
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: selectedJob.mediaUrls.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      UrlHelper.getFullImageUrl(selectedJob.mediaUrls[index]),
                      height: 180,
                      width: 280,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 180,
                        width: 280,
                        color: AppColors.lightGrey,
                        child: const Icon(Icons.image_not_supported),
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
          ),
          const SizedBox(height: 6),
          CustomText(
            title: selectedJob.description,
            fontSize: 14,
            textColor: AppColors.grey,
          ),
          const SizedBox(height: 18),

          if (selectedJob.requirements.isNotEmpty) ...[
            CustomText(
              title: 'Requirements',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 6),
            CustomText(
              title: selectedJob.requirements,
              fontSize: 14,
              textColor: AppColors.grey,
            ),
            const SizedBox(height: 18),
          ],

          Row(
            children: [
              CustomText(
                title: 'Payment',
                fontSize: 14,
                textColor: AppColors.grey,
              ),
              const SizedBox(width: 12),
              CustomText(
                title: selectedJob.price.isNotEmpty
                    ? '${AppHelpers.getCurrencySymbol(selectedJob.currency)}${selectedJob.price}'
                    : 'Not specified',
                fontSize: 14,
                fontWeight: FontWeight.w600,
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
                textColor: AppColors.grey,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 8),
                  CustomText(
                    title: selectedJob.timeline.startDate != null
                        ? '${selectedJob.timeline.startDate!.day}/${selectedJob.timeline.startDate!.month}/${selectedJob.timeline.startDate!.year}'
                        : 'N/A',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const CustomText(title: '  →  ', fontSize: 14),
                  CustomText(
                    title: selectedJob.timeline.endDate != null
                        ? '${selectedJob.timeline.endDate!.day}/${selectedJob.timeline.endDate!.month}/${selectedJob.timeline.endDate!.year}'
                        : 'N/A',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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
