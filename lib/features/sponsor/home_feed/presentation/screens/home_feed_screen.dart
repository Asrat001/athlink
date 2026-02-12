import 'dart:math';

import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/feed_provider.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/state/feed_state.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/sponsor_card.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/utils/name_helper.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

/// ------------------------------------------------------------
/// RANDOM DATA HELPER
/// ------------------------------------------------------------
class RandomDataHelper {
  static final _random = Random();

  // ATHLETES
  static const List<String> athleteNames = [
    'Daniel Bekele',
    'Samuel Tesfaye',
    'Michael Johnson',
    'Alex Morgan',
    'Yonas Kebede',
    'Abel Kiptoo',
    'Nathan Walker',
    'Joseph Ayele',
    'Chris Adams',
    'Dawit Mekonnen',
  ];

  static const List<String> athleteClubs = [
    'St. George FC',
    'Ethiopia Coffee',
    'Nyala FC',
    'Dashen Brewery',
    'Adama City',
    'Hawassa FC',
    'Sheger United',
    'Commercial Bank SC',
    'Dire Dawa City',
  ];

  static const List<String> athleteAges = [
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
  ];

  // SPONSORS
  static const List<String> sponsorNames = [
    'Nike Sports',
    'Adidas Performance',
    'Puma Africa',
    'Dashen Bank',
    'Ethio Telecom',
    'Coca-Cola Africa',
    'Pepsi Ethiopia',
    'BetKing Sports',
    'Total Energies',
    'Red Bull Athletics',
  ];

  static String randomAthleteName() =>
      athleteNames[_random.nextInt(athleteNames.length)];

  static String randomAthleteClub() =>
      athleteClubs[_random.nextInt(athleteClubs.length)];

  static String randomAthleteAge() =>
      athleteAges[_random.nextInt(athleteAges.length)];

  static String randomSponsorName() =>
      sponsorNames[_random.nextInt(sponsorNames.length)];
}

/// ------------------------------------------------------------
/// HOME FEED SCREEN
/// ------------------------------------------------------------
class HomeFeedScreen extends ConsumerStatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  ConsumerState<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends ConsumerState<HomeFeedScreen> {
  bool isFilterOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(feedProvider.notifier).getFeed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final feedState = ref.watch(feedProvider);

    return Scaffold(
      backgroundColor: AppColors.greyScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            _SearchHeader(
              athletes: feedState.maybeWhen(
                success: (data, _) => data.athletes,
                orElse: () => [],
              ),
              sponsors: feedState.maybeWhen(
                success: (data, _) => data.sponsors,
                orElse: () => [],
              ),
              isFilterOpen: isFilterOpen,
              onFilterTap: () => setState(() => isFilterOpen = !isFilterOpen),
              onNotificationTap: () =>
                  GoRouter.of(context).push(Routes.notificationScreen),
            ),
            Expanded(child: _buildFeedContent(feedState)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedContent(FeedState feedState) {
    return feedState.when(
      initial: () => const Center(child: Text("Setting up feed...")),
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      success: (feedData, athletesBySport) {
        final sportEntries = athletesBySport.entries.toList();

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final entry = sportEntries[index];
                return _buildSportSectionContent(
                  sportName: entry.key,
                  athletes: entry.value,
                );
              }, childCount: sportEntries.length),
            ),
            _buildSponsorsHeaderSliver(),
            _buildSponsorsListSliver(feedData.sponsors),
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
          ],
        );
      },
      error: (msg) => _buildErrorState(msg),
    );
  }

  /// ------------------------------------------------------------
  /// ATHLETE CARD (WITH RANDOM FALLBACKS)
  /// ------------------------------------------------------------
  Widget _buildAthleteCard(Athlete athleteData) {
    final athlete = athleteData.athleteProfile;
    final sport = athleteData.sport;

    final name = (athlete?.name?.trim().isNotEmpty ?? false)
        ? athlete!.name!
        : RandomDataHelper.randomAthleteName();

    final age = athlete?.age != null
        ? athlete!.age.toString()
        : RandomDataHelper.randomAthleteAge();

    final club = (athlete?.club?.trim().isNotEmpty ?? false)
        ? athlete!.club!
        : RandomDataHelper.randomAthleteClub();

    final imageUrl = athlete?.profileImageUrl != null
        ? '$fileBaseUrl${athlete!.profileImageUrl}'
        : 'https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-5652137.png';

    return AthleteCard(
      athleteId: athleteData.id,
      name: name,
      isAthlete: false,
      location: athleteData.athleteProfile?.location ?? "",
      club: club,
      age: age,
      flag: 'https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg',
      image: imageUrl,
      achievements: athlete?.achievements ?? [],
      position: athlete?.position ?? 'Position',
      level: athlete?.level,
      // rating: athlete?.rating ?? 0,
      sponsorshipDone: (athlete?.sponsorshipDone ?? 0).toString(),
      highestSocialMediaPresence: athlete?.highestSocialMediaPresence ?? '0',
      sportCategory: sport.map((e) => e.name).join(", "),
      onTap: () => context.push(
        Routes.viewAthleteScreen,
        extra: {'athleteId': athleteData.id, 'isSelf': false},
      ),
    );
  }

  /// ------------------------------------------------------------
  /// SPONSORS (WITH RANDOM NAME FALLBACK)
  /// ------------------------------------------------------------
  Widget _buildSponsorsListSliver(List<dynamic> sponsors) {
    if (sponsors.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 280,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sponsors.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          itemBuilder: (context, index) {
            final sponsor = sponsors[index];

            final sponsorProfile = sponsor.sponsorProfile;

            final sponsorName = NameHelper.getSponsorDisplayName(
              topLevelName: sponsor.name,
              profileName: sponsorProfile?.name,
              email: sponsor.email,
            );

            final category = sponsor.sport.isNotEmpty
                ? sponsor.sport.length == 1
                      ? sponsor.sport.first.name ?? 'Sport'
                      : '${sponsor.sport.length} Sports'
                : 'No Sports';

            final bannerUrl =
                (sponsorProfile?.bannerImageUrl?.isNotEmpty ?? false)
                ? '$fileBaseUrl${sponsorProfile!.bannerImageUrl}'
                : null;

            final profileUrl =
                (sponsorProfile?.profileImageUrl?.isNotEmpty ?? false)
                ? '$fileBaseUrl${sponsorProfile!.profileImageUrl}'
                : null;

            return SponsorCard(
              name: sponsorName,
              category: category,
              bannerImageUrl: bannerUrl,
              profileImageUrl: profileUrl,
              onTap: () => context.push(
                Routes.viewSponsorProfileRouteName,
                extra: {'sponsorId': sponsor.id},
              ),
            );
          },
        ),
      ),
    );
  }

  /// ------------------------------------------------------------
  /// UI HELPERS
  /// ------------------------------------------------------------
  Widget _buildSportSectionContent({
    required String sportName,
    required List<Athlete> athletes,
  }) {
    if (athletes.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              sportName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              itemCount: athletes.length,
              separatorBuilder: (_, __) => const SizedBox(width: 13.5),
              itemBuilder: (context, index) =>
                  _buildAthleteCard(athletes[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSponsorsHeaderSliver() {
    return const SliverPadding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Sponsors",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildErrorState(String msg) {
    return Center(
      child: Text(msg, style: const TextStyle(color: Colors.red)),
    );
  }
}

/// ------------------------------------------------------------
/// SEARCH HEADER
/// ------------------------------------------------------------
class _SearchHeader extends StatelessWidget {
  final List<Athlete> athletes;
  final List<Sponsor> sponsors;
  final bool isFilterOpen;
  final VoidCallback onFilterTap;
  final VoidCallback onNotificationTap;

  const _SearchHeader({
    required this.athletes,
    required this.sponsors,
    required this.isFilterOpen,
    required this.onFilterTap,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFF5F5F5),
      child: Row(
        children: [
          Expanded(
            child: _SearchBar(
              athletes: athletes,
              sponsors: sponsors,
              isFilterOpen: isFilterOpen,
              onFilterTap: onFilterTap,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: onNotificationTap,
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final List<Athlete> athletes;
  final List<Sponsor> sponsors;
  final bool isFilterOpen;
  final VoidCallback onFilterTap;

  const _SearchBar({
    required this.athletes,
    required this.sponsors,
    required this.isFilterOpen,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        Routes.athleteSearchScreen,
        extra: {
          'athletes': athletes,
          'sponsors': sponsors,
          'isDarkMode': false,
        },
      ),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            const Expanded(
              child: CustomText(
                title: 'Search athletes or brands...',
                textColor: Colors.grey,
                fontSize: 14,
              ),
            ),
            SvgPicture.asset(
              isFilterOpen
                  ? "assets/images/filter_filled.svg"
                  : "assets/images/filter.svg",
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
