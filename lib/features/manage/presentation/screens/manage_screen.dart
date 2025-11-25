import 'package:athlink/features/home_feed/presentation/providers/feed_provider.dart';
import 'package:athlink/features/manage/domain/models/job_list_model.dart'
    as manage_models;
import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/jobs_tab.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/applicant_detail.dart';
import 'package:athlink/features/manage/presentation/screens/widgets/sponsorship_section.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ManageScreen extends ConsumerStatefulWidget {
  const ManageScreen({super.key});

  @override
  ConsumerState<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends ConsumerState<ManageScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("=== INIT: Fetching initial data ===");
      ref.read(jobListProvider.notifier).fetchJobPosts();
      ref.read(jobListProvider.notifier).fetchSponsoredAthletes();
      debugPrint("=== INIT: Calling getSponsorInvitations ===");
      ref.read(jobListProvider.notifier).getSponsorInvitations();
      ref.read(profileProvider.notifier).getProfile();
      ref.read(feedProvider.notifier).getFeed();
    });
  }



  bool _isApplicationAccepted(String applicationId) {
    final jobListState = ref.watch(jobListProvider);

    // Check if this application ID exists in the sponsored athletes list
    return jobListState.sponsoredAthletes.any(
      (sponsoredAthlete) => sponsoredAthlete.applicationId == applicationId,
    );
  }

  // Check if an athlete has been invited for a specific job
  // Returns the invitation ID if found and active, null otherwise
  String? _getInvitationId(String athleteId, String jobId) {
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
                    child: JobsTab(
                      showAthleteDetailOverlay:
                          (application, jobId, isApplicant) {
                            _showAthleteDetailOverlay(
                              context,
                              application,
                              jobId,
                              isApplicant: isApplicant,
                            );
                          },
                    ),
                  ),
                  // Sponsorship tab
                  Consumer(
                    builder: (context, ref, child) {
                      final jobListState = ref.watch(jobListProvider);

                      // Convert sponsored athletes to the format expected by SponsorshipSection
                      final sponsorshipsData = jobListState.sponsoredAthletes
                          .map((item) {
                            final athleteProfile = item.athlete.athleteProfile;
                            return {
                              "name":
                                  athleteProfile?.name ??
                                  item.athlete.name ??
                                  'Unknown',
                              "club": athleteProfile?.position ?? "Athlete",
                              "age": athleteProfile?.age?.toString() ?? 'N/A',
                              "rating":
                                  athleteProfile?.rating?.toStringAsFixed(1) ??
                                  '0.0',
                              "flag": athleteProfile?.countryFlag ?? "",
                              "image": athleteProfile?.profileImageUrl ?? "",
                              "jobTitle": item.jobPost.title,
                              "applicationId": item.applicationId,
                              "acceptedAt": item.acceptedAt,
                              "athleteId": item.athlete.id ?? '',
                              "jobId": item.jobPost.id,
                            };
                          })
                          .toList();

                      return SponsorshipSection(
                        activeCount: jobListState.sponsoredAthletes.length,
                        closedCount: 0,
                        sponsorships: sponsorshipsData,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAthleteDetailOverlay(
    BuildContext context,
    manage_models.JobApplication application,
    String jobId, {
    required bool isApplicant,
  }) {
    final isAccepted =
        isApplicant &&
        application.id.isNotEmpty &&
        _isApplicationAccepted(application.id);

    // Check if athlete has been invited for this job
    final invitationId = !isApplicant && application.athlete.id != null
        ? _getInvitationId(application.athlete.id!, jobId)
        : null;
    final hasInvitation = invitationId != null;

    Navigator.push(
      context,
      PageRouteBuilder(
        barrierDismissible: true,
        opaque: false,
        barrierColor: AppColors.transparent,
        pageBuilder: (_, _, _) => ApplicantDetail(
          athlete: application.athlete,
          isApplicant: isApplicant,
          jobId: jobId,
          isAccepted: isAccepted,
          hasInvitation: hasInvitation,
          onAccept: isAccepted
              ? null
              : (isApplicant && application.id.isNotEmpty
                    ? () async {
                        // Accept the applicant
                        final result = await ref
                            .read(jobListProvider.notifier)
                            .acceptApplicant(
                              jobId: jobId,
                              applicationId: application.id,
                            );

                        if (context.mounted) {
                          result.when(
                            success: (data) {
                              final response =
                                  data as manage_models.AcceptApplicantResponse;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(response.message),
                                  backgroundColor: AppColors.success,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            failure: (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Error: ${NetworkExceptions.getErrorMessage(error)}',
                                  ),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                            },
                          );
                        }
                      }
                    : null),
          onSendProposal:
              !isApplicant && !hasInvitation && application.athlete.id != null
              ? () async {
                  // Send invitation to athlete
                  final result = await ref
                      .read(jobListProvider.notifier)
                      .sendInvitation(
                        athleteId: application.athlete.id!,
                        jobId: jobId,
                        message:
                            'We would love to sponsor you for this opportunity!',
                      );

                  if (context.mounted) {
                    result.when(
                      success: (data) {
                        final response =
                            data as manage_models.SendInvitationResponse;
                        // Refresh invitations to update button state
                        ref
                            .read(jobListProvider.notifier)
                            .getSponsorInvitations();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response.message),
                            backgroundColor: AppColors.success,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      failure: (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error: ${NetworkExceptions.getErrorMessage(error)}',
                            ),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      },
                    );
                  }
                }
              : null,
          onCancelProposal: null,
        ),
        transitionsBuilder: (_, anim, _, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      ),
    );
  }
}
