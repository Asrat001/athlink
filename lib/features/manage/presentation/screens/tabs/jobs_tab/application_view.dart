import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/home_feed/presentation/providers/feed_provider.dart';
import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/manage/presentation/screens/manage_enums.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/applicant_card_widget.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/applicant_tab_button.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/manage/domain/models/job_list_model.dart'
    as manage_models;

class ApplicationView extends ConsumerWidget {
  const ApplicationView({super.key,
   this.selectedJobIndex,
   required this.openDetailForSelectedJob,
   required this.onApplicatntTabCliked,
   required this.activeTab,
   required this.onJobBack,
   required this.showAthleteDetailOverlay,
  });

  final int? selectedJobIndex;
  final ApplicantTab activeTab;
  final VoidCallback openDetailForSelectedJob;
  final VoidCallback onApplicatntTabCliked;
  final VoidCallback onJobBack;
  final Function(manage_models.JobApplication jobApplication, String jobId, bool isApplicant) showAthleteDetailOverlay;

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
                onTap: onJobBack,
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
                      onTap: openDetailForSelectedJob,
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
              ApplicantTabButton(
                tab: ApplicantTab.newApplicants,
                activeTab: activeTab,
                label: "New applicants",
                onTap: onApplicatntTabCliked
              ),
              const SizedBox(width: 16),
              ApplicantTabButton(
                tab: ApplicantTab.invitees,
                activeTab: activeTab,
                label: "Invitees",
                onTap: onApplicatntTabCliked
              ),
            ],
          ),
        ),

        // list of applicants (scrolls independently)
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: _buildApplicantsList(selectedJob,ref),
          ),
        ),
      ],
    );
  }


 Widget _buildApplicantsList(dynamic selectedJob,WidgetRef ref) {
    
    if (activeTab == ApplicantTab.newApplicants) {
      // Show actual applicants
      if (selectedJob.applications.isEmpty) {
        return Center(
          child: CustomText(
            title: 'No new applicants yet',
            textColor: AppColors.grey,
            fontSize: 16,
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: selectedJob.applications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemBuilder: (context, idx) {
          final application = selectedJob.applications[idx];
          return _applicantCardFromAPI(
            application,
            selectedJob.id,
            ref,
            context,
            isApplicant: true,
          );
        },
      );
    } else {
      // Show filtered athletes by sport (invitees)
      final filteredAthletes = _getFilteredAthletesBySport(
        selectedJob.sportId.id,
        ref
      );
      final feedState = ref.watch(feedProvider);

      if (feedState.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (feedState.errorMessage != null) {
        return Center(
          child: CustomText(
            title: 'Error loading athletes',
            textColor: AppColors.red,
            fontSize: 16,
          ),
        );
      }

      // Get list of athlete IDs who have already applied
      final applicantIds = selectedJob.applications
          .map((app) => app.athlete.id)
          .where((id) => id != null)
          .toSet();

      // Get list of athlete IDs who have been accepted/sponsored
      final jobListState = ref.watch(jobListProvider);
      final sponsoredAthleteIds = jobListState.sponsoredAthletes
          .map((sponsored) => sponsored.athlete.id)
          .where((id) => id != null)
          .toSet();

      // Filter out athletes who have already applied OR been sponsored
      final availableAthletes = filteredAthletes.where((athlete) {
        return !applicantIds.contains(athlete.id) &&
            !sponsoredAthleteIds.contains(athlete.id);
      }).toList();

      if (availableAthletes.isEmpty) {
        return Center(
          child: CustomText(
            title: 'No athletes found for this sport',
            textColor: AppColors.grey,
            fontSize: 16,
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.only(bottom: 24),
        itemCount: availableAthletes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 18),
        itemBuilder: (context, idx) {
          final athlete = availableAthletes[idx];
          // For invitees, create a JobApplication wrapper without application ID
          final fakeApplication = manage_models.JobApplication(
            id: '', // Empty application ID for invitees
            athlete: athlete,
          );
          return _applicantCardFromAPI(
            fakeApplication,
            selectedJob.id,
            ref,
            context,
            isApplicant: false,
          );
        },
      );
    }
  }

    List<Athlete> _getFilteredAthletesBySport(String sportId,WidgetRef ref) {
    final feedState = ref.watch(feedProvider);

    if (feedState.feedData == null || feedState.feedData!.athletes.isEmpty) {
      return [];
    }

    // Filter athletes that have the same sport as the job
    return feedState.feedData!.athletes.where((athlete) {
      return athlete.sport.any((sport) => sport.id == sportId);
    }).toList();
  }



  Widget _applicantCardFromAPI(
    
    manage_models.JobApplication application,
    String jobId,
    WidgetRef ref,
    BuildContext context, {
    required bool isApplicant,
  }) {
    final applicant = application.athlete;
    final isAccepted =
        isApplicant &&
        application.id.isNotEmpty &&
        _isApplicationAccepted(application.id,ref);
    final invitationId = !isApplicant && applicant.id != null
        ? _getInvitationId(applicant.id!, jobId,ref)
        : null;
    final hasInvitation = invitationId != null;

    return ApplicantCardWidget(
      application: application,
      jobId: jobId,
      isApplicant: isApplicant,
      isAccepted: isAccepted,
      hasInvitation: hasInvitation,
      onTap:showAthleteDetailOverlay(application, jobId, isApplicant)
    );
  }
    bool _isApplicationAccepted(String applicationId,WidgetRef ref) {
    final jobListState = ref.watch(jobListProvider);

    // Check if this application ID exists in the sponsored athletes list
    return jobListState.sponsoredAthletes.any(
      (sponsoredAthlete) => sponsoredAthlete.applicationId == applicationId,
    );
  }

  // Check if an athlete has been invited for a specific job
  // Returns the invitation ID if found and active, null otherwise
  String? _getInvitationId(String athleteId, String jobId,WidgetRef ref) {
    
    final jobListState = ref.watch(jobListProvider);

    // Debug: Print all invitations to see what we have
    debugPrint(
      "=== Checking invitations for athlete: $athleteId, job: $jobId ===",
    );
    debugPrint("Total invitations: ${jobListState.invitations.length}");

    for (var inv in jobListState.invitations) {
      final invAthleteId = inv.athlete['_id'] as String?;
      final invJobId = inv.jobPost is String
          ? inv.jobPost
          : (inv.jobPost as Map<String, dynamic>?)?['_id'] as String?;
      debugPrint(
        "Invitation: athlete=$invAthleteId, job=$invJobId, status=${inv.status}",
      );
    }

    // Find invitation that matches both athlete and job (ANY status)
    try {
      final invitation = jobListState.invitations.firstWhere((inv) {
        // Extract athlete ID from the athlete map
        final invAthleteId = inv.athlete['_id'] as String?;
        // jobPost could be a string ID or an object
        final invJobId = inv.jobPost is String
            ? inv.jobPost
            : (inv.jobPost as Map<String, dynamic>?)?['_id'] as String?;

        // Check if IDs match (regardless of status)
        final matches = invAthleteId == athleteId && invJobId == jobId;

        if (matches) {
          debugPrint("FOUND INVITATION: ID ${inv.id}, status: ${inv.status}");
        }
        return matches;
      });
      return invitation.id;
    } catch (e) {
      // No invitation found
      debugPrint("NO INVITATION FOUND for athlete: $athleteId, job: $jobId");
      return null;
    }
  }



}