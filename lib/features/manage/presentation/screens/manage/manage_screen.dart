import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/applicant_detail.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/sponsorship_section.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

enum JobsSectionState { listing, applicants, jobDetail, baDetail }

enum ApplicantTab { newApplicants, invitees }

class ManageScreen extends ConsumerStatefulWidget {
  const ManageScreen({super.key});

  @override
  ConsumerState<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends ConsumerState<ManageScreen> {
  // -------------------- Dummy data --------------------
  final List<Map<String, dynamic>> jobs = const [
    {
      "id": "job_brand_1",
      "type": "brand", // brand -> Brand Ambassador flow
      "agencyLogo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
      "agencyName": "SP Sport Agency",
      "location": "Los Angeles, CA",
      "price": "500\$/m",
      "title": "Brand Ambassador Deal",
      "tags": ["#Social Media Post", "#Model", "#Event speaker", "#Poster Ad"],
      "notifications": 9,
      "description":
          "Track and field athletes aged 18 - 21, with social media presence. This is a full time job for 6 months.",
    },
    {
      "id": "job_hire_1",
      "type": "hiring", // hiring -> normal applicants -> job detail
      "agencyLogo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
      "agencyName": "Quartz",
      "location": "New York, NY",
      "price": "750\$/m",
      "title": "Ambassador Deal",
      "tags": ["#Reel", "#Model", "#Ambassador"],
      "notifications": 2,
      "description":
          "Short-term ambassador role for content creation and local events. 3 months.",
    },
  ];

  final List<Map<String, dynamic>> newApplicants = [
    {
      "name": "Mariya Osteen",
      "club": "NY Woman's Flag Football",
      "age": 21,
      "rating": 4.9,
      "reviews": 726,
      "image":
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
    {
      "name": "Ava Johnson",
      "club": "LA Fitness Team",
      "age": 25,
      "rating": 4.7,
      "reviews": 432,
      "image":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
    {
      "name": "Lina Gomez",
      "club": "NY Woman's Flag Football",
      "age": 20,
      "rating": 4.8,
      "reviews": 512,
      "image":
          "https://images.unsplash.com/photo-1545996124-1a7f9b545f7d?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
  ];

  final List<Map<String, dynamic>> invitees = [
    {
      "name": "Kara Smith",
      "club": "Chicago Elite",
      "age": 27,
      "rating": 4.5,
      "reviews": 210,
      "image":
          "https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?w=800&q=80",
      "countryFlag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
    },
  ];

  final List<Map<String, dynamic>> sponsorships = [
    {
      "name": "Mariya Osteen",
      "club": "NY Woman’s Flag Football",
      "age": "21",
      "rating": "4.9",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
      "image": "https://i.ibb.co/WDrV1nV/girl-athlete.png",
    },
    {
      "name": "Helen Moore",
      "club": "NY Woman’s Flag Football",
      "age": "21",
      "rating": "4.7",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/4/41/Flag_of_India.svg",
      "image": "https://i.ibb.co/WDrV1nV/girl-athlete.png",
    },
  ];

  JobsSectionState jobsState = JobsSectionState.listing;
  ApplicantTab activeApplicantTab = ApplicantTab.newApplicants;
  int? selectedJobIndex;
  JobsSectionState? previousJobsState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(jobListProvider.notifier).fetchJobPosts();
      ref.read(profileProvider.notifier).getProfile();
    });
  }

  // -------------------- Helpers --------------------
  void _openCreateJobModal(BuildContext context) {
    final profileState = ref.read(profileProvider);
    final sports = profileState.profileUser?.sport ?? [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => CreateJobModal(sports: sports),
    ).then((_) {
      // Refresh job list after modal closes
      ref.read(jobListProvider.notifier).fetchJobPosts();
    });
  }

  void _showJobFromListing(int index) {
    setState(() {
      selectedJobIndex = index;

      previousJobsState = jobsState;
      jobsState = JobsSectionState.applicants;
    });
  }

  void _openDetailForSelectedJob() {
    if (selectedJobIndex == null) return;
    setState(() {
      previousJobsState = jobsState;
      // For now, all jobs from API are hiring type
      jobsState = JobsSectionState.jobDetail;
    });
  }

  void _jobsBack() {
    setState(() {
      if (previousJobsState != null) {
        jobsState = previousJobsState!;
      } else {
        jobsState = JobsSectionState.listing;
      }
      if (jobsState == JobsSectionState.listing) selectedJobIndex = null;
      previousJobsState = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.greyScaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.greyScaffoldBackground,
          elevation: 0,
          toolbarHeight: 65,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          // Replace with Svg if available
                          const Icon(Icons.search, color: AppColors.lightGrey),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/images/filter.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            // Tab bar (remains visible always)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.extraLightGrey,
                    width: 0.5,
                  ),
                ),
              ),
              child: const TabBar(
                indicatorColor: AppColors.primary,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.grey,
                indicatorWeight: 2.5,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(text: 'Jobs'),
                  Tab(text: 'Sponsorship'),
                ],
              ),
            ),

            // TabBarView - first is Jobs content (this changes its inner content),
            // second is Sponsorship content.
            Expanded(
              child: TabBarView(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    child: _jobsBodyForState(context),
                  ),
                  // Sponsorship tab
                  SponsorshipSection(
                    activeCount: 1,
                    closedCount: 0,
                    sponsorships: sponsorships,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _jobsBodyForState(BuildContext context) {
    switch (jobsState) {
      case JobsSectionState.listing:
        return KeyedSubtree(
          key: const ValueKey('jobs_listing'),
          child: _jobsListing(context),
        );
      case JobsSectionState.applicants:
        return KeyedSubtree(
          key: const ValueKey('jobs_applicants'),
          child: _applicantsView(context),
        );

      case JobsSectionState.jobDetail:
        return KeyedSubtree(
          key: const ValueKey('job_detail'),
          child: _jobDetailView(context),
        );
      case JobsSectionState.baDetail:
        return KeyedSubtree(
          key: const ValueKey('ba_detail'),
          child: _brandAmbassadorDetailView(context),
        );
    }
  }

  // -------------------- Listing --------------------
  Widget _jobsListing(BuildContext context) {
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
                child: _jobCard(jobs[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        CustomText(title: label, fontSize: 14, textColor: AppColors.grey),
        const SizedBox(height: 6),
        CustomText(title: value, fontSize: 18, fontWeight: FontWeight.w700),
      ],
    );
  }

  Widget _jobCard(Map<String, dynamic> job) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header row
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.black,
                        backgroundImage: NetworkImage(job["agencyLogo"]),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 4,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // title + subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: job["agencyName"],
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  CustomText(
                    title: job["location"],
                    fontSize: 14,
                    textColor: AppColors.grey,
                  ),
                ],
              ),
              const Spacer(),
              // more icon
              const Icon(Icons.more_vert, size: 22, color: AppColors.lightGrey),
            ],
          ),

          const SizedBox(height: 16),

          // price + title
          CustomText(
            title: job["price"],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
          const SizedBox(height: 6),
          CustomText(
            title: job["title"],
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),

          const SizedBox(height: 12),
          const Divider(color: AppColors.extraLightGrey, height: 1),

          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: job["tags"]
                .map<Widget>(
                  (tag) => CustomText(
                    title: tag,
                    fontSize: 12,
                    textColor: AppColors.blue,
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 20),
          Row(
            children: const [
              Icon(Icons.share_outlined, size: 22, color: AppColors.lightGrey),
              SizedBox(width: 30),
              Icon(Icons.favorite, size: 22, color: AppColors.red),
              SizedBox(width: 30),
              Icon(Icons.bookmark_border, size: 22, color: AppColors.lightGrey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyJobs(BuildContext context) {
    final double appBarHeight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    const double tabBarHeight = 48;
    final double viewportHeight =
        MediaQuery.of(context).size.height - appBarHeight - tabBarHeight;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: viewportHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: viewportHeight * 0.15),
              const Center(
                child: CustomText(
                  title: 'No job posted yet',
                  textColor: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RoundedButton(
                  label: 'Create a job post',
                  onPressed: () => _openCreateJobModal(context),
                  height: 50,
                  borderRadius: 8,
                  backgroundColor: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _applicantsView(BuildContext context) {
    final jobListState = ref.watch(jobListProvider);

    // Get real job data
    final apiJobs = jobListState.jobPosts;
    if (selectedJobIndex == null || selectedJobIndex! >= apiJobs.length) {
      return const Center(child: Text('Job not found'));
    }

    final selectedJob = apiJobs[selectedJobIndex!];
    final companyLogo = jobListState.companyLogo;

    return Column(
      key: const ValueKey('applicants_view'),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // back arrow
              GestureDetector(
                onTap: _jobsBack,
                child: const Icon(Icons.arrow_back, color: AppColors.lightGrey),
              ),
              const SizedBox(width: 12),
              // Company logo from API
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.lightGrey,
                backgroundImage: companyLogo != null && companyLogo.isNotEmpty
                    ? NetworkImage(UrlHelper.getFullImageUrl(companyLogo))
                    : null,
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
                      title: selectedJob.title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    GestureDetector(
                      onTap: _openDetailForSelectedJob,
                      child: const CustomText(
                        title: 'View detail',
                        fontSize: 14,
                        textColor: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 8),
              if (selectedJob.applicantCount > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CustomText(
                    title: selectedJob.applicantCount.toString(),
                    fontSize: 12,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ],
          ),
        ),

        // segmented tabs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
          child: Row(
            children: [
              _applicantTabButton(ApplicantTab.newApplicants, "New applicants"),
              const SizedBox(width: 16),
              _applicantTabButton(ApplicantTab.invitees, "Invitees"),
            ],
          ),
        ),

        // list of applicants (scrolls independently)
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: activeApplicantTab == ApplicantTab.newApplicants
                  ? newApplicants.length
                  : invitees.length,
              separatorBuilder: (_, __) => const SizedBox(height: 18),
              itemBuilder: (context, idx) {
                final applicant =
                    activeApplicantTab == ApplicantTab.newApplicants
                    ? newApplicants[idx]
                    : invitees[idx];
                return _applicantCard(applicant, context);
              },
            ),
          ),
        ),
      ],
    );
  }

  // -------------------- Job detail --------------------
  /// Generic job detail (hiring flow)
  Widget _jobDetailView(BuildContext context) {
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
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
                  onTap: _jobsBack,
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
      ),
    );
  }

  Widget _brandAmbassadorDetailView(BuildContext context) {
    final job = jobs[selectedJobIndex ?? 0];

    return SingleChildScrollView(
      key: const ValueKey('ba_detail_view'),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/on1.jpg"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: job["agencyName"],
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      CustomText(
                        title: job["location"],
                        fontSize: 14,
                        textColor: AppColors.grey,
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: _jobsBack,
                  child: const Icon(Icons.arrow_back, color: AppColors.black),
                ),
                const SizedBox(width: 12),
              ],
            ),
            const SizedBox(height: 20),

            // Title
            CustomText(
              title: job["title"],
              fontSize: 18,
              fontWeight: FontWeight.w800,
              textColor: AppColors.black,
            ),
            const SizedBox(height: 12),

            // Description paragraph (matching the screenshot spacing)
            CustomText(
              title: job["description"] ?? '',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              textColor: AppColors.grey,
            ),
            const SizedBox(height: 18),

            // Payment & timeline row (pixel aligned)
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: CustomText(
                    title: 'Payment',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                CustomText(
                  title: job["price"].toString().replaceAll('/m', ''),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: CustomText(
                    title: 'Time line',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                CustomText(
                  title: '6 months',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.grey,
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _applicantTabButton(ApplicantTab tab, String label) {
    final isActive = activeApplicantTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => activeApplicantTab = tab),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.greyScaffoldBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: CustomText(
              title: label,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              textColor: isActive ? AppColors.black : AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }

  void _showAthleteOverlay(
    BuildContext context,
    Map<String, dynamic> applicantData,
  ) {
    Navigator.push(
      context,
      PageRouteBuilder(
        barrierDismissible: true,
        opaque: false,
        barrierColor: AppColors.transparent,
        pageBuilder: (_, __, ___) =>
            ApplicantDetail(applicantData: applicantData),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      ),
    );
  }

  Widget _applicantCard(Map<String, dynamic> data, BuildContext context) {
    return InkWell(
      onTap: () {
        _showAthleteOverlay(context, data);
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            // main row
            Row(
              children: [
                SizedBox(
                  width: 140,
                  height: 170,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                    ),
                    child: Image.asset(
                      "assets/images/athlete.png",
                      fit: BoxFit.fill,
                      height: 150,
                      width: 140,
                    ),
                  ),
                ),

                // content area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: data["name"],
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.white,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          title: data["club"],
                          fontSize: 12,
                          textColor: AppColors.white.withValues(alpha: .85),
                        ),
                        const SizedBox(height: 6),
                        CustomText(
                          title: 'Age : ${data["age"]}',
                          fontSize: 12,
                          textColor: AppColors.white.withValues(alpha: .85),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Row(
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star,
                                  size: 16,
                                  color: i < (data["rating"] ?? 0).floor()
                                      ? AppColors.amber
                                      : AppColors.amber.withOpacity(0.3),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            CustomText(
                              title: '(${data["reviews"]})',
                              fontSize: 12,
                              textColor: AppColors.white,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        RoundedButton(
                          label: 'Send proposal',
                          onPressed: () {},
                          height: 36,
                          width: 140,
                          borderRadius: 20,
                          backgroundColor: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // country flag top-right
            Positioned(
              top: 10,
              right: 12,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/flag.png",
                  height: 28,
                  width: 28,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
