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
  final bool isDarkMode;

  const AthleteSearchScreen({
    super.key,
    required this.initialAthletes,
    required this.initialSponsors,
    this.isDarkMode = true,
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
    _performSearch('');
  }

  void _performSearch(String query) {
    final q = query.toLowerCase();

    final filteredSponsors = widget.initialSponsors.where((s) {
      return (s.name?.toLowerCase().contains(q) ?? false);
    }).toList();

    final filteredAthletes = widget.initialAthletes.where((a) {
      final name = a.athleteProfile?.name?.toLowerCase() ?? '';
      final club = a.athleteProfile?.club?.toLowerCase() ?? '';
      return name.contains(q) || club.contains(q);
    }).toList();

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
      backgroundColor: widget.isDarkMode ? AppColors.black : AppColors.white,
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

  Widget _buildSearchHeader() {
    return Container(
      color: widget.isDarkMode ? AppColors.black : AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          BackButton(
            color: widget.isDarkMode ? Colors.white : AppColors.black,
          ), // Light back button
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: widget.isDarkMode
                    ? AppColors.darkGreyCard
                    : AppColors.extraLightGrey, // Darker input field
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: widget.isDarkMode ? Colors.white54 : Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _performSearch,
                      autofocus: true,
                      style: TextStyle(
                        fontSize: 14,
                        color: widget.isDarkMode
                            ? Colors.white
                            : AppColors.black,
                      ),
                      cursorColor: AppColors.primary,
                      decoration: InputDecoration(
                        hintText: "Search athletes or brands...",
                        hintStyle: TextStyle(
                          color: widget.isDarkMode
                              ? Colors.white38
                              : Colors.grey.shade400,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  if (_searchController.text.isNotEmpty)
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 18,
                        color: widget.isDarkMode ? Colors.white54 : Colors.grey,
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
          if (_filteredSponsors.isNotEmpty) ...[
            _buildSectionHeader("Brands & Sponsors", "Top matching partners"),
            _buildSponsorRow(),
            const SizedBox(height: 24),
          ],
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

  Widget _buildSectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: title,
            fontSize: 18, // Slightly larger for better hierarchy
            fontWeight: FontWeight.bold,
            textColor: widget.isDarkMode ? Colors.white : AppColors.black,
          ),
          CustomText(
            title: subtitle,
            fontSize: 12,
            textColor: widget.isDarkMode
                ? Colors.white38
                : Colors.grey, // Dimmed secondary text
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
            isDarkMode: widget.isDarkMode,
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
      height: 350, // Matched Dashboard height adjustment
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
            isAthlete: widget.isDarkMode,
            age: profile?.age?.toString() ?? '20',
            flag: 'assets/images/flag.png',
            image: imageUrl,
            highestSocialMediaPresence:
                profile?.highestSocialMediaPresence ?? "0",
            sponsorshipDone: (profile?.sponsorshipDone ?? 0).toString(),
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
            color: widget.isDarkMode ? Colors.white24 : Colors.grey.shade300,
          ),
          const SizedBox(height: 16),
          CustomText(
            title: "No results found",
            textColor: widget.isDarkMode ? Colors.white54 : Colors.grey,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
