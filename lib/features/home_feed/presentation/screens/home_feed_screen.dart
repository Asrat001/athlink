import 'package:athlink/features/home_feed/widgets/athlete_card.dart';
import 'package:athlink/features/home_feed/widgets/filter_drop_downs.dart';
import 'package:athlink/features/home_feed/widgets/sponsor_card.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  bool isFilterOpen = false;
  final players = [
    {
      "name": "Mariya Osteen",
      "club": "NY Woman's Flag Football",
      "age": "21",
      "followers": "23K Followers",
      "jobs": "5 Jobs Done",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
      "image":
          "https://cdn3d.iconscout.com/3d/premium/thumb/fitness-woman-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--lady-girl-cartoon-character-illustrations-5652139.png",
    },
    {
      "name": "David Shuan",
      "club": "King Box Club",
      "age": "21",
      "followers": "3K Followers",
      "jobs": "1 Jobs Done",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg",
      "image":
          "https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--male-boy-cartoon-character-illustrations-5652137.png",
    },
    {
      "name": "David Shuan",
      "club": "King Box Club",
      "age": "21",
      "followers": "3K Followers",
      "jobs": "1 Jobs Done",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg",
      "image":
          "https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--male-boy-cartoon-character-illustrations-5652137.png",
    },
    {
      "name": "David Shuan",
      "club": "King Box Club",
      "age": "21",
      "followers": "3K Followers",
      "jobs": "1 Jobs Done",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg",
      "image":
          "https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--male-boy-cartoon-character-illustrations-5652137.png",
    },
  ];

  final sponsors = [
    {
      "name": "Pharaoh Manufacturing",
      "category": "Textile Factory",
      "image": "https://picsum.photos/400/300",
    },
    {
      "name": "Pharaoh Manufacturing",
      "category": "Fruit Juice Factory",
      "image": "https://picsum.photos/400/300",
    },
    {
      "name": "Pharaoh Manufacturing",
      "category": "Fruit Juice Factory",
      "image": "https://picsum.photos/400/300",
    },
    {
      "name": "Pharaoh Manufacturing",
      "category": "Fruit Juice Factory",
      "image": "https://picsum.photos/400/300",
    },
  ];
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
                      const Text(
                        "Base Ball",
                        style: TextStyle(
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
                          itemCount: players.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final player = players[index];
                            return AthleteCard(
                              name: player['name']!,
                              club: player['club']!,
                              age: player['age']!,
                              flag: player['flag']!,
                              image: player['image']!,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 24),

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
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sponsors.length,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          itemBuilder: (context, index) {
                            final sponsor = sponsors[index];
                            return SponsorCard(
                              name: sponsor["name"]!,
                              category: sponsor["category"]!,
                              imageUrl: sponsor["image"]!,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 10),
                      const Text(
                        "Racket",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(
                        height: 370,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(5),
                          shrinkWrap: true,
                          itemCount: players.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                          itemBuilder: (context, index) {
                            final player = players[index];
                            return AthleteCard(
                              name: player['name']!,
                              club: player['club']!,
                              age: player['age']!,
                              flag: player['flag']!,
                              image: player['image']!,
                            );
                          },
                        ),
                      ),

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
}
