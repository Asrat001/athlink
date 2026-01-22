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
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:go_router/go_router.dart';

class SelectAthletsSheet extends ConsumerStatefulWidget {
  const SelectAthletsSheet({
    super.key,
    required this.scrollController,
    this.isAthlet=false,
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
    // Load connections on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(connectionsListProvider.notifier).getConnections();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(connectionSearchQueryProvider);
    final connectionsState = ref.watch(connectionsListProvider);
    final onlineStatus = ref.watch(onlineStatusProvider);

    // Listen for connections loaded and check online status
    ref.listen<ConnectionListState<ConnectedUser>>(connectionsListProvider, (previous, next) {
      next.maybeWhen(
        loaded: (connections) {
          final userIds = connections.map((c) => c.user.id).toList();
          if (userIds.isNotEmpty) {
            ref.read(onlineStatusProvider.notifier).checkOnlineStatus(userIds);
          }
        },
        orElse: () {},
      );
    });

    return Container(
      decoration:  BoxDecoration(
        color:widget.isAthlet?Colors.black: AppColors.lightBackground,
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
            textColor:widget.isAthlet?Colors.white: AppColors.black,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ChatSearchBar(
              hint: "Search friends",
              isAthlet: widget.isAthlet,
              controller: _searchController,

              onChanged: (query) {
                ref.read(connectionSearchQueryProvider.notifier).state = query;
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: connectionsState.when(
              loading: () =>  Center(
                child: CircularProgressIndicator(color:widget.isAthlet?Colors.white: AppColors.primary),
              ),
              loaded: (_) {
                // Watch filtered connections using the search query
                final filteredConnections = ref.watch(
                  filteredConnectionsProvider(searchQuery),
                );

                if (filteredConnections.isEmpty) {
                  return _buildEmptyState();
                }

                return GridView.builder(
                  controller: widget.scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredConnections.length,
                  itemBuilder: (context, index) {
                    final connection = filteredConnections[index];
                    final user = connection.user;
                    final isUserOnline = onlineStatus[user.id] ?? connection.user.isOnline;

                    return InkWell(
                      onTap: () async {
                        // Show loading
                        AppHelpers.showLoadingToast(context, "Opening chat...");

                        try {
                          final conversation = await ref
                              .read(conversationProvider.notifier)
                              .createOrGetConversation(
                                participantId: user.id,
                                participantType: ContactType.athlete,
                              );

                          if (conversation != null && context.mounted) {
                            context.push(
                              Routes.chatDetailRouteName,
                              extra: {
                                "conversationId": conversation.id,
                                "name": user.athleteProfile.name,
                                "logo":
                                    user.athleteProfile.profileImageUrl != null
                                    ? fileBaseUrl +
                                          user.athleteProfile.profileImageUrl!
                                    : null,
                                "isOnline": isUserOnline,
                                "userId": connection.user.id,
                              },
                            );
                          } else if (context.mounted) {
                            AppHelpers.showErrorToast(
                              context,
                              "Failed to start conversation",
                            );
                          }
                        } catch (e) {
                          if (context.mounted) {
                            AppHelpers.showErrorToast(
                              context,
                              "An error occurred",
                            );
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
                                backgroundImage:
                                    user.athleteProfile.profileImageUrl != null
                                    ? NetworkImage(
                                        fileBaseUrl +
                                            user
                                                .athleteProfile
                                                .profileImageUrl!,
                                      )
                                    : null,
                                child: const Icon(
                                  Icons.person,
                                  color: AppColors.grey600,
                                ),
                              ),
                              if (isUserOnline)
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
                                        color: AppColors.lightBackground,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          CustomText(
                            title: user.athleteProfile.name ?? "",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            textColor:widget.isAthlet?Colors.white: AppColors.black,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              empty: () => _buildEmptyState(),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: 16),
                    CustomText(
                      title: message,
                      fontSize: 16,
                      textColor: AppColors.grey600,
                    ),
                  ],
                ),
              ),
            ),
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
          const CustomText(
            title: "No friends yet",
            fontSize: 16,
            textColor: AppColors.grey600,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Navigate to athlete dashboard to find friends
            },
            child: const CustomText(
              title: "Find athletes to connect",
              fontSize: 14,
              textColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
