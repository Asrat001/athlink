import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_provider.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_providers.dart';
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
  final bool isAthlete; // Changed to final for best practice

  const AthleteCard({
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

  @override
  Widget build(BuildContext context) {
    // Listen for connection status changes to handle UI feedback
    ref.listen(connectionProvider, (previous, next) {
      next.maybeWhen(
        success: (message) {
          if (_isConnecting) {
            setState(() => _isConnecting = false);
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
                          _buildDarkOverlay(),

                          // Info Overlay
                          Padding(
                            padding: EdgeInsets.all(16 * scale),
                            child: _buildTopInfo(scale),
                          ),

                          // Dynamic Action Buttons
                          Positioned(
                            right: 12 * scale,
                            top: 0,
                            bottom: 0,
                            child: _buildActionButtons(scale),
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
        if (widget.location != null && widget.location!.isNotEmpty)
          CustomText(
            title: widget.location!,
            fontSize: 11,
            textColor: Colors.white.withValues(alpha: 0.8),
          ),
      ],
    );
  }

  Widget _buildActionButtons(double scale) {
    final iconSize = 32 * scale;
    final isInWatchlist = ref
        .watch(watchlistIdsProvider)
        .contains(widget.athleteId ?? '');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ONLY SHOW CONNECTION LOGIC IF IT IS AN ATHLETE
        if (widget.isAthlete) ...[
          _buildConnectionLogic(iconSize, scale),
          const SizedBox(height: 16),
        ],

        // Bookmark is shown for Sponsors/Others or based on your business logic
        // If you only want bookmark for non-athletes, wrap this in if (!widget.isAthlete)
        if (!widget.isAthlete)
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

  Widget _buildConnectionLogic(double iconSize, double scale) {
    final connectionStatusAsync = widget.athleteId != null
        ? ref.watch(connectionStatusProvider(widget.athleteId!))
        : null;

    return connectionStatusAsync?.when(
          data: (status) {
            if (status == null || status.status == 'none') {
              return _buildConnectButton(iconSize, scale);
            }

            switch (status.status) {
              case 'pending':
                return status.isRequester
                    ? _buildPendingButton(iconSize, scale, status.connectionId)
                    : _buildAcceptButton(iconSize, scale, status.connectionId);
              case 'accepted':
                return _buildConnectedButton(
                  iconSize,
                  scale,
                  status.connectionId,
                );
              default:
                return _buildConnectButton(iconSize, scale);
            }
          },
          loading: () => _buildLoadingIcon(iconSize, scale),
          error: (_, __) => _buildConnectButton(iconSize, scale),
        ) ??
        _buildConnectButton(iconSize, scale);
  }

  Widget _buildLoadingIcon(double iconSize, double scale) {
    return CircularIconButton(
      size: iconSize,
      backgroundColor: Colors.black.withValues(alpha: 0.6),
      onPressed: null,
      child: SizedBox(
        height: 16 * scale,
        width: 16 * scale,
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildConnectButton(double iconSize, double scale) {
    return CircularIconButton(
      size: iconSize,
      backgroundColor: _isConnecting
          ? AppColors.primary.withValues(alpha: 0.7)
          : Colors.black.withValues(alpha: 0.6),
      onPressed: (widget.athleteId == null || _isConnecting)
          ? null
          : () {
              setState(() => _isConnecting = true);
              ref
                  .read(connectionProvider.notifier)
                  .sendConnectionRequest(widget.athleteId!);
              Future.delayed(const Duration(seconds: 2), () {
                if (mounted) setState(() => _isConnecting = false);
              });
            },
      child: _isConnecting
          ? _buildLoadingIcon(iconSize, scale)
          : Icon(
              Icons.person_add_alt_1_rounded,
              color: Colors.white,
              size: 20 * scale,
            ),
    );
  }

  Widget _buildPendingButton(
    double iconSize,
    double scale,
    String? connectionId,
  ) {
    return GestureDetector(
      onLongPress: connectionId != null
          ? () => ref
                .read(connectionProvider.notifier)
                .cancelRequest(connectionId)
          : null,
      child: CircularIconButton(
        size: iconSize,
        backgroundColor: Colors.orange.withValues(alpha: 0.7),
        onPressed: null,
        child: Icon(Icons.schedule, color: Colors.white, size: 20 * scale),
      ),
    );
  }

  Widget _buildAcceptButton(
    double iconSize,
    double scale,
    String? connectionId,
  ) {
    return CircularIconButton(
      size: iconSize,
      backgroundColor: AppColors.primary.withValues(alpha: 0.7),
      onPressed: connectionId != null
          ? () => ref
                .read(connectionProvider.notifier)
                .acceptRequest(connectionId)
          : null,
      child: Icon(Icons.person_add, color: Colors.white, size: 20 * scale),
    );
  }

  Widget _buildConnectedButton(
    double iconSize,
    double scale,
    String? connectionId,
  ) {
    return GestureDetector(
      onLongPress: connectionId != null
          ? () => _showRemoveConnectionDialog(connectionId)
          : null,
      child: CircularIconButton(
        size: iconSize,
        backgroundColor: Colors.green.withValues(alpha: 0.7),
        onPressed: null,
        child: Icon(
          Icons.check_circle_rounded,
          color: Colors.white,
          size: 20 * scale,
        ),
      ),
    );
  }

  void _showRemoveConnectionDialog(String connectionId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkGreyCard,
        title: const CustomText(
          title: 'Remove Connection',
          textColor: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        content: const CustomText(
          title: 'Are you sure you want to remove this connection?',
          textColor: Colors.white70,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const CustomText(title: 'Cancel', textColor: Colors.white60),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(connectionProvider.notifier)
                  .removeConnection(connectionId);
            },
            child: const CustomText(
              title: 'Remove',
              textColor: AppColors.error,
            ),
          ),
        ],
      ),
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
            textColor: widget.isAthlete ? Colors.white : AppColors.textPrimary,
          ),
          if (widget.highestSocialMediaPresence.isNotEmpty)
            CustomText(
              title: widget.highestSocialMediaPresence,
              fontSize: 12,
              textColor: widget.isAthlete
                  ? Colors.white60
                  : AppColors.textSecondary,
            ),
          CustomText(
            title:
                "${widget.sponsorshipDone.isEmpty ? "0" : widget.sponsorshipDone} jobs done",
            fontSize: 12,
            textColor: widget.isAthlete
                ? Colors.white60
                : AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
