import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/sponsor_card.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AthleteSearchScreen extends StatefulWidget {
  final List<Athlete> initialAthletes;
  final List<Sponsor> initialSponsors;

  const AthleteSearchScreen({
    super.key,
    required this.initialAthletes,
    required this.initialSponsors,
  });

  @override
  State<AthleteSearchScreen> createState() => _AthleteSearchScreenState();
}

class _AthleteSearchScreenState extends State<AthleteSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Sponsor> _filteredSponsors = [];
  Map<String, List<Athlete>> _groupedAthletes = {};

  @override
  void initState() {
    super.initState();
    // Initialize with all data
    _performSearch('');
  }

  void _performSearch(String query) {
    final q = query.toLowerCase();

    // Filter Sponsors
    final filteredSponsors = widget.initialSponsors.where((s) {
      return (s.name?.toLowerCase().contains(q) ?? false);
    }).toList();

    // Filter Athletes
    final filteredAthletes = widget.initialAthletes.where((a) {
      final name = a.athleteProfile?.name?.toLowerCase() ?? '';
      final club = a.athleteProfile?.club?.toLowerCase() ?? '';
      return name.contains(q) || club.contains(q);
    }).toList();

    // Group filtered athletes by sport (Dashboard Structure)
    final Map<String, List<Athlete>> grouped = {};
    for (var athlete in filteredAthletes) {
      for (var sport in athlete.sport) {
        final sportName = sport.name ?? "Other Sports";
        if (!grouped.containsKey(sportName)) {
          grouped[sportName] = [];
        }
        grouped[sportName]!.add(athlete);
      }
    }

    setState(() {
      _filteredSponsors = filteredSponsors;
      _groupedAthletes = grouped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchHeader(),
            Expanded(
              child: (_filteredSponsors.isEmpty && _groupedAthletes.isEmpty)
                  ? _buildNoResults()
                  : _buildScrollableContent(),
            ),
          ],
        ),
      ),
    );
  }

  /// ------------------------------------------------------------
  /// HEADER (MATCHES DASHBOARD STYLE)
  /// ------------------------------------------------------------
  Widget _buildSearchHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const BackButton(color: Colors.black),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.greyScaffoldBackground,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _performSearch,
                      autofocus: true,
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: "Search athletes or brands...",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _searchController.clear();
                        _performSearch('');
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableContent() {
    final sportEntries = _groupedAthletes.entries.toList();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Horizontal Sponsors Row
          if (_filteredSponsors.isNotEmpty) ...[
            _buildSectionHeader("Brands & Sponsors", "Top matching partners"),
            _buildSponsorRow(),
            const SizedBox(height: 24),
          ],

          // Grouped Horizontal Athlete Rows
          for (var entry in sportEntries) ...[
            _buildSectionHeader(entry.key, "Athletes in this category"),
            _buildAthleteRow(entry.value),
            const SizedBox(height: 24),
          ],

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  /// ------------------------------------------------------------
  /// SECTION BUILDERS
  /// ------------------------------------------------------------
  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
    );
  }

  Widget _buildSponsorRow() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _filteredSponsors.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final sponsor = _filteredSponsors[index];
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
    );
  }

  Widget _buildAthleteRow(List<Athlete> athletes) {
    return SizedBox(
      height: 340,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: athletes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final athlete = athletes[index];
          final profile = athlete.athleteProfile;
          final imageUrl = profile?.profileImageUrl != null
              ? '$fileBaseUrl${profile!.profileImageUrl}'
              : 'https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-5652137.png';

          return AthleteCard(
            athleteId: athlete.id,
            name: profile?.name ?? 'Athlete',
            club: profile?.club ?? 'Independent',
            age: profile?.age?.toString() ?? '20',
            flag: 'assets/images/flag.png', // Or use dynamic flag if available
            image: imageUrl,
            highestSocialMediaPresence:
                profile?.highestSocialMediaPresence ?? "0",
            sponsorshipDone: (profile?.sponsorshipDone ?? 0).toString(),
            rating: profile?.rating ?? 0.0,
            achievements: profile?.achievements ?? [],
          );
        },
      ),
    );
  }

  Widget _buildNoResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 60,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          const CustomText(
            title: "No results found",
            textColor: Colors.grey,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
