
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/athlete_profile_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/athlete_profile_state.dart';
import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/presentation/providers/conversation_filter.dart';
import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/providers/states/conversation_state.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/date_formatter.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListWidget extends ConsumerWidget {
  final ConversationFilter filter;
  final String searchQuery;

  const ChatListWidget({
    super.key,
    required this.filter,
    required this.searchQuery,
  });



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationState = ref.watch(conversationProvider);
    final filteredConversations = ref.watch(
      filteredConversationsProvider((filter: filter, searchQuery: searchQuery)),
    );
    final onlineStatus = ref.watch(onlineStatusProvider);

    ref.listen<ConversationState>(conversationProvider, (previous, next) {
      next.maybeWhen(
        loaded: (conversations, _) {
          final userIds = conversations.map((c) => c.participant.id).toList();
          if (userIds.isNotEmpty) {
            ref.read(onlineStatusProvider.notifier).checkOnlineStatus(userIds);
          }
        },
        orElse: () {},
      );
    });
     final user=sl<LocalStorageService>().getUserData();
    final isAthlet=user?.role?.contains("athlet")??false;
    final sponserProfileState = ref.watch(profileProvider);
    final athletProfileSate=ref.watch(athleteProfileProvider);
    final currentUserImg =isAthlet?athletProfileSate.whenOrNull(loaded: (profile) => profile.profilePhoto,):
        sponserProfileState.profileUser?.sponsorProfile?.profileImageUrl;

    return conversationState.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (conversations, messages) {
        // --- If no conversations, show static data with random times ---
        // if (conversations.isEmpty) {
        //   return _buildStaticUsers(currentUserImg);
     
        

        return RefreshIndicator(
          onRefresh: () async {
            ref.read(conversationProvider.notifier).getConversations();
            ref.read(profileProvider.notifier).getProfile();
          },
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: filteredConversations.length,
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemBuilder: (context, index) {
              final conversation = filteredConversations[index];
              final bool isOnline =
                  onlineStatus[conversation.participant.id] ?? false;

              return _buildChatTile(
                context: context,
                isAthlet: isAthlet,
                name: conversation.participant.name,
                image:fileBaseUrl+conversation.participant.profileImage,
                currentUserImg: currentUserImg,
                isOnline: isOnline,
                time: DateFormatter.formatTime(
                  conversation.lastMessage?.createdAt ?? DateTime.now(),
                ),
                message: getLastConversationMessage(conversation.lastMessage),
                unreadCount: conversation.unreadCount,
                onTap: () {
                  context.push(
                    Routes.chatDetailRouteName,
                    extra: {
                      "name": conversation.participant.name,
                      "logo": conversation.participant.profileImage,
                      "isOnline": isOnline,
                      "conversationId": conversation.id,
                      "userId": conversation.participant.id,
                    },
                  );
                },
              );
            },
          ),
        );
      },
      orElse: () => const SizedBox(),
    );
  }



  /// Refactored Tile to keep UI identical between Real and Static data
  Widget _buildChatTile({
    required BuildContext context,
    required String name,
    required String image,
    required String? currentUserImg,
    required bool isOnline,
    required bool isAthlet,
    required String time,
    required String message,
    required int unreadCount,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          children: [
            _buildAvatarStack(image, currentUserImg),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: name,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor:isAthlet?Colors.white:AppColors.black,
                        ),
                      ),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isOnline ? AppColors.success : AppColors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      CustomText(
                        title: time,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          title: message,
                          maxLines: 1,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          textColor: AppColors.textSecondary,
                        ),
                      ),
                      if (unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.all(6),
                          decoration:  BoxDecoration(
                            color:isAthlet?Colors.white: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: CustomText(
                            title: unreadCount.toString(),
                            textColor:isAthlet?Colors.black: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarStack(
    String participantImageUrl,
    String? loggedInUserUrl,
  ) {
    return SizedBox(
      width: 50,
      height: 46,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.purple.shade50,
            backgroundImage:
                (loggedInUserUrl != null && loggedInUserUrl.isNotEmpty)
                ? NetworkImage("$fileBaseUrl$loggedInUserUrl")
                : null,
            child: (loggedInUserUrl == null || loggedInUserUrl.isEmpty)
                ? const Icon(Icons.person, size: 20, color: AppColors.primary)
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1.5),
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue.shade50,
                backgroundImage: participantImageUrl.isNotEmpty
                    ? NetworkImage(participantImageUrl)
                    : null,
                child: participantImageUrl.isEmpty
                    ? const Icon(
                        Icons.person,
                        size: 15,
                        color: AppColors.primary,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getLastConversationMessage(LastMessage? lastMessage) {
    if (lastMessage == null) return "No messages yet";
    switch (lastMessage.type) {
      case "text":
        return lastMessage.content;
      case "image":
        return "Image";
      case "video":
        return "Video";
      default:
        return "";
    }
  }
}
