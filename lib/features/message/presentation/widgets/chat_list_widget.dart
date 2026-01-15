// import 'package:athlink/features/message/domain/models/conversation.dart';
// import 'package:athlink/features/message/presentation/providers/providers.dart';
// import 'package:athlink/features/message/presentation/providers/states/conversation_state.dart';
// import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
// import 'package:athlink/routes/route_names.dart';
// import 'package:athlink/shared/constant/constants.dart';
// import 'package:athlink/shared/theme/app_colors.dart';
// import 'package:athlink/shared/utils/date_formatter.dart';
// import 'package:athlink/shared/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// class ChatListWidget extends ConsumerWidget {
//   const ChatListWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final conversationState = ref.watch(conversationProvider);
//     final onlineStatus = ref.watch(onlineStatusProvider);

//     // Listen for conversation changes to fetch online status
//     ref.listen<ConversationState>(conversationProvider, (previous, next) {
//       next.maybeWhen(
//         loaded: (conversations, _) {
//           final userIds = conversations.map((c) => c.participant.id).toList();
//           if (userIds.isNotEmpty) {
//             ref.read(onlineStatusProvider.notifier).checkOnlineStatus(userIds);
//           }
//         },
//         orElse: () {},
//       );
//     });

//     final profileState = ref.watch(profileProvider);
//     final currentUserImg =
//         profileState.profileUser?.sponsorProfile?.profileImageUrl;

//     return conversationState.maybeWhen(
//       loading: () => const Center(child: CircularProgressIndicator()),
//       loaded: (conversations, messages) {
//         return RefreshIndicator(
//           onRefresh: () async {
//             ref.read(conversationProvider.notifier).getConversations();
//             ref.read(profileProvider.notifier).getProfile();
//           },
//           child: ListView.separated(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             itemCount: conversations.length,
//             separatorBuilder: (context, index) => const SizedBox(height: 2),
//             itemBuilder: (context, index) {
//               final conversation = conversations[index];
//               final bool isOnline =
//                   onlineStatus[conversation.participant.id] ?? false;

//               return InkWell(
//                 onTap: () {
//                   context.push(
//                     Routes.chatDetailRouteName,
//                     extra: {
//                       "name": conversation.participant.name,
//                       "logo": conversation.participant.profileImage,
//                       "isOnline": isOnline,
//                       "conversationId": conversation.id,
//                       "userId": conversation.participant.id,
//                     },
//                   );
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 14,
//                     horizontal: 20,
//                   ),
//                   child: Row(
//                     children: [
//                       _buildAvatarStack(
//                         conversation.participant.profileImage,
//                         currentUserImg,
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: CustomText(
//                                     title: conversation.participant.name,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                     textColor: AppColors.black,
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 8,
//                                   height: 8,
//                                   decoration: BoxDecoration(
//                                     color: isOnline
//                                         ? AppColors.success
//                                         : AppColors.grey,
//                                     shape: BoxShape.circle,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 CustomText(
//                                   title: DateFormatter.formatTime(
//                                     conversation.lastMessage?.createdAt ??
//                                         DateTime.now(),
//                                   ),
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w400,
//                                   textColor: AppColors.grey,
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: CustomText(
//                                     title: getLastConversationMessage(
//                                       conversation.lastMessage,
//                                     ),
//                                     maxLines: 1,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 14,
//                                     textColor: AppColors.textSecondary,
//                                   ),
//                                 ),
//                                 if (conversation.unreadCount > 0)
//                                   Container(
//                                     margin: const EdgeInsets.only(left: 8),
//                                     padding: const EdgeInsets.all(6),
//                                     decoration: BoxDecoration(
//                                       color: AppColors.primary,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: CustomText(
//                                       title: conversation.unreadCount
//                                           .toString(),

//                                       textColor: AppColors.white,
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//       orElse: () => const SizedBox(),
//     );
//   }

//   Widget _buildAvatarStack(
//     String participantImageUrl,
//     String? loggedInUserUrl,
//   ) {
//     return SizedBox(
//       width: 50,
//       height: 46,
//       child: Stack(
//         children: [
//           CircleAvatar(
//             radius: 18,
//             backgroundColor: Colors
//                 .purple
//                 .shade50, // Could use AppColors.extraLightGreen if available
//             backgroundImage:
//                 (loggedInUserUrl != null && loggedInUserUrl.isNotEmpty)
//                 ? NetworkImage("$fileBaseUrl$loggedInUserUrl")
//                 : null,
//             child: (loggedInUserUrl == null || loggedInUserUrl.isEmpty)
//                 ? Icon(
//                     Icons.person,
//                     size: 20,
//                     color: AppColors.primary, // Replaced Colors.purple
//                   )
//                 : null,
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.all(1.5),
//               decoration: const BoxDecoration(
//                 color: AppColors.white,
//                 shape: BoxShape.circle,
//               ),
//               child: CircleAvatar(
//                 radius: 15,
//                 backgroundColor: Colors.blue.shade50,
//                 backgroundImage: participantImageUrl.isNotEmpty
//                     ? NetworkImage(participantImageUrl)
//                     : null,
//                 child: participantImageUrl.isEmpty
//                     ? Icon(Icons.person, size: 15, color: AppColors.primary)
//                     : null,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String getLastConversationMessage(LastMessage? lastMessage) {
//     if (lastMessage == null) return "No messages yet";
//     switch (lastMessage.type) {
//       case "text":
//         return lastMessage.content;
//       case "image":
//         return "Image";
//       case "video":
//         return "Video";
//       default:
//         return "";
//     }
//   }
// }

import 'dart:math';
import 'package:athlink/features/message/domain/models/conversation.dart';
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
  const ChatListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationState = ref.watch(conversationProvider);
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

    final profileState = ref.watch(profileProvider);
    final currentUserImg =
        profileState.profileUser?.sponsorProfile?.profileImageUrl;

    return conversationState.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (conversations, messages) {
        // --- If no conversations, show static data with random times ---
        if (conversations.isEmpty) {
          return _buildStaticUsers(currentUserImg);
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.read(conversationProvider.notifier).getConversations();
            ref.read(profileProvider.notifier).getProfile();
          },
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: conversations.length,
            separatorBuilder: (context, index) => const SizedBox(height: 2),
            itemBuilder: (context, index) {
              final conversation = conversations[index];
              final bool isOnline =
                  onlineStatus[conversation.participant.id] ?? false;

              return _buildChatTile(
                context: context,
                name: conversation.participant.name,
                image: conversation.participant.profileImage,
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

  /// Builds the static list when empty
  Widget _buildStaticUsers(String? currentUserImg) {
    final List<Map<String, String>> staticUsers = [
      {
        "name": "Brooklyn Simmons",
        "msg": "Hey! Are you still looking for athletes?",
        "online": "true",
      },
      {
        "name": "Nike Regional",
        "msg": "We've reviewed your profile. Let's talk.",
        "online": "false",
      },
      {
        "name": "Guy Hawkins",
        "msg": "Sent you the training schedule for Monday.",
        "online": "true",
      },
      {
        "name": "Esther Howard",
        "msg": "Check out the new sponsorship contract.",
        "online": "false",
      },
    ];

    final random = Random();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: staticUsers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 2),
      itemBuilder: (context, index) {
        final user = staticUsers[index];

        // Generate a random time string
        final minutes = random.nextInt(59) + 1;
        final timeString = index == 0 ? "Just now" : "$minutes min ago";

        return _buildChatTile(
          context: context,
          name: user['name']!,
          image: "", // Empty to trigger the placeholder icon
          currentUserImg: currentUserImg,
          isOnline: user['online'] == "true",
          time: timeString,
          message: user['msg']!,
          unreadCount: index == 0 ? 2 : 0, // Mock one unread message
          onTap: () {}, // Static users don't need navigation yet
        );
      },
    );
  }

  /// Refactored Tile to keep UI identical between Real and Static data
  Widget _buildChatTile({
    required BuildContext context,
    required String name,
    required String image,
    required String? currentUserImg,
    required bool isOnline,
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
                          textColor: AppColors.black,
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
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: CustomText(
                            title: unreadCount.toString(),
                            textColor: AppColors.white,
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
