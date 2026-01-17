import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/athlete_feed_provider.dart'; // Ensure correct path
import 'package:athlink/features/auth/presentation/providers/login/login_provider.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/state/feed_state.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/sponsor_card.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class AthleteDashboardScreen extends ConsumerStatefulWidget {
  const AthleteDashboardScreen({super.key});

  @override
  ConsumerState<AthleteDashboardScreen> createState() =>
      _AthleteDashboardScreenState();
}

class _AthleteDashboardScreenState
    extends ConsumerState<AthleteDashboardScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    // Trigger the API call
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(athelteFeedProvider.notifier).getAthleteFeed();
    });
  }

  void _loadUserData() {
    final user = sl<LocalStorageService>().getUserData();
    setState(() {
      userName = user?.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(athelteFeedProvider);

    return Scaffold(
      backgroundColor: AppColors.greyScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildDashboardHeader(),
            _buildSearchHeader(),
            Expanded(
              child: feedState.when(
                initial: () => const Center(child: Text("Initializing...")),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
                error: (msg) => Center(
                  child: CustomText(title: msg, textColor: AppColors.error),
                ),
                success: (feedData, athletesBySport) {
                  final sportEntries = athletesBySport.entries.toList();

                  return CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(child: SizedBox(height: 16)),

                      // Sponsors Section (Recommended)
                      if (feedData.sponsors.isNotEmpty) ...[
                        _buildSectionHeader("Recommended", "Top brand picks"),
                        _buildSponsorSliver(feedData.sponsors),
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),
                      ],

                      // Athletes Grouped by Sport (Rising Peers)
                      for (var entry in sportEntries) ...[
                        _buildSectionHeader(entry.key, "Connect with peers"),
                        _buildAthleteSliver(entry.value),
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),
                      ],

                      const SliverPadding(padding: EdgeInsets.only(bottom: 30)),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ------------------------------------------------------------
  /// UI COMPONENTS
  /// ------------------------------------------------------------

  Widget _buildSearchHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: () {
          // // Pass current loaded athletes to search if needed
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const AthleteSearchPage()),
          // );
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.greyScaffoldBackground,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              const Expanded(
                child: CustomText(
                  title: 'Search athletes or clubs...',
                  textColor: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SvgPicture.asset("assets/images/filter.svg", height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  title: "Welcome back,",
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
                CustomText(
                  title: userName ?? "Athlete",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => ref.read(loginProvider.notifier).signOut(context),
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.error,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textColor: AppColors.primary,
            ),
            CustomText(
              title: subtitle,
              fontSize: 12,
              textColor: Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsorSliver(List<Sponsor> sponsors) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: sponsors.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            final sponsor = sponsors[index];

            // Logic to get image from sport icon or fallback
            final imageUrl =
                sponsor.sport.isNotEmpty && sponsor.sport.first.icon != null
                ? '$fileBaseUrl${sponsor.sport.first.icon}'
                : 'https://picsum.photos/400/300';

            return SponsorCard(
              name: sponsor.name ?? 'Brand',
              category: sponsor.sport.isNotEmpty
                  ? sponsor.sport.first.name ?? "Sponsor"
                  : "Partner",
              imageUrl: imageUrl,
            );
          },
        ),
      ),
    );
  }

  Widget _buildAthleteSliver(List<Athlete> athletes) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 340,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: athletes.length,
          separatorBuilder: (_, __) => const SizedBox(width: 14),
          itemBuilder: (context, index) {
            final athleteData = athletes[index];
            final profile = athleteData.athleteProfile;

            // Use fallback logic for cleaner display
            final name = profile?.name ?? 'Athlete';
            final club = profile?.club ?? 'Independent';
            final imageUrl = profile?.profileImageUrl != null
                ? '$fileBaseUrl${profile!.profileImageUrl}'
                : 'https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-5652137.png';

            return AthleteCard(
              athleteId: athleteData.id,
              name: name,
              club: club,
              age: profile?.age?.toString() ?? '20',
              flag: 'assets/images/flag.png', // Or use dynamic if available
              image: imageUrl,
              highestSocialMediaPresence:
                  profile?.highestSocialMediaPresence ?? "0",
              sponsorshipDone: (profile?.sponsorshipDone ?? 0).toString(),
              rating: profile?.rating ?? 0.0,
              achievements: profile?.achievements ?? [],
            );
          },
        ),
      ),
    );
  }
}
