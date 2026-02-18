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
import 'package:flutter_slidable/flutter_slidable.dart';

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
  final ActionPane? endActionPane;

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
    this.endActionPane,
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
            if (widget.athleteId != null) {
              ref.invalidate(connectionStatusProvider(widget.athleteId!));
            }
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
                  child: widget.endActionPane != null
                      ? Slidable(
                          key: ValueKey(widget.athleteId ?? widget.name),
                          endActionPane: widget.endActionPane,
                          child: _buildMainCard(
                            scale,
                            mainCardHeight,
                            cardWidth,
                          ),
                        )
                      : _buildMainCard(scale, mainCardHeight, cardWidth),
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

  Widget _buildMainCard(double scale, double height, double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20 * scale),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20 * scale),
        child: Stack(
          children: [
            _buildAthleteImage(height),
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
    return CircularIconButton(
      size: iconSize,
      backgroundColor: Colors.orange.withValues(alpha: 0.7),
      onPressed: connectionId != null
          ? () => _showConfirmationDialog(
              title: 'Cancel Request',
              content:
                  'Are you sure you want to cancel this connection request?',
              confirmText: 'Cancel Request',
              connectionId: connectionId,
              onConfirm: () {
                ref
                    .read(connectionProvider.notifier)
                    .cancelRequest(connectionId);
              },
            )
          : null,
      child: Icon(Icons.schedule, color: Colors.white, size: 20 * scale),
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
          ? () {
              setState(() => _isConnecting = true); // Set connecting state
              ref.read(connectionProvider.notifier).acceptRequest(connectionId);
            }
          : null,
      child: Icon(Icons.person_add, color: Colors.white, size: 20 * scale),
    );
  }

  Widget _buildConnectedButton(
    double iconSize,
    double scale,
    String? connectionId,
  ) {
    return CircularIconButton(
      size: iconSize,
      backgroundColor: Colors.green.withValues(alpha: 0.7),
      onPressed: connectionId != null
          ? () => _showConfirmationDialog(
              title: 'Remove Connection',
              content:
                  'Are you sure you want to remove this connection? This action cannot be undone.',
              confirmText: 'Remove',
              connectionId: connectionId,
              onConfirm: () {
                ref
                    .read(connectionProvider.notifier)
                    .removeConnection(connectionId);
              },
            )
          : null,
      child: Icon(
        Icons.check_circle_rounded,
        color: Colors.white,
        size: 20 * scale,
      ),
    );
  }

  void _showConfirmationDialog({
    required String title,
    required String content,
    required String confirmText,
    required String connectionId,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.darkGreyCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning_rounded,
                  color: AppColors.error,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              CustomText(
                title: title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              CustomText(
                title: content,
                fontSize: 14,
                textColor: Colors.white60,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const CustomText(
                        title: 'Back',
                        textColor: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (mounted) {
                          setState(() => _isConnecting = true);
                        }
                        onConfirm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: CustomText(
                        title: confirmText,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
          // if (widget.highestSocialMediaPresence.isNotEmpty)
          //   CustomText(
          //     title: widget.highestSocialMediaPresence,
          //     fontSize: 12,
          //     textColor: widget.isAthlete
          //         ? Colors.white60
          //         : AppColors.textSecondary,
          //   ),
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
