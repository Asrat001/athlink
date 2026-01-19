import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_provider.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_state.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/watchlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/circular_icon_button.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AthleteCard extends ConsumerStatefulWidget {
  final String? athleteId;
  final String name;
  final String club;
  final String age;
  final String flag;
  final String image;
  final String sponsorshipDone;
  final List<Achievement> achievements;
  final String? position;
  final String? level;
  final String? location;
  final String? sportCategory;
  final VoidCallback? onTap;
  final String highestSocialMediaPresence;
  final double size;
  bool isAthlete;

  AthleteCard({
    super.key,
    this.athleteId,
    required this.name,
    required this.club,
    required this.age,
    required this.flag,
    this.isAthlete = false,
    this.location,
    required this.image,
    this.sponsorshipDone = "",
    this.achievements = const [],
    this.position,
    this.level,
    this.sportCategory,
    this.onTap,
    required this.highestSocialMediaPresence,
    this.size = 240.0,
  });

  @override
  ConsumerState<AthleteCard> createState() => _AthleteCardState();
}

class _AthleteCardState extends ConsumerState<AthleteCard> {
  bool _isConnecting = false;
  bool _isSent = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(connectionProvider, (previous, next) {
      next.maybeWhen(
        success: (message) {
          if (_isConnecting) {
            setState(() {
              _isConnecting = false;
              _isSent = true;
            });
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.green),
            );
          }
        },
        error: (error) {
          if (_isConnecting) {
            setState(() => _isConnecting = false);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error), backgroundColor: AppColors.error),
            );
          }
        },
        orElse: () {},
      );
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final cardWidth = constraints.maxWidth.clamp(widget.size, widget.size);
        final mainCardHeight = availableHeight * 0.72;
        final footerHeight = availableHeight * 0.25;
        final scale = cardWidth / 280;

        return SizedBox(
          width: cardWidth,
          child: GestureDetector(
            onTap: widget.onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mainCardHeight,
                  width: cardWidth,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20 * scale),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20 * scale),
                      child: Stack(
                        children: [
                          _buildAthleteImage(mainCardHeight),

                          // Consistent Black Overlay
                          _buildDarkOverlay(),

                          // Content
                          Padding(
                            padding: EdgeInsets.all(16 * scale),
                            child: _buildTopInfo(scale),
                          ),

                          // Positioned(
                          //   top: 16 * scale,
                          //   right: 16 * scale,
                          //   child: _buildFlag(28 * scale),
                          // ),
                          Positioned(
                            right: 12 * scale,
                            top: 0,
                            bottom: 0,
                            child: _buildActionButtons(scale, widget.isAthlete),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: footerHeight,
                  width: cardWidth,
                  child: _buildCardFooter(scale),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDarkOverlay() {
    return Positioned.fill(
      child: Container(color: Colors.black.withValues(alpha: 0.5)),
    );
  }

  Widget _buildAthleteImage(double height) {
    return Image.network(
      widget.image,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        "assets/images/athlete.png",
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTopInfo(double scale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: widget.name,
          fontSize: 15,
          fontWeight: FontWeight.w700,
          textColor: Colors.white,
        ),
        CustomText(
          title: widget.club,
          fontSize: 12,
          textColor: Colors.white.withValues(alpha: 0.8),
        ),
        CustomText(
          title: widget.location ?? "",
          fontSize: 11,
          textColor: Colors.white.withValues(alpha: 0.8),
        ),
      ],
    );
  }

  // Widget _buildFlag(double flagSize) {
  //   return ClipOval(
  //     child: Image.asset(
  //       "assets/images/flag.png",
  //       height: flagSize,
  //       width: flagSize,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  Widget _buildActionButtons(double scale, bool isAthlete) {
    final iconSize = 32 * scale;
    final isInWatchlist = ref
        .watch(watchlistIdsProvider)
        .contains(widget.athleteId ?? '');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularIconButton(
          size: iconSize,
          // Consistent black background for buttons
          backgroundColor: _isSent
              ? Colors.green.withValues(alpha: 0.7)
              : Colors.black.withValues(alpha: 0.6),
          onPressed: (widget.athleteId == null || _isConnecting || _isSent)
              ? null
              : () {
                  setState(() => _isConnecting = true);
                  ref
                      .read(connectionProvider.notifier)
                      .sendConnectionRequest(widget.athleteId!);
                },
          child: _isConnecting
              ? SizedBox(
                  height: 16 * scale,
                  width: 16 * scale,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Icon(
                  _isSent
                      ? Icons.check_circle_rounded
                      : Icons.person_add_alt_1_rounded,
                  color: Colors.white,
                  size: 20 * scale,
                ),
        ),
        const SizedBox(height: 16),
        if (!isAthlete)
          CircularIconButton(
            size: iconSize,
            backgroundColor: isInWatchlist
                ? AppColors.primary
                : Colors.black.withValues(alpha: 0.6),
            onPressed: () {
              if (widget.athleteId != null) {
                ref
                    .read(watchlistProvider.notifier)
                    .toggleWatchlist(athleteId: widget.athleteId!);
              }
            },
            child: Icon(
              isInWatchlist ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
              size: 20 * scale,
            ),
          ),
      ],
    );
  }

  Widget _buildCardFooter(double scale) {
    return Padding(
      padding: EdgeInsets.only(top: 8 * scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: widget.name,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            textColor: AppColors.textPrimary,
          ),
          if (widget.highestSocialMediaPresence.isNotEmpty)
            CustomText(
              title: widget.highestSocialMediaPresence,
              fontSize: 12,
              textColor: AppColors.grey,
            ),
          CustomText(
            title:
                "${widget.sponsorshipDone.isEmpty ? "0" : widget.sponsorshipDone} jobs done",
            fontSize: 12,
            textColor: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
