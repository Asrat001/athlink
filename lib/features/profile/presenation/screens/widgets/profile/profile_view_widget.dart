import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/manage/presentation/providers/state/job_list_state.dart';
import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/profile/athletes_sponsored_3d.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'profile_stats_widget.dart';

class ProfileViewWidget extends ConsumerWidget {
  final SponsorProfile? sponsorProfile;

  const ProfileViewWidget({super.key, required this.sponsorProfile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 80),
        CustomText(
          title: sponsorProfile?.name ?? "No name set",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          textColor: AppColors.black,
        ),
        CustomText(
          title: sponsorProfile?.address ?? "No address set",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textColor: AppColors.textGrey,
        ),
        const SizedBox(height: 30),
        ProfileStatsWidget(
          sponsorshipCampaigns: sponsorProfile?.stats.sponsorshipCampaigns,
          athletesSponsored: sponsorProfile?.stats.athletesSponsored,
          globalPartners: sponsorProfile?.stats.globalPartners,
        ),
        const SizedBox(height: 30),
        _buildDescription(),
        const SizedBox(height: 20),
        _buildAthletesSponsoredSection(ref),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomText(
        title: sponsorProfile?.description ?? "No description set",
        textAlign: TextAlign.center,
        textColor: AppColors.textSecondary,
        fontWeight: FontWeight.w300,
        fontSize: 12,
      ),
    );
  }

  Widget _buildAthletesSponsoredSection(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: CustomText(
            title: "Athletes Sponsored",
            fontSize: 14,
            fontWeight: FontWeight.bold,
            textColor: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        _buildAthletesSponsoredContent(ref),
      ],
    );
  }

  Widget _buildAthletesSponsoredContent(WidgetRef ref) {
    final jobListState = ref.watch(jobListProvider);

    // Check if it's loading
    if (jobListState.isSponsorshipsLoading) {
      return SizedBox(
        height: 400,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    // Check for error
    if (jobListState.sponsorshipsErrorMessage != null) {
      return SizedBox(
        height: 400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: 'Error loading sponsored athletes',
                textColor: AppColors.red,
              ),
              const SizedBox(height: 8),
              CustomText(
                title: jobListState.sponsorshipsErrorMessage!,
                textColor: AppColors.grey,
                fontSize: 12,
              ),
            ],
          ),
        ),
      );
    }

    // Check if sponsored athletes list is empty
    if (jobListState.sponsoredAthletes.isEmpty) {
      return SizedBox(
        height: 400,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: 'No sponsored athletes yet',
                textColor: AppColors.grey,
                fontSize: 16,
              ),
              const SizedBox(height: 8),
              CustomText(
                title: 'Accept applicants in the Manage tab to see them here',
                textColor: AppColors.grey,
                fontSize: 12,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return _buildAthletes3DGlobe(jobListState);
  }

  Widget _buildAthletes3DGlobe(JobListState jobListState) {
    // Map sponsored athletes to images, names, and positions
    final athleteImages = jobListState.sponsoredAthletes.map((item) {
      final profileImageUrl = item.athlete.athleteProfile?.profileImageUrl;
      if (profileImageUrl != null && profileImageUrl.isNotEmpty) {
        return '$fileBaseUrl$profileImageUrl';
      }
      final idHash = item.athlete.id?.hashCode ?? 0;
      return 'https://picsum.photos/200?random=${idHash.abs()}';
    }).toList();

    final athleteNames = jobListState.sponsoredAthletes.map((item) {
      String? name = item.athlete.athleteProfile?.name ?? item.athlete.name;

      if (name == null || name.isEmpty) {
        final email = item.athlete.email;
        if (email != null && email.isNotEmpty) {
          name = email.split('@').first;
          if (name.isNotEmpty) {
            name = name[0].toUpperCase() + name.substring(1);
          }
        }
      }

      return name ?? 'Athlete ${item.athlete.id?.substring(0, 8) ?? ""}';
    }).toList();

    final athletePositions = jobListState.sponsoredAthletes.map((item) {
      final position = item.athlete.athleteProfile?.position;
      if (position != null && position.isNotEmpty) {
        return position;
      }
      final sportName = item.athlete.sport.isNotEmpty == true
          ? item.athlete.sport.first.name
          : null;
      return sportName ?? 'Professional Athlete';
    }).toList();

    return AthletesSponsored3d(
      athleteImages: athleteImages,
      athleteNames: athleteNames,
      athletePositions: athletePositions,
      sponsorName: sponsorProfile?.name ?? 'Sponsor',
    );
  }
}
