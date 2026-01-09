import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/feed_provider.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/state/feed_state.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/sponsor_card.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
              isFilterOpen: isFilterOpen,
              onFilterTap: () => setState(() => isFilterOpen = !isFilterOpen),
              onNotificationTap: () =>
                  GoRouter.of(context).push(Routes.notificationScreen),
            ),
            Expanded(
              child: _buildFeedContent(feedState),
            ),
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
            // Athletes by sport sections - using SliverList for true lazy loading
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final entry = sportEntries[index];
                  return _buildSportSectionContent(
                    sportName: entry.key,
                    athletes: entry.value,
                  );
                },
                childCount: sportEntries.length,
              ),
            ),

            // Sponsors section
            _buildSponsorsHeaderSliver(),
            _buildSponsorsListSliver(feedData.sponsors),

            // Bottom padding
            const SliverPadding(padding: EdgeInsets.only(bottom: 20)),
          ],
        );
      },
      error: (errorMessage) => _buildErrorState(errorMessage),
    );
  }

  // MARK: - Sport Section
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
          // Sport title
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

          // Horizontal scrolling list of athletes
          SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              itemCount: athletes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: _buildAthleteCard(athletes[index]),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 13.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAthleteCard(Athlete athleteData) {
    final athlete = athleteData.athleteProfile;
    final sport = athleteData.sport;
   

    // Extract data with fallbacks
    final name = athlete?.name?? 'Unknown Athlete';
    final age = athlete?.age?.toString() ?? '';
    final position = athlete?.position ?? 'Position';
    final club = athlete?.club ?? 'Club';
    final level = athlete?.level;
    final rating = athlete?.rating;
    final sportCategory = sport.map((e) => e.name).join(", ");
    final achievements = athlete?.achievements ?? [];
    final sponsorshipDone = athlete?.sponsorshipDone ?? 0;
    final highestSocialMediaPresence = athlete?.highestSocialMediaPresence ?? '0';

    // Build image URL
    final imageUrl = athlete?.profileImageUrl != null
        ? '$fileBaseUrl${athlete!.profileImageUrl}'
        : 'https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--male-boy-cartoon-character-illustrations-5652137.png';

    // Build flag URL (using sport icon or default)
    final flagUrl = 'https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg';
        

    return AthleteCard(
      athleteId: athleteData.id,
      name: name.isEmpty ? 'Unknown Athlete' : name,
      club: club.isEmpty ? 'Unknown Club' : club,
      age: age.isEmpty ? 'Unavailable' : age,
      flag: flagUrl,
      image: imageUrl,
      achievements: achievements,
      position: position,
      level: level,
      rating: rating??0,
      sponsorshipDone: sponsorshipDone.toString(),
      highestSocialMediaPresence: highestSocialMediaPresence,
      sportCategory: sportCategory,
      onTap: (){

      },
    );
  }

  // MARK: - Sponsors Section
  Widget _buildSponsorsHeaderSliver() {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sponsors",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Sponsors aligned with your interests",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsorsListSliver(List<dynamic> sponsors) {
    if (sponsors.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sponsors.length,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          itemBuilder: (context, index) {
            final sponsor = sponsors[index];

            // Extract sponsor data
            final category = sponsor.sport.isNotEmpty
                ? sponsor.sport.length == 1
                    ? sponsor.sport.first.name ?? 'Sport'
                    : '${sponsor.sport.length} Sports'
                : 'No Sports';

            final imageUrl = sponsor.sport.isNotEmpty &&
                    sponsor.sport.first.icon != null
                ? '$fileBaseUrl${sponsor.sport.first.icon}'
                : 'https://picsum.photos/400/300';

            return SponsorCard(
              name: sponsor.name ?? 'Unknown Name',
              category: category,
              imageUrl: imageUrl,
            );
          },
        ),
      ),
    );
  }

  // MARK: - Error State
  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 16, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.read(feedProvider.notifier).getFeed(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

// MARK: - Search Header Widget
class _SearchHeader extends StatelessWidget {
  final bool isFilterOpen;
  final VoidCallback onFilterTap;
  final VoidCallback onNotificationTap;

  const _SearchHeader({
    required this.isFilterOpen,
    required this.onFilterTap,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 245, 245, 245),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: _SearchBar(
              isFilterOpen: isFilterOpen,
              onFilterTap: onFilterTap,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            color: AppColors.primary,
            onPressed: onNotificationTap,
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final bool isFilterOpen;
  final VoidCallback onFilterTap;

  const _SearchBar({
    required this.isFilterOpen,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/search.svg'),
            const SizedBox(width: 8),
            Expanded(
              child: IgnorePointer(
                ignoring: true,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: onFilterTap,
              child: SvgPicture.asset(
                isFilterOpen
                    ? "assets/images/filter_filled.svg"
                    : "assets/images/filter.svg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
