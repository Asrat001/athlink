import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/sponsor/manage/domain/models/job_list_model.dart'
    as manage_models;
import 'package:athlink/features/sponsor/manage/presentation/providers/manage_navigation_provider.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/widgets/job_card_widget.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/widgets/no_jobs_card.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/widgets/stat_item.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/shared/widgets/create_job_modal.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobListing extends ConsumerWidget {
  const JobListing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobListState = ref.watch(jobListProvider);

    if (jobListState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (jobListState.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: 'Error: ${jobListState.errorMessage}',
              textColor: AppColors.red,
            ),
            const SizedBox(height: 16),
            RoundedButton(
              label: 'Retry',
              onPressed: () {
                ref.read(jobListProvider.notifier).fetchJobPosts();
              },
              height: 40,
              width: 100,
              borderRadius: 8,
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      );
    }

    // Convert API jobs to dummy format for display
    final apiJobs = jobListState.jobPosts;
    final companyLogo = jobListState.companyLogo;

    final jobs = apiJobs.map((job) {
      // Determine job image: prioritize mediaUrls, then sport icon
      String jobImage = 'https://picsum.photos/400/300';
      if (job.mediaUrls.isNotEmpty) {
        jobImage = '$fileBaseUrl${job.mediaUrls.first}';
      } else if (job.sportId.icon != null) {
        jobImage = '$fileBaseUrl${job.sportId.icon}';
      }

      return {
        "id": job.id,
        "type": "hiring",
        "agencyLogo": jobImage,
        "agencyName": job.title,
        "location": job.location,
        "price": job.price.isNotEmpty
            ? "${AppHelpers.getCurrencySymbol(job.currency)}${job.price}"
            : "${AppHelpers.getCurrencySymbol(job.currency)}0",
        "title": job.sportId.name,
        "tags": [
          if (job.timeline.startDate != null)
            'Start: ${job.timeline.startDate!.day}/${job.timeline.startDate!.month}/${job.timeline.startDate!.year}',
        ],
        "notifications": job.applicantCount,
        "description": job.description,
      };
    }).toList();
    if (jobs.isEmpty) return NoJobsCard();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatItem(label: "Jobs Posted", value: jobs.length.toString()),
              StatItem(label: "Funds Released", value: "\$0"),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CustomText(
                title: 'Your previous Job Posts',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => _openCreateJobModal(context, ref),
                child: const Icon(
                  Icons.add,
                  size: 26,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          Column(
            children: List.generate(
              jobs.length,
              (index) => JobCard(
                job: jobs[index],
                onTap: () => ref
                    .read(manageNavigationProvider.notifier)
                    .showJobFromListing(index),
                onDelete: () => _confirmDelete(context, ref, jobs[index]),
                onEdit: () => _openCreateJobModal(
                  context,
                  ref,
                  initialJob: apiJobs[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Map<String, dynamic> job,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomText(
            title: 'Delete Job Post',
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          content: CustomText(
            title: 'Are you sure you want to delete "${job["agencyName"]}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const CustomText(
                title: 'Cancel',
                textColor: AppColors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref
                    .read(jobListProvider.notifier)
                    .deleteJobPost(jobId: job["id"]);
              },
              child: const CustomText(
                title: 'Delete',
                textColor: AppColors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  void _openCreateJobModal(
    BuildContext context,
    WidgetRef ref, {
    manage_models.JobPostItem? initialJob,
  }) {
    final profileState = ref.read(profileProvider);
    final sports = profileState.profileUser?.sport ?? [];

    // Save the current status bar style to restore later
    final originalStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );

    // Set the new status bar style for the modal
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.black.withOpacity(0.3),
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      useRootNavigator: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => CreateJobModal(sports: sports, initialJob: initialJob),
    ).then((_) {
      // Restore the original status bar style when modal closes
      SystemChrome.setSystemUIOverlayStyle(originalStyle);
      // Refresh job list after modal closes
      ref.read(jobListProvider.notifier).fetchJobPosts();
    });
  }
}
