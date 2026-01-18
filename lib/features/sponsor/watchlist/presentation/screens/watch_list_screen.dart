import 'package:athlink/features/sponsor/home_feed/presentation/widgets/athlete_card.dart';
import 'package:athlink/features/sponsor/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/watchlist_provider.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/state/watchlist_state.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Clean watchlist screen with ValueNotifier for performant UI updates
class WatchListScreen extends ConsumerStatefulWidget {
  const WatchListScreen({super.key});

  @override
  ConsumerState<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends ConsumerState<WatchListScreen>
    with SingleTickerProviderStateMixin {
  // ✅ Simple UI state - keep setState (infrequent updates)
  bool isFilterOpen = false;

  // ✅ ValueNotifier for action state - better performance for list
  final activeActionNotifier = ValueNotifier<({int? index, String? type})>((
    index: null,
    type: null,
  ));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(watchlistProvider.notifier).getWatchlist();
    });
  }

  @override
  void dispose() {
    activeActionNotifier.dispose();
    super.dispose();
  }

  void _handleAction(int index, String type) {
    // No setState - just update the notifier
    activeActionNotifier.value = (index: index, type: type);
  }

  void _cancelAction() {
    // No setState - just update the notifier
    activeActionNotifier.value = (index: null, type: null);
  }

  Future<void> _confirmAction(int index, List<WatchlistItem> watchlist) async {
    final currentAction = activeActionNotifier.value;
    final isDelete = currentAction.type == "delete";

    if (isDelete) {
      // Animate fade out before removal
      activeActionNotifier.value = (index: index, type: "deleting");
      await Future.delayed(const Duration(milliseconds: 300));

      // Reset state
      activeActionNotifier.value = (index: null, type: null);

      // Refresh the list after deletion
      ref.read(watchlistProvider.notifier).getWatchlist();
    } else {
      // Mute: just revert after delay
      activeActionNotifier.value = (index: index, type: "muting");
      await Future.delayed(const Duration(milliseconds: 300));
      activeActionNotifier.value = (index: null, type: null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final watchlistState = ref.watch(watchlistProvider);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(watchlistState),
            Expanded(child: _buildContent(watchlistState)),
          ],
        ),
      ),
    );
  }

  // MARK: - Content Builder (using clean union state)
  Widget _buildContent(WatchlistState watchlistState) {
    return watchlistState.when(
      initial: () => const Center(child: Text('Setting up watchlist...')),
      loading: () => const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      ),
      success: (watchlistData) {
        final watchlist = watchlistData.watchlist;

        if (watchlist.isEmpty) {
          return _buildEmptyState();
        }
        // return SizedBox.shrink();

        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(watchlistProvider.notifier).getWatchlist();
          },
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: watchlist.length,
            itemBuilder: (context, index) {
              final item = watchlist[index];
              final athlete = item.athlete;

              if (athlete == null) return const SizedBox();

              // // ✅ Use isolated widget for each item
              return SizedBox(
                key: ValueKey(item.id),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: _WatchlistItemWidget(
                  key: ValueKey('item_$index'),
                  index: index,
                  item: item,
                  athlete: athlete,
                  watchlist: watchlist,
                  activeActionNotifier: activeActionNotifier,
                  onAction: _handleAction,
                  onCancel: _cancelAction,
                  onConfirm: _confirmAction,
                ),
              );
            },
          ),
        );
      },
      error: (errorMessage) => _buildErrorState(errorMessage),
    );
  }

  // MARK: - Header
  Widget _buildHeader(WatchlistState watchlistState) {
    final count = watchlistState.when(
      initial: () => 0,
      loading: () => 0,
      success: (watchlistData) => watchlistData.count,
      error: (_) => 0,
    );

    return Container(
      color: AppColors.lightBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/search.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: AppColors.grey),
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
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CustomText(
                title: "Watchlist Athletes ($count)",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: AppColors.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MARK: - Empty State
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, color: AppColors.grey, size: 64),
          const SizedBox(height: 16),
          CustomText(
            title: 'No athletes in your watchlist',
            textColor: AppColors.textGrey,
            fontSize: 16,
          ),
        ],
      ),
    );
  }

  // MARK: - Error State
  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: AppColors.error, size: 48),
          const SizedBox(height: 16),
          CustomText(
            title: errorMessage,
            textColor: AppColors.error,
            fontSize: 14,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(watchlistProvider.notifier).getWatchlist();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

// MARK: - Individual Watchlist Item (Isolated State)
class _WatchlistItemWidget extends StatefulWidget {
  final int index;
  final WatchlistItem item;
  final dynamic athlete;
  final List<WatchlistItem> watchlist;
  final ValueNotifier<({int? index, String? type})> activeActionNotifier;
  final Function(int, String) onAction;
  final VoidCallback onCancel;
  final Function(int, List<WatchlistItem>) onConfirm;

  const _WatchlistItemWidget({
    super.key,
    required this.index,
    required this.item,
    required this.athlete,
    required this.watchlist,
    required this.activeActionNotifier,
    required this.onAction,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  State<_WatchlistItemWidget> createState() => _WatchlistItemWidgetState();
}

class _WatchlistItemWidgetState extends State<_WatchlistItemWidget> {
  bool _isActive = false;
  String? _actionType;

  @override
  void initState() {
    super.initState();
    widget.activeActionNotifier.addListener(_onActiveActionChanged);
  }

  @override
  void dispose() {
    widget.activeActionNotifier.removeListener(_onActiveActionChanged);
    super.dispose();
  }

  void _onActiveActionChanged() {
    final activeAction = widget.activeActionNotifier.value;
    final newIsActive = activeAction.index == widget.index;

    // ✅ Only rebuild if this item's state actually changed
    if (newIsActive != _isActive || activeAction.type != _actionType) {
      setState(() {
        _isActive = newIsActive;
        _actionType = activeAction.type;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOutCubic),
        );

        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: const Interval(0.15, 1.0, curve: Curves.easeOutCubic),
              ),
            );

        final scaleAnimation = Tween<double>(begin: 0.98, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: ScaleTransition(scale: scaleAnimation, child: child),
          ),
        );
      },
      child: _isActive
          ? _buildConfirmationCard()
          : _buildAthleteCardWithActions(),
    );
  }

  Widget _buildAthleteCardWithActions() {
    return Padding(
      key: ValueKey("card_${widget.index}"),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Slidable(
        key: ValueKey(widget.index),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.5,
          children: [
            SlidableAction(
              onPressed: (_) => widget.onAction(widget.index, "mute"),
              icon: Icons.notifications_off_outlined,
            ),
            SlidableAction(
              onPressed: (_) => widget.onAction(widget.index, "delete"),
              backgroundColor: AppColors.lightError,
              foregroundColor: AppColors.error,
              icon: Icons.delete_outline,
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.center,
          child: AthleteCard(
            key: ValueKey(widget.athlete.id),
            size: MediaQuery.of(context).size.width * 0.89,
            athleteId: widget.athlete.id,
            name:
                widget.athlete.athleteProfile?.name ??
                widget.athlete.name ??
                'Unknown',
            club: widget.athlete.sport.isNotEmpty
                ? widget.athlete.sport.first.name ?? 'Unknown Sport'
                : 'Unknown Sport',
            age: widget.athlete.athleteProfile?.age.toString() ?? 'N/A',
            flag: widget.athlete.sport.isNotEmpty
                ? '$fileBaseUrl${widget.athlete.sport.first.icon}'
                : '',
            image: widget.athlete.athleteProfile?.profileImageUrl != null
                ? '$fileBaseUrl${widget.athlete.athleteProfile?.profileImageUrl}'
                : '',
            // rating: widget.athlete.athleteProfile?.rating ?? 0.0,
            achievements: widget.athlete.athleteProfile?.achievements ?? [],
            position: widget.athlete.athleteProfile?.position,
            level: widget.athlete.athleteProfile?.level,
            sportCategory: widget.athlete.sport.isNotEmpty
                ? widget.athlete.sport.first.name
                : null,
            highestSocialMediaPresence: '0 followers',
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmationCard() {
    final isDelete = _actionType == "delete" || _actionType == "deleting";
    final athleteName =
        widget.item.athlete?.athleteProfile?.name ??
        widget.item.athlete?.name ??
        'Unknown';

    final bgColor = isDelete ? AppColors.lightError : AppColors.lightMute;
    final textColor = isDelete ? AppColors.red : AppColors.muteAction;
    final icon = isDelete
        ? Icons.delete_outline
        : Icons.notifications_off_outlined;

    return AnimatedContainer(
      key: ValueKey("confirm_${widget.index}"),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 38, color: textColor),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: isDelete ? "Remove " : "Mute notifications from ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: athleteName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: isDelete ? " from watchlist?" : "?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          CustomText(
            title: isDelete
                ? "You won't receive any updates about this athlete."
                : "You can unmute anytime from their profile.",
            fontSize: 13,
            fontWeight: FontWeight.w400,
            textColor: AppColors.textGrey,
          ),
          const SizedBox(height: 20),
          if (_actionType != "deleting" && _actionType != "muting")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      widget.onConfirm(widget.index, widget.watchlist),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textColor,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(isDelete ? "Remove" : "Mute"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: widget.onCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonGrey,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text("Cancel"),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
