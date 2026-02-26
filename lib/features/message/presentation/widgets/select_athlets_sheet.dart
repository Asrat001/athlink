import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_providers.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_list_state.dart';
import 'package:athlink/features/message/presentation/widgets/search_bar.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/message/domain/models/contact.dart';
import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/sponsor/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/state/watchlist_state.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/watchlist_provider.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:go_router/go_router.dart';

class SelectAthletsSheet extends ConsumerStatefulWidget {
  const SelectAthletsSheet({
    super.key,
    required this.scrollController,
    this.isAthlet = false,
  });

  final ScrollController scrollController;
  final bool isAthlet;

  @override
  ConsumerState<SelectAthletsSheet> createState() => _SelectAthletsSheetState();
}

class _SelectAthletsSheetState extends ConsumerState<SelectAthletsSheet> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load connections or watchlist on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isAthlet) {
        ref.read(connectionsListProvider.notifier).getConnections();
      } else {
        ref.read(watchlistProvider.notifier).getWatchlist();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(
      widget.isAthlet
          ? connectionSearchQueryProvider
          : watchlistSearchQueryProvider,
    );
    final connectionsState = ref.watch(connectionsListProvider);
    final watchlistState = ref.watch(watchlistProvider);
    final onlineStatus = ref.watch(onlineStatusProvider);

    // Listen for connections loaded and check online status
    if (widget.isAthlet) {
      ref.listen<ConnectionListState<ConnectedUser>>(connectionsListProvider, (
        previous,
        next,
      ) {
        next.maybeWhen(
          loaded: (connections) {
            final userIds = connections.map((c) => c.user.id).toList();
            if (userIds.isNotEmpty) {
              ref
                  .read(onlineStatusProvider.notifier)
                  .checkOnlineStatus(userIds);
            }
          },
          orElse: () {},
        );
      });
    } else {
      // For watchlist, check online status of athletes
      ref.listen<WatchlistState>(watchlistProvider, (previous, next) {
        next.maybeWhen(
          success: (watchlistData) {
            final userIds = watchlistData.watchlist
                .map((item) => item.athlete?.id)
                .whereType<String>()
                .toList();
            if (userIds.isNotEmpty) {
              ref
                  .read(onlineStatusProvider.notifier)
                  .checkOnlineStatus(userIds);
            }
          },
          orElse: () {},
        );
      });
    }

    return Container(
      decoration: BoxDecoration(
        color: widget.isAthlet ? Colors.black : AppColors.lightBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey600.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          CustomText(
            title: "Select Friend",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            textColor: widget.isAthlet ? Colors.white : AppColors.black,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ChatSearchBar(
              hint: widget.isAthlet ? "Search friends" : "Search athletes",
              isAthlet: widget.isAthlet,
              controller: _searchController,

              onChanged: (query) {
                if (widget.isAthlet) {
                  ref.read(connectionSearchQueryProvider.notifier).state =
                      query;
                } else {
                  ref.read(watchlistSearchQueryProvider.notifier).state = query;
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: widget.isAthlet
                ? connectionsState.when(
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: widget.isAthlet
                            ? Colors.white
                            : AppColors.primary,
                      ),
                    ),
                    loaded: (_) {
                      // Watch filtered connections using the search query
                      final filteredConnections = ref.watch(
                        filteredConnectionsProvider(searchQuery),
                      );

                      if (filteredConnections.isEmpty) {
                        return _buildEmptyState();
                      }

                      return _buildConnectionsList(
                        filteredConnections,
                        onlineStatus,
                      );
                    },
                    empty: () => _buildEmptyState(),
                    error: (message) => _buildErrorState(message),
                  )
                : watchlistState.when(
                    initial: () => Center(
                      child: CircularProgressIndicator(
                        color: widget.isAthlet
                            ? Colors.white
                            : AppColors.primary,
                      ),
                    ),
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: widget.isAthlet
                            ? Colors.white
                            : AppColors.primary,
                      ),
                    ),
                    success: (watchlistData) {
                      final filteredWatchlist = ref.watch(
                        filteredWatchlistProvider(searchQuery),
                      );

                      if (filteredWatchlist.isEmpty) {
                        return _buildEmptyState();
                      }

                      return _buildWatchlist(filteredWatchlist, onlineStatus);
                    },
                    error: (message) => _buildErrorState(message),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectionsList(
    List<ConnectedUser> filteredConnections,
    Map<String, bool> onlineStatus,
  ) {
    return GridView.builder(
      controller: widget.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: filteredConnections.length,
      itemBuilder: (context, index) {
        final connection = filteredConnections[index];
        final user = connection.user;
        final isUserOnline = onlineStatus[user.id] ?? connection.user.isOnline;

        return _buildAthleteItem(
          id: user.id,
          name: user.athleteProfile.name ?? "",
          profileImageUrl: user.athleteProfile.profileImageUrl,
          isOnline: isUserOnline,
        );
      },
    );
  }

  Widget _buildWatchlist(
    List<WatchlistItem> filteredWatchlist,
    Map<String, bool> onlineStatus,
  ) {
    return GridView.builder(
      controller: widget.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: filteredWatchlist.length,
      itemBuilder: (context, index) {
        final item = filteredWatchlist[index];
        final athlete = item.athlete;
        if (athlete == null) return const SizedBox.shrink();

        final isUserOnline = onlineStatus[athlete.id] ?? false;

        return _buildAthleteItem(
          id: athlete.id ?? "",
          name: athlete.athleteProfile?.name ?? athlete.name ?? "",
          profileImageUrl: athlete.athleteProfile?.profileImageUrl,
          isOnline: isUserOnline,
        );
      },
    );
  }

  Widget _buildAthleteItem({
    required String id,
    required String name,
    String? profileImageUrl,
    required bool isOnline,
  }) {
    return InkWell(
      onTap: () async {
        try {
          final conversation = await ref
              .read(conversationProvider.notifier)
              .createOrGetConversation(
                participantId: id,
                participantType: ContactType.athlete,
              );

          if (conversation != null && context.mounted) {
            Navigator.pop(context);
            context.push(
              Routes.chatDetailRouteName,
              extra: {
                "conversationId": conversation.id,
                "name": name,
                "logo": profileImageUrl != null
                    ? fileBaseUrl + profileImageUrl
                    : null,
                "isOnline": isOnline,
                "userId": id,
              },
            );
          } else if (context.mounted) {
            AppHelpers.showErrorToast(context, "Failed to start conversation");
          }
        } catch (e) {
          if (context.mounted) {
            AppHelpers.showErrorToast(context, "An error occurred");
          }
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.extraLightGrey,
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(fileBaseUrl + profileImageUrl)
                    : null,
                child: profileImageUrl == null
                    ? const Icon(Icons.person, color: AppColors.grey600)
                    : null,
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: widget.isAthlet
                            ? Colors.black
                            : AppColors.lightBackground,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          CustomText(
            title: name,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            maxLines: 1,
            textColor: widget.isAthlet ? Colors.white : AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.people_outline, size: 64, color: AppColors.grey600),
          const SizedBox(height: 16),
          CustomText(
            title: widget.isAthlet
                ? "No friends yet"
                : "No athletes in watchlist",
            fontSize: 16,
            textColor: AppColors.grey600,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to athlete dashboard to find friends
            },
            child: CustomText(
              title: widget.isAthlet
                  ? "Find athletes to connect"
                  : "Go to watchlist",
              fontSize: 14,
              textColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppColors.error),
          const SizedBox(height: 16),
          CustomText(
            title: message,
            fontSize: 16,
            textColor: AppColors.grey600,
          ),
        ],
      ),
    );
  }
}
