import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/providers/states/conversation_state.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
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

    final profileState = ref.watch(profileProvider);
    final currentUserImg =
        profileState.profileUser?.sponsorProfile?.profileImageUrl;

    return conversationState.maybeWhen(
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (conversations, messages) {
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
              final bool isOnline = index % 2 == 0;

              return InkWell(
                onTap: () {
                  context.push(
                    Routes.chatDetailRouteName,
                    extra: {
                      "name": conversation.participant.name,
                      "logo": conversation.participant.profileImage,
                      "isOnline": isOnline,
                      "conversationId": conversation.id,
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      _buildAvatarStack(
                        conversation.participant.profileImage,
                        currentUserImg,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    title: conversation.participant.name,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.black,
                                  ),
                                ),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: isOnline
                                        ? AppColors.success
                                        : AppColors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                CustomText(
                                  title: DateFormatter.formatTime(
                                    conversation.lastMessage?.createdAt ??
                                        DateTime.now(),
                                  ),
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
                                    title: getLastConversationMessage(
                                      conversation.lastMessage,
                                    ),
                                    maxLines: 1,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.textSecondary,
                                  ),
                                ),
                                if (conversation.unreadCount > 0)
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: CustomText(
                                      title: conversation.unreadCount
                                          .toString(),

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
            },
          ),
        );
      },
      orElse: () => const SizedBox(),
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
            backgroundColor: Colors
                .purple
                .shade50, // Could use AppColors.extraLightGreen if available
            backgroundImage:
                (loggedInUserUrl != null && loggedInUserUrl.isNotEmpty)
                ? NetworkImage("$fileBaseUrl$loggedInUserUrl")
                : null,
            child: (loggedInUserUrl == null || loggedInUserUrl.isEmpty)
                ? Icon(
                    Icons.person,
                    size: 20,
                    color: AppColors.primary, // Replaced Colors.purple
                  )
                : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1.5),
              decoration: const BoxDecoration(
                color: AppColors.white, // Replaced Colors.white
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors
                    .blue
                    .shade50, // Could use AppColors.lightBlue if available
                backgroundImage: participantImageUrl.isNotEmpty
                    ? NetworkImage(participantImageUrl)
                    : null,
                child: participantImageUrl.isEmpty
                    ? Icon(
                        Icons.person,
                        size: 15,
                        color: AppColors.primary, // Replaced Colors.blue
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
        return "📷 Image";
      case "video":
        return "🎥 Video";
      default:
        return "";
    }
  }
}
