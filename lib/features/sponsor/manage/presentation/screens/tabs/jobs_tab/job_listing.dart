import 'dart:math';

import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/sponsor/manage/presentation/providers/manage_navigation_provider.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/widgets/job_card_widget.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/widgets/no_jobs_card.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/widgets/stat_item.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/shared/widgets/create_job_modal.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
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
    final companyName = jobListState.companyName ?? 'Company';
    final companyLogo = jobListState.companyLogo;
    final List<String> randomPrices = [
      "\$45",
      "\$120",
      "\$350",
      "\$600",
      "\$950",
    ];

    final _random = Random();

    final jobs = apiJobs.map((job) {
      // 2. Pick a random price from the list above
      String fallbackPrice = randomPrices[_random.nextInt(randomPrices.length)];

      return {
        "id": job.id,
        "type": "hiring",
        "agencyLogo":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
        "agencyName": companyName,
        "location": job.location,
        "price": job.price.isNotEmpty ? job.price : fallbackPrice,
        "title": job.title,
        "tags": [],
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

          // job cards
          Column(
            children: List.generate(
              jobs.length,
              (index) => JobCard(
                job: jobs[index],
                onTap: () => ref
                    .read(manageNavigationProvider.notifier)
                    .showJobFromListing(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openCreateJobModal(BuildContext context, WidgetRef ref) {
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
      builder: (_) => CreateJobModal(sports: sports),
    ).then((_) {
      // Restore the original status bar style when modal closes
      SystemChrome.setSystemUIOverlayStyle(originalStyle);
      // Refresh job list after modal closes
      ref.read(jobListProvider.notifier).fetchJobPosts();
    });
  }
}
