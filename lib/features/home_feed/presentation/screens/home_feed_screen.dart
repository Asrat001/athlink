import 'package:athlink/features/home_feed/presentation/providers/feed_provider.dart';
import 'package:athlink/features/home_feed/widgets/athlete_card.dart';
import 'package:athlink/features/home_feed/widgets/filter_drop_downs.dart';
import 'package:athlink/features/home_feed/widgets/sponsor_card.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

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
    // Fetch feed data on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(feedProvider.notifier).getFeed();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 245, 245, 245),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isFilterOpen = !isFilterOpen;
                            });
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
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFilterOpen = !isFilterOpen;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    isFilterOpen
                                        ? "assets/images/filter_filled.svg"
                                        : "assets/images/filter.svg",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (final label in [
                          'tennis',
                          '18-20',
                          '18-20',
                          'Africa',
                          'level2',
                          'level3',
                          'level4',
                          'level5',
                        ])
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Chip(
                              label: CustomText(
                                title: label,
                                fontWeight: FontWeight.w500,
                              ),
                              backgroundColor: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColors.grey.withValues(alpha: .3),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            if (isFilterOpen)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterBar(
                  filters: [
                    FilterData("Age", ["< 18", "18 – 21", "> 18"]),
                    FilterData("Location", ["Middle East", "Canada", "Africa"]),
                    FilterData("Achievement", [
                      "Regional Shampion",
                      "Word top 8",
                      "National cup winner",
                    ]),
                  ],
                ),
              ),

            if (!isFilterOpen)
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Athletes grouped by sport
                      _buildAthletesBySport(),

                      // 🏢 Sponsors Section
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

                      const SizedBox(height: 12),
                      _buildSponsorsSection(),

                      const SizedBox(height: 20), // Extra padding at bottom
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSponsorsSection() {
    final feedState = ref.watch(feedProvider);

    if (feedState.isLoading) {
      return SizedBox(
        height: 300,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }

    if (feedState.errorMessage != null) {
      return SizedBox(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red),
              SizedBox(height: 16),
              Text(
                feedState.errorMessage!,
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(feedProvider.notifier).getFeed();
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final sponsors = feedState.feedData?.sponsors ?? [];

    if (sponsors.isEmpty) {
      return SizedBox(
        height: 300,
        child: Center(
          child: Text(
            'No sponsors available',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sponsors.length,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        itemBuilder: (context, index) {
          final sponsor = sponsors[index];
          // Get sports as category (use first sport or "Multiple Sports")
          final category = sponsor.sport.isNotEmpty
              ? sponsor.sport.length == 1
                    ? sponsor.sport.first.name ?? 'Sport'
                    : '${sponsor.sport.length} Sports'
              : 'No Sports';

          // Use first sport icon as image, or placeholder
          final imageUrl =
              sponsor.sport.isNotEmpty && sponsor.sport.first.icon != null
              ? '$fileBaseUrl${sponsor.sport.first.icon}'
              : 'https://picsum.photos/400/300';

          return SponsorCard(
            name: sponsor.name ?? sponsor.email ?? 'Unknown',
            category: category,
            imageUrl: imageUrl,
          );
        },
      ),
    );
  }

  Widget _buildAthletesBySport() {
    final feedState = ref.watch(feedProvider);

    // Don't show anything while loading for athletes (only show loading for first load)
    if (feedState.isLoading && feedState.feedData == null) {
      return const SizedBox.shrink();
    }

    final athletes = feedState.feedData?.athletes ?? [];

    // Hide section entirely if no athletes
    if (athletes.isEmpty) {
      return const SizedBox.shrink();
    }

    // Group athletes by sport
    final Map<String, List<dynamic>> athletesBySport = {};
    for (var athlete in athletes) {
      for (var sport in athlete.sport) {
        final sportName = sport.name ?? 'Unknown Sport';
        if (!athletesBySport.containsKey(sportName)) {
          athletesBySport[sportName] = [];
        }
        athletesBySport[sportName]!.add({'athlete': athlete, 'sport': sport});
      }
    }

    // Build sections for each sport
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: athletesBySport.entries.map((entry) {
        final sportName = entry.key;
        final athletesInSport = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sportName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 370,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(5),
                shrinkWrap: true,
                itemCount: athletesInSport.length,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  final item = athletesInSport[index];
                  final athlete = item['athlete'];
                  final sport = item['sport'];

                  // Use athlete profile data or fallback to athlete data
                  final profile = athlete.athleteProfile;
                  final name =
                      profile?.name ?? athlete.name ?? 'Unknown Athlete';
                  final age = profile?.age?.toString() ?? '0';
                  final position = profile?.position ?? 'Position';
                  final level = profile?.level;
                  final sportCategory = sport.name;

                  // Get image URL
                  final imageUrl = profile?.profileImageUrl != null
                      ? '$fileBaseUrl${profile!.profileImageUrl}'
                      : 'https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--male-boy-cartoon-character-illustrations-5652137.png';

                  // Get flag - use sport icon or default flag
                  final flagUrl = sport.icon != null
                      ? '$fileBaseUrl${sport.icon}'
                      : 'https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg';

                  // Get achievements from athlete profile
                  final achievements = profile?.achievements ?? [];

                  return AthleteCard(
                    athleteId: athlete.id,
                    name: name,
                    club: position,
                    age: age,
                    flag: flagUrl,
                    image: imageUrl,
                    achievements: achievements,
                    position: position,
                    level: level,
                    sportCategory: sportCategory,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }
}
