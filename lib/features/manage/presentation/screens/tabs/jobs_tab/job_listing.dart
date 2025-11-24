import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
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

    final jobs = apiJobs.map((job) {
      return {
        "id": job.id,
        "type": "hiring",
        "agencyLogo": companyLogo!.isNotEmpty
            ? UrlHelper.getFullImageUrl(companyLogo) //companyLogo
            : "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
        "agencyName": companyName,
        "location": job.location,
        "price": job.price.isNotEmpty ? job.price : "N/A",
        "title": job.title,
        "tags": [], // No tags in API data
        "notifications": job.applicantCount,
        "description": job.description,
      };
    }).toList();

    if (jobs.isEmpty) return _buildEmptyJobs(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _statItem("Jobs Posted", jobs.length.toString()),
              _statItem("Funds Released", "\$0"),
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
                onTap: () => _openCreateJobModal(context),
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
              (index) => GestureDetector(
                onTap: () => _showJobFromListing(index),
                child: JobCard(job: jobs[index], onTap: () => _showJobFromListing(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  
}