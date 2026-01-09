import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobDetailView extends ConsumerWidget {
  const JobDetailView({super.key, required this.selectedJobIndex,required this.onJobBack});
 final int? selectedJobIndex;
  final VoidCallback onJobBack;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
      
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

          CustomText(
            title: selectedJob.title,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            textColor: AppColors.black,
          ),
          const SizedBox(height: 12),
          CustomText(
            title: selectedJob.description,
            fontSize: 14,
            textColor: AppColors.grey,
          ),
          const SizedBox(height: 18),

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
                    ? selectedJob.price.replaceAll('/m', '')
                    : 'Not specified',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomText(
                title: 'Time line',
                fontSize: 14,
                textColor: AppColors.grey,
              ),
              const SizedBox(width: 12),
              CustomText(
                title: timelineDuration,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}