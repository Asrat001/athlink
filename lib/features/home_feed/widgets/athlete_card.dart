import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/circular_icon_button.dart';
import 'package:athlink/shared/extensions/build_context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/watchlist/presentation/providers/watchlist_provider.dart';
import 'package:athlink/features/home_feed/domain/models/feed_models.dart';

class AthleteCard extends ConsumerStatefulWidget {
  final String? athleteId;
  final String name;
  final String club;
  final String age;
  final String flag;
  final String image;
  final double rating;
  final List<Achievement> achievements;
  final String? position;
  final String? level;
  final String? sportCategory;

  const AthleteCard({
    super.key,
    this.athleteId,
    required this.name,
    required this.club,
    required this.age,
    required this.flag,
    required this.image,
    this.rating = 4.9,
    this.achievements = const [],
    this.position,
    this.level,
    this.sportCategory,
  });

  @override
  ConsumerState<AthleteCard> createState() => _AthleteCardState();
}

class _AthleteCardState extends ConsumerState<AthleteCard> {
  bool _isInWatchlist = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _checkWatchlistStatus();
  }

  void _checkWatchlistStatus() {
    final watchlistState = ref.read(watchlistProvider);
    final watchlist = watchlistState.watchlistData?.watchlist ?? [];

    if (widget.athleteId != null) {
      setState(() {
        _isInWatchlist = watchlist.any(
          (item) => item.athlete?.id == widget.athleteId,
        );
      });
    }
  }

  Future<void> _handleBookmarkPress() async {
    if (widget.athleteId == null || _isProcessing) return;

    setState(() => _isProcessing = true);

    try {
      if (_isInWatchlist) {
        // Remove from watchlist
        final success = await ref
            .read(watchlistProvider.notifier)
            .deleteAthleteFromWatchlist(athleteId: widget.athleteId!);

        if (success && mounted) {
          setState(() {
            _isInWatchlist = false;
            _isProcessing = false;
          });

          context.showWarning('Removed from watchlist');
        }
      } else {
        // Add to watchlist
        final success = await ref
            .read(watchlistProvider.notifier)
            .addToWatchlist(athleteId: widget.athleteId!);

        if (success && mounted) {
          setState(() {
            _isInWatchlist = true;
            _isProcessing = false;
          });

          context.showSuccess('Added to watchlist');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isProcessing = false);
        context.showError('Error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => _showAthleteOverlay(context),
        child: Column(
          children: [
            Container(
              height: 280,
              width: 300,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      CustomText(
                        title: widget.name,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        textColor: AppColors.white, // Using AppColors.white
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        title: widget.club,
                        fontSize: 14,
                        textColor: AppColors.white, // Using AppColors.white
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        title: 'Age : ${widget.age}',
                        fontSize: 13,
                        textColor: AppColors.white, // Using AppColors.white
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      "assets/images/athlete.png",
                      height: 200,
                      fit: BoxFit.contain,
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
                                  widget.rating.toString(),
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
                        GestureDetector(
                          onTap: _handleBookmarkPress,
                          child: _iconButton(
                            _isInWatchlist
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            isActive: _isInWatchlist,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _iconButton(Icons.share),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: "Athlete Ambassador ready",
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    textColor:
                        AppColors.textPrimary, // Using AppColors.textPrimary
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    title: "23k Followers",
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.grey, // Using AppColors.grey
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    title: "5 jobs done",
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.grey, // Using AppColors.grey
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, {bool isActive = false}) {
    return CircularIconButton(
      size: 40,
      backgroundColor: AppColors.white.withValues(alpha: 0.4),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 22,
      ),
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
          athleteId: widget.athleteId,
          name: widget.name,
          club: widget.club,
          age: widget.age,
          flag: widget.flag,
          image: widget.image,
          achievements: widget.achievements,
          position: widget.position,
          level: widget.level,
          sportCategory: widget.sportCategory,
        ),
        transitionsBuilder: (_, anim, __, child) {
          return FadeTransition(opacity: anim, child: child);
        },
      ),
    );
  }
}

class AthleteDetailOverlay extends ConsumerStatefulWidget {
  final String? athleteId;
  final String name;
  final String club;
  final String age;
  final String flag;
  final String image;
  final List<Achievement> achievements;
  final String? position;
  final String? level;
  final String? sportCategory;

  const AthleteDetailOverlay({
    super.key,
    this.athleteId,
    required this.name,
    required this.club,
    required this.age,
    required this.flag,
    required this.image,
    this.achievements = const [],
    this.position,
    this.level,
    this.sportCategory,
  });

  @override
  ConsumerState<AthleteDetailOverlay> createState() =>
      _AthleteDetailOverlayState();
}

class _AthleteDetailOverlayState extends ConsumerState<AthleteDetailOverlay> {
  bool _isInWatchlist = false;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _checkWatchlistStatus();
  }

  void _checkWatchlistStatus() {
    final watchlistState = ref.read(watchlistProvider);
    final watchlist = watchlistState.watchlistData?.watchlist ?? [];

    if (widget.athleteId != null) {
      setState(() {
        _isInWatchlist = watchlist.any(
          (item) => item.athlete?.id == widget.athleteId,
        );
      });
    }
  }

  Future<void> _handleBookmarkPress() async {
    if (widget.athleteId == null || _isProcessing) return;

    setState(() => _isProcessing = true);

    try {
      if (_isInWatchlist) {
        // Remove from watchlist
        final success = await ref
            .read(watchlistProvider.notifier)
            .deleteAthleteFromWatchlist(athleteId: widget.athleteId!);

        if (success && mounted) {
          setState(() {
            _isInWatchlist = false;
            _isProcessing = false;
          });

          context.showWarning('Removed from watchlist');
        }
      } else {
        // Add to watchlist
        final success = await ref
            .read(watchlistProvider.notifier)
            .addToWatchlist(athleteId: widget.athleteId!);

        if (success && mounted) {
          setState(() {
            _isInWatchlist = true;
            _isProcessing = false;
          });

          context.showSuccess('Added to watchlist');
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isProcessing = false);
        context.showError('Error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    GestureDetector(
                      onTap: _handleBookmarkPress,
                      child: _roundIcon(
                        _isInWatchlist ? Icons.bookmark : Icons.bookmark_border,
                      ),
                    ),
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
                          title: widget.name,
                          textColor: AppColors.white, // Using AppColors.white
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: widget.club,
                          textColor: AppColors.white, // Using AppColors.white
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),

                        const SizedBox(height: 20),

                        // Basic Info
                        _infoText("Age : ${widget.age}"),
                        if (widget.position != null)
                          _infoText("Position : ${widget.position}"),
                        if (widget.sportCategory != null)
                          _infoText("Category : ${widget.sportCategory}"),
                        if (widget.level != null)
                          _infoText("Level : ${widget.level}"),

                        const SizedBox(height: 40),

                        if (widget.achievements.isNotEmpty)
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
                                    color: AppColors
                                        .white, // Using AppColors.white
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...widget.achievements.asMap().entries.map((
                                  entry,
                                ) {
                                  final achievement = entry.value;
                                  final index = entry.key;

                                  // Determine rank color based on rank value
                                  final rankColor =
                                      achievement.rank == "1st" ||
                                          achievement.rank == "1"
                                      ? const Color(0xFFFFD700) // Gold
                                      : achievement.rank == "2nd" ||
                                            achievement.rank == "2"
                                      ? AppColors
                                            .lightGrey // Silver
                                      : const Color(0xFFCD7F32); // Bronze

                                  // Determine difficulty badge color
                                  final difficultyColor =
                                      achievement.difficulty == "hard"
                                      ? Colors.red
                                      : achievement.difficulty == "medium"
                                      ? Colors.orange
                                      : Colors.green;

                                  return Container(
                                    margin: EdgeInsets.only(
                                      bottom:
                                          index ==
                                              widget.achievements.length - 1
                                          ? 0
                                          : 5,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 6),
                                                    Icon(
                                                      Icons.emoji_events,
                                                      color: AppColors.primary,
                                                      size: 18,
                                                    ),
                                                    SizedBox(width: 6),
                                                    Expanded(
                                                      child: CustomText(
                                                        title:
                                                            achievement.name ??
                                                            'Achievement',
                                                        textColor:
                                                            AppColors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 13.5,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            if (achievement.rank != null)
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    achievement.rank!,
                                                    style: TextStyle(
                                                      color: rankColor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),

                                            if (achievement.score != null)
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: CustomText(
                                                    title:
                                                        '${achievement.score}',
                                                    textColor: AppColors.black
                                                        .withValues(alpha: 0.7),
                                                    fontSize: 12,
                                                    textAlign: TextAlign.center,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        if (achievement.difficulty != null)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 30,
                                              top: 4,
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: difficultyColor
                                                    .withValues(alpha: 0.2),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                achievement.difficulty!,
                                                style: TextStyle(
                                                  color: difficultyColor,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
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
    return CircularIconButton(
      size: 40,
      backgroundColor: AppColors.white.withValues(alpha: 0.3),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 20,
      ),
    );
  }
}
