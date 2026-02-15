import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/sponsor/manage/presentation/providers/state/job_list_state.dart';
import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/profile/athletes_sponsored_3d.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/profile/profile_stats_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileViewWidget extends ConsumerWidget {
  final SponsorProfile? sponsorProfile;
  final String? displayName;
  final bool isDarkMode;
  final bool isSelf;

  const ProfileViewWidget({
    super.key,
    required this.sponsorProfile,
    this.displayName,
    this.isDarkMode = false,
    this.isSelf = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 80),
        CustomText(
          title: displayName ?? sponsorProfile?.name ?? "No name set",
          fontSize: 24,
          fontWeight: FontWeight.bold,
          textColor: isDarkMode ? Colors.white : AppColors.black,
        ),
        CustomText(
          title: sponsorProfile?.address ?? "No address set",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          textColor: isDarkMode ? Colors.white70 : AppColors.textGrey,
        ),
        const SizedBox(height: 30),
        const SizedBox(height: 30),
        ProfileStatsWidget(
          sponsorshipCampaigns: sponsorProfile?.stats.sponsorshipCampaigns,
          athletesSponsored: sponsorProfile?.stats.athletesSponsored,
          globalPartners: sponsorProfile?.stats.globalPartners,
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 30),
        _buildDescription(),
        const SizedBox(height: 20),
        _buildWebsiteLink(),
        _buildSocialMediaLinks(),
        const SizedBox(height: 20),
        _buildAthletesSponsoredSection(ref),
        const SizedBox(height: 80),
      ],
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildWebsiteLink() {
    if (sponsorProfile?.websiteUrl.isEmpty ?? true)
      return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: () => _launchUrl(sponsorProfile!.websiteUrl),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.language,
              size: 16,
              color: isDarkMode ? Colors.white : AppColors.primary,
            ),
            const SizedBox(width: 8),
            CustomText(
              title: sponsorProfile!.websiteUrl,
              textColor: isDarkMode ? Colors.white : AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    if (sponsorProfile?.socialLinks.isEmpty ?? true)
      return const SizedBox.shrink();

    final socialIcons = <String, IconData>{
      'facebook': Icons.facebook,
      'twitter': Icons.alternate_email,
      'instagram': Icons.camera_alt_outlined,
      'linkedin': Icons.work_outline,
      'youtube': Icons.video_library_outlined,
      'tiktok': Icons.music_note,
    };

    final List<Widget> socialWidgets = [];
    sponsorProfile!.socialLinks.forEach((key, value) {
      if (value.isNotEmpty && socialIcons.containsKey(key)) {
        socialWidgets.add(
          IconButton(
            icon: Icon(
              socialIcons[key],
              color: isDarkMode ? Colors.white70 : AppColors.grey,
            ),
            onPressed: () => _launchUrl(value),
          ),
        );
      }
    });

    if (socialWidgets.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: socialWidgets,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomText(
        title: sponsorProfile?.description ?? "No description set",
        textAlign: TextAlign.center,
        textColor: isDarkMode ? Colors.white70 : AppColors.textSecondary,
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
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: CustomText(
            title: "Athletes Sponsored",
            fontSize: 14,
            fontWeight: FontWeight.bold,
            textColor: isDarkMode ? Colors.white : AppColors.textPrimary,
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
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title: 'No sponsored athletes yet',
                textColor: isDarkMode ? Colors.white54 : AppColors.grey,
                fontSize: 16,
              ),
              if (isSelf) ...[
                const SizedBox(height: 8),
                CustomText(
                  title: 'Accept applicants in the Manage tab to see them here',
                  textColor: isDarkMode ? Colors.white38 : AppColors.grey,
                  fontSize: 12,
                  textAlign: TextAlign.center,
                ),
              ],
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
