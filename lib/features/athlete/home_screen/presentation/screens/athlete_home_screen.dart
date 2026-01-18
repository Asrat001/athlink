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
      backgroundColor: AppColors.greyScaffoldBackground,
      body: SafeArea(
        child: feedState.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (msg) => Center(
            child: CustomText(title: msg, textColor: AppColors.error),
          ),
          success: (feedData, athletesBySport) {
            return Column(
              children: [
                _buildDashboardHeader(),
                _buildSearchHeader(feedData.athletes, feedData.sponsors),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () =>
                        ref.read(athelteFeedProvider.notifier).getAthleteFeed(),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        const SliverToBoxAdapter(child: SizedBox(height: 16)),
                        if (feedData.sponsors.isNotEmpty) ...[
                          _buildSectionHeader("Recommended", "Top brand picks"),
                          _buildSponsorSliver(feedData.sponsors),
                          const SliverToBoxAdapter(child: SizedBox(height: 16)),
                        ],
                        for (var entry in athletesBySport.entries) ...[
                          _buildSectionHeader(entry.key, "Connect with peers"),
                          _buildAthleteSliver(entry.value),
                          const SliverToBoxAdapter(child: SizedBox(height: 16)),
                        ],
                        const SliverPadding(
                          padding: EdgeInsets.only(bottom: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
      ),
      child: Row(
        children: [
          PopupMenuButton<int>(
            offset: const Offset(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onSelected: (value) {
              if (value == 0) {
                final shell = StatefulNavigationShell.of(context);

                shell.goBranch(4);
              }
              if (value == 1) ref.read(loginProvider.notifier).signOut(context);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColors.primary,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    const Text("Go to Profile"),
                  ],
                ),
              ),
              const PopupMenuDivider(),
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
            onPressed: () => context.push(Routes.notificationScreen),
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader(List<Athlete> athletes, List<Sponsor> sponsors) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: () => context.push(
          Routes.athleteSearchScreen,
          extra: {'athletes': athletes, 'sponsors': sponsors},
        ),
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
                  title: 'Search athletes or sponsors...',
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

  Widget _buildSectionHeader(String title, String subtitle) => SliverPadding(
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
            name: sponsor.name ?? 'Brand',
            category: sponsor.sport.isNotEmpty
                ? sponsor.sport.first.name ?? "Sponsor"
                : "Partner",
            imageUrl:
                sponsor.sport.isNotEmpty && sponsor.sport.first.icon != null
                ? '$fileBaseUrl${sponsor.sport.first.icon}'
                : 'https://picsum.photos/400/300',
          );
        },
      ),
    ),
  );

  Widget _buildAthleteSliver(List<Athlete> athletes) => SliverToBoxAdapter(
    child: SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: athletes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final athlete = athletes[index];
          final profile = athlete.athleteProfile;
          return AthleteCard(
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
            rating: profile?.rating ?? 0.0,
            achievements: profile?.achievements ?? [],
            onTap: () {
              // Navigating to profile as a viewer
              context.push(
                Routes.viewAthleteScreen,
                extra: {'athleteId': athlete.id, 'isSelf': false},
              );
            },
          );
        },
      ),
    ),
  );
}
