import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WatchlistAthleteCard extends StatelessWidget {
  final String name;
  final String club;
  final String age;
  final String flag;
  final String image;
  final double rating;

  const WatchlistAthleteCard({
    super.key,
    required this.name,
    required this.club,
    required this.age,
    required this.flag,
    required this.image,
    this.rating = 4.9,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAthleteOverlay(context),
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey, // Replaced with AppColors.grey
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(
                      alpha: 0.05,
                    ), // Using AppColors.black
                    offset: const Offset(0, 3),
                    blurRadius: 8,
                  ),
                ],
              ),
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/athlete.png",
                      height: 280,
                      width: MediaQuery.of(context).size.width - 200,
                      fit: BoxFit.fill,
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/flag.png",
                        height: 37,
                        width: 37,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    top: 50,
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            _iconButton(Icons.star_border),
                            Positioned(
                              right: 0,
                              top: -5,
                              child: Container(
                                height: 22,
                                width: 22,
                                decoration: const BoxDecoration(
                                  color:
                                      AppColors.error, // Using AppColors.error
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  rating.toString(),
                                  style: const TextStyle(
                                    color: AppColors
                                        .white, // Using AppColors.white
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _iconButton(Icons.bookmark_border),
                        const SizedBox(height: 12),
                        _iconButton(Icons.favorite_border),
                        const SizedBox(height: 12),
                        _iconButton(Icons.share),
                      ],
                    ),
                  ),

                  Positioned(
                    right: 50,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        CustomText(
                          title: name,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.white, // Using AppColors.white
                        ),
                        const SizedBox(height: 5),
                        CustomText(
                          title: club,
                          fontSize: 14,
                          textColor: AppColors.white, // Using AppColors.white
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.3,
                        ),
                        const SizedBox(height: 5),
                        CustomText(
                          title: 'Age : $age',
                          fontSize: 13,
                          textColor: AppColors.white, // Using AppColors.white
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 5),
            // SizedBox(
            //   width: 300,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       CustomText(
            //         title: "Athlete Ambassador ready",
            //         fontSize: 11,
            //         fontWeight: FontWeight.w500,
            //         textColor:
            //             AppColors.textPrimary, // Using AppColors.textPrimary
            //       ),
            //       const SizedBox(height: 4),
            //       CustomText(
            //         title: "23k Followers",
            //         fontSize: 11,
            //         fontWeight: FontWeight.w500,
            //         textColor: AppColors.grey, // Using AppColors.grey
            //       ),
            //       const SizedBox(height: 4),
            //       CustomText(
            //         title: "5 jobs done",
            //         fontSize: 11,
            //         fontWeight: FontWeight.w500,
            //         textColor: AppColors.grey, // Using AppColors.grey
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.4), // Using AppColors.white
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 22,
      ), // Using AppColors.white
    );
  }

  void _showAthleteOverlay(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        barrierDismissible: true,
        opaque: false,
        barrierColor: AppColors.transparent,
        pageBuilder: (_, __, ___) => AthleteDetailOverlay(
          name: name,
          club: club,
          age: age,
          flag: flag,
          image: image,
        ),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      ),
    );
  }
}

class AthleteDetailOverlay extends StatelessWidget {
  final String name;
  final String club;
  final String age;
  final String flag;
  final String image;

  const AthleteDetailOverlay({
    super.key,
    required this.name,
    required this.club,
    required this.age,
    required this.flag,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final achievements = [
      {"title": "African Cup U20", "year": "2024", "medal": "Gold"},
      {"title": "National Sprint Final", "year": "2023", "medal": "Silver"},
      {"title": "Regional Cup", "year": "2022", "medal": "Bronze"},
      {"title": "African Cup", "year": "2022", "medal": "Bronze"},
    ];

    final screenHeight = MediaQuery.of(context).size.height;
    final overlayHeight = screenHeight * 0.7;

    return Scaffold(
      backgroundColor: AppColors.black.withValues(
        alpha: 0.2,
      ), // Using AppColors.black
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: overlayHeight,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: AppColors.black, // Using AppColors.black
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  "assets/images/athlete.png",
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.grey600.withValues(
                          alpha: 0.9,
                        ), // Using AppColors.grey600
                        AppColors.grey600.withValues(
                          alpha: 0.8,
                        ), // Using AppColors.grey600
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Fixed Header Section
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.grey600, // Using AppColors.grey600
                              child: SvgPicture.asset(
                                "assets/images/close.svg",
                                height: 20,
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white, // Using AppColors.white
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ClipOval(
                            child: Image.asset(
                              "assets/images/flag.png",
                              height: 35,
                              width: 35,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(
                            alpha: 0.2,
                          ), // Using AppColors.success
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomText(
                          title: "Available for \nsponsorship",
                          textColor: AppColors.white.withValues(
                            alpha: 0.6,
                          ), // Using AppColors.white
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Fixed Action Buttons
              Positioned(
                right: 16,
                top: 150,
                child: Column(
                  children: [
                    _roundIcon(Icons.star_border),
                    const SizedBox(height: 15),
                    _roundIcon(Icons.bookmark_border),
                    const SizedBox(height: 15),
                    _roundIcon(Icons.favorite_border),
                    const SizedBox(height: 15),
                    _roundIcon(Icons.share),
                  ],
                ),
              ),

              Positioned(
                top: 100,
                left: 0,
                right: 0,
                bottom: 0,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),

                        CustomText(
                          title: name,
                          textColor: AppColors.white, // Using AppColors.white
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: club,
                          textColor: AppColors.white, // Using AppColors.white
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),

                        const SizedBox(height: 20),

                        // Basic Info
                        _infoText("Age : $age"),
                        _infoText("Position : Wide Receiver"),
                        _infoText("Category : Flag Football"),
                        _infoText("Level : Semi-pro"),
                        _infoText("Training : 20 hours/week"),

                        const SizedBox(height: 40),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Achievements and Wins",
                                style: TextStyle(
                                  color:
                                      AppColors.white, // Using AppColors.white
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ...achievements.asMap().entries.map((a) {
                                final medalColor = a.value["medal"] == "Gold"
                                    ? const Color(0xFFFFD700)
                                    : a.value["medal"] == "Silver"
                                    ? AppColors.lightGrey
                                    : const Color(0xFFCD7F32);

                                return Container(
                                  margin: EdgeInsets.only(
                                    bottom: a.key == achievements.length - 1
                                        ? 0
                                        : 5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white.withValues(
                                      alpha: 0.9,
                                    ), // Using AppColors.extraLightGrey
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 6),
                                                  Icon(
                                                    Icons.emoji_events,
                                                    color: AppColors
                                                        .primary, // Using AppColors.primary for icon
                                                    size: 18,
                                                  ),
                                                  SizedBox(width: 6),
                                                  CustomText(
                                                    title: a.value["title"]!,
                                                    textColor: AppColors
                                                        .black, // Using AppColors.black
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13.5,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: CustomText(
                                                title: a.value["year"]!,
                                                textColor: AppColors.black
                                                    .withValues(
                                                      alpha: 0.7,
                                                    ), // Using AppColors.white
                                                fontSize: 12,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                a.value["medal"]!,
                                                style: TextStyle(
                                                  color: medalColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: CustomText(
        title: text,
        textColor: AppColors.white.withValues(
          alpha: 0.6,
        ), // Using AppColors.white
        fontSize: 13,
      ),
    );
  }

  Widget _roundIcon(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 20,
      ), // Using AppColors.white
    );
  }
}
