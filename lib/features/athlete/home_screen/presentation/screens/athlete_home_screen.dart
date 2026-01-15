import 'package:athlink/core/services/local_storage_service.dart'; // Adjust based on your actual path
import 'package:athlink/di.dart';
import 'package:athlink/features/auth/presentation/providers/login/login_provider.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/widgets/sponsor_card.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

// --- Shared Assets and Static Data ---
const String _nikeLogo =
    "https://www.pngarts.com/files/8/Adidas-Logo-PNG-High-Quality-Image.png";
const String _adidasLogo =
    "https://www.pngarts.com/files/8/Adidas-Logo-PNG-High-Quality-Image.png";
const String _redbullLogo =
    "https://www.pngarts.com/files/8/Adidas-Logo-PNG-High-Quality-Image.png";

const String _athlete1 =
    "https://www.pngarts.com/files/3/Marcus-Rashford-PNG-Image-Background.png";
const String _athlete2 =
    "https://www.pngarts.com/files/3/Harry-Kane-PNG-Image-Background.png";

final List<Athlete> _allStaticAthletes = [
  const Athlete(
    id: 'a1',
    athleteProfile: AthleteProfile(
      name: 'Jane Doe',
      club: 'Man Utd',
      achievements: [],
    ),
  ),
  const Athlete(
    id: 'a2',
    athleteProfile: AthleteProfile(
      name: 'Almaz Ayana',
      club: 'Bayern',
      achievements: [],
    ),
  ),
];

class AthleteDashboardScreen extends ConsumerStatefulWidget {
  const AthleteDashboardScreen({super.key});

  @override
  ConsumerState<AthleteDashboardScreen> createState() =>
      _AthleteDashboardScreenState();
}

class _AthleteDashboardScreenState
    extends ConsumerState<AthleteDashboardScreen> {
  bool isFilterOpen = false;
  String? userName;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    // Fetching user data via Service Locator
    final user = sl<LocalStorageService>().getUserData();
    setState(() {
      userName = user?.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildDashboardHeader(),
            _buildSearchHeader(),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  _buildSectionHeader("Recommended", "Top brand picks"),
                  _buildSponsorSliver(_staticSponsorsRow1),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  _buildSectionHeader("Rising Peers", "Connect now"),
                  _buildAthleteSliver(_allStaticAthletes),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  _buildSectionHeader("Partners", "Industry leaders"),
                  _buildSponsorSliver(_staticSponsorsRow2),
                  const SliverPadding(padding: EdgeInsets.only(bottom: 30)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AthleteSearchPage()),
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
                  // RENDERING DYNAMIC NAME HERE
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
            return SponsorCard(
              name: sponsor.name ?? 'Brand',
              category: "Sponsor",
              imageUrl: sponsor.id == 's1'
                  ? _nikeLogo
                  : (sponsor.id == 's3' ? _adidasLogo : _redbullLogo),
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
            final athlete = athletes[index];
            final profile = athlete.athleteProfile!;
            return AthleteCard(
              athleteId: athlete.id,
              name: profile.name ?? 'Unknown',
              club: profile.club,
              age: profile.age?.toString() ?? '20',
              flag: 'assets/images/flag.png',
              image: athlete.id == 'a1' ? _athlete1 : _athlete2,
              highestSocialMediaPresence: "10M+",
              sponsorshipDone: "5",
              rating: 4.5,
              achievements: profile.achievements,
            );
          },
        ),
      ),
    );
  }

  final List<Sponsor> _staticSponsorsRow1 = [
    const Sponsor(id: 's1', name: 'Nike', sport: []),
    const Sponsor(id: 's2', name: 'Red Bull', sport: []),
    const Sponsor(id: 's3', name: 'Adidas', sport: []),
  ];

  final List<Sponsor> _staticSponsorsRow2 = [
    const Sponsor(id: 's2', name: 'Red Bull', sport: []),
    const Sponsor(id: 's1', name: 'Nike', sport: []),
    const Sponsor(id: 's3', name: 'Adidas', sport: []),
  ];
}

class AthleteSearchPage extends StatefulWidget {
  const AthleteSearchPage({super.key});

  @override
  State<AthleteSearchPage> createState() => _AthleteSearchPageState();
}

class _AthleteSearchPageState extends State<AthleteSearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<Athlete> _results = _allStaticAthletes;

  void _filter(String q) {
    setState(() {
      _results = _allStaticAthletes
          .where(
            (a) =>
                a.athleteProfile!.name!.toLowerCase().contains(
                  q.toLowerCase(),
                ) ||
                a.athleteProfile!.club.toLowerCase().contains(q.toLowerCase()),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyScaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _controller,
          onChanged: _filter,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search athletes...",
            border: InputBorder.none,
          ),
        ),
      ),
      body: _results.isEmpty
          ? const Center(
              child: CustomText(
                title: "No athletes found",
                textColor: Colors.grey,
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 340,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final athlete = _results[index];
                return AthleteCard(
                  athleteId: athlete.id,
                  name: athlete.athleteProfile!.name!,
                  club: athlete.athleteProfile!.club,
                  age: '20',
                  flag: 'assets/images/flag.png',
                  image: athlete.id == 'a1' ? _athlete1 : _athlete2,
                  highestSocialMediaPresence: "10M+",
                  sponsorshipDone: "5",
                  rating: 4.5,
                  achievements: const [],
                );
              },
            ),
    );
  }
}
