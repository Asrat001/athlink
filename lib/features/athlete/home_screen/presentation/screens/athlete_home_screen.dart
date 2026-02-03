import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/athlete_feed_provider.dart';
import 'package:athlink/features/auth/presentation/providers/login/login_provider.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/state/feed_state.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/sponsor_card.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
      backgroundColor: AppColors.black, // Updated to match Profile black
      body: SafeArea(
        child: Column(
          children: [
            // Sticky Header and Search (Darkened)
            _buildDashboardHeader(),
            _buildSearchHeader(
              feedState.maybeWhen(
                success: (d, _) => d.athletes,
                orElse: () => [],
              ),
              feedState.maybeWhen(
                success: (d, _) => d.sponsors,
                orElse: () => [],
              ),
            ),

            Expanded(
              child: feedState.when(
                initial: () => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.white),
                ),
                error: (msg) => _buildEmptyOrErrorState(
                  message: msg,
                  icon: Icons.error_outline,
                  isError: true,
                ),
                success: (feedData, athletesBySport) {
                  if (feedData.athletes.isEmpty && feedData.sponsors.isEmpty) {
                    return _buildEmptyOrErrorState(
                      message: "No athletes or brands found.",
                      icon: Icons.search_off_rounded,
                    );
                  }

                  return RefreshIndicator(
                    color: AppColors.primary,
                    backgroundColor: AppColors.darkGreyCard,
                    onRefresh: () =>
                        ref.read(athelteFeedProvider.notifier).getAthleteFeed(),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: [
                        const SliverToBoxAdapter(child: SizedBox(height: 20)),

                        if (feedData.sponsors.isNotEmpty) ...[
                          _buildSectionHeader("Recommended", "Top brand picks"),
                          _buildSponsorSliver(feedData.sponsors),
                          const SliverToBoxAdapter(child: SizedBox(height: 24)),
                        ],

                        for (var entry in athletesBySport.entries) ...[
                          _buildSectionHeader(entry.key, "Connect with peers"),
                          _buildAthleteSliver(entry.value),
                          const SliverToBoxAdapter(child: SizedBox(height: 24)),
                        ],

                        const SliverPadding(
                          padding: EdgeInsets.only(bottom: 40),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyOrErrorState({
    required String message,
    required IconData icon,
    bool isError = false,
  }) {
    return RefreshIndicator(
      onRefresh: () => ref.read(athelteFeedProvider.notifier).getAthleteFeed(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 70,
                color: isError ? AppColors.error : Colors.white24,
              ),
              const SizedBox(height: 16),
              CustomText(
                title: isError ? "Connection Error" : "No content available",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
              ),
              const SizedBox(height: 8),
              CustomText(
                title: message,
                textAlign: TextAlign.center,
                textColor: Colors.white60,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () =>
                    ref.read(athelteFeedProvider.notifier).getAthleteFeed(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text("Refresh Feed"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.black,
        border: Border(bottom: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        children: [
          PopupMenuButton<int>(
            offset: const Offset(0, 50),
            color: AppColors.darkGreyCard, // Dark popup background
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (value) {
              if (value == 0) StatefulNavigationShell.of(context).goBranch(4);
              if (value == 1) ref.read(loginProvider.notifier).signOut(context);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Go to Profile",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const PopupMenuDivider(color: Colors.white10),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    const Icon(Icons.logout, color: AppColors.error, size: 22),
                    const SizedBox(width: 12),
                    const Text(
                      "Logout",
                      style: TextStyle(color: AppColors.error),
                    ),
                  ],
                ),
              ),
            ],
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white, size: 22),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  title: "Welcome back",
                  fontSize: 12,
                  textColor: Colors.white60,
                ),
                // CustomText(
                //   title: userName ?? "Athlete",
                //   fontSize: 16,
                //   fontWeight: FontWeight.bold,
                //   textColor: Colors.white,
                // ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.push(Routes.connectionRequestsScreen),
            icon: const Icon(Icons.people_outline, color: Colors.white),
          ),
          IconButton(
            onPressed: () => context.push(Routes.notificationScreen),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader(List<Athlete> athletes, List<Sponsor> sponsors) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: () => context.push(
          Routes.athleteSearchScreen,
          extra: {
            'athletes': athletes,
            'sponsors': sponsors,
            'isDarkMode': true,
          },
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.darkGreyCard, // Matching the profile section cards
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.white60),
              const SizedBox(width: 8),
              const Expanded(
                child: CustomText(
                  title: 'Search athletes or sponsors...',
                  textColor: Colors.white60,
                  fontSize: 14,
                ),
              ),
              SvgPicture.asset(
                "assets/images/filter.svg",
                height: 20,
                colorFilter: const ColorFilter.mode(
                  Colors.white60,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) =>
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
              ),
              CustomText(
                title: subtitle,
                fontSize: 12,
                textColor: Colors.white38,
              ),
            ],
          ),
        ),
      );

  Widget _buildSponsorSliver(List<Sponsor> sponsors) => SliverToBoxAdapter(
    child: SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: sponsors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final sponsor = sponsors[index];
          return SponsorCard(
            name: sponsor.sponsorProfile?.name ?? 'Brand',
            isDarkMode: true,
            category: sponsor.sport.isNotEmpty
                ? sponsor.sport.first.name ?? "Sponsor"
                : "Partner",
            imageUrl: sponsor.sponsorProfile?.profileImageUrl != null
                ? "$fileBaseUrl${sponsor.sponsorProfile?.profileImageUrl}"
                : 'https://picsum.photos/400/300',
          );
        },
      ),
    ),
  );

  Widget _buildAthleteSliver(List<Athlete> athletes) => SliverToBoxAdapter(
    child: SizedBox(
      height: 350, // Slightly taller for dark layout spacing
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: athletes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final athlete = athletes[index];
          final profile = athlete.athleteProfile;
          return AthleteCard(
            location: athlete.athleteProfile?.location ?? "",
            isAthlete: true,
            athleteId: athlete.id,
            name: profile?.name ?? 'Athlete',
            club: profile?.club ?? 'Independent',
            age: profile?.age?.toString() ?? '20',
            flag: 'assets/images/flag.png',
            image: profile?.profileImageUrl != null
                ? '$fileBaseUrl${profile!.profileImageUrl}'
                : 'https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-5652137.png',
            highestSocialMediaPresence:
                profile?.highestSocialMediaPresence ?? "0",
            sponsorshipDone: (profile?.sponsorshipDone ?? 0).toString(),
            achievements: profile?.achievements ?? [],
            onTap: () => context.push(
              Routes.viewAthleteScreen,
              extra: {'athleteId': athlete.id, 'isSelf': false},
            ),
          );
        },
      ),
    ),
  );
}
