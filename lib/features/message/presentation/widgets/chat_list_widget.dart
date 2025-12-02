import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/providers/states/conversation_state.dart';
import 'package:athlink/routes/route_names.dart';
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
    return conversationState.maybeWhen(
      initial: () => const SizedBox(),
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
      loaded: (conversations, messages) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: conversations.length,
          itemBuilder: (context, index) {
            final conversation = conversations[index];

            return InkWell(
              onTap: () {
                context.push(
                  Routes.chatDetailRouteName,
                  extra: {
                    "name":conversation.participant.name ,
                    "logo": conversation.participant.profileImage,
                    "isOnline": false,
                    "conversationId": conversation.id,
                  },
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: index % 2 == 1
                      ? AppColors.extraLightGrey.withValues(alpha: 0.3)
                      : AppColors.transparent,
                ),
                child: Row(
                  children: [
            
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.extraLightGrey,
                        backgroundImage: NetworkImage(
                        "http://139.59.141.150:4000/uploads/profileImage-1761680272690-720968508.png"
                        ),
                      ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title:conversation.participant.name,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 3),
                          CustomText(
                            title: conversation.lastMessage?.content ?? "",
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.grey600,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        CustomText(
                          title:DateFormatter.formatTime(conversation.lastMessage?.createdAt??DateTime.now()),   
                          fontSize: 12,
                          textColor: AppColors.grey600,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.green,
                            ),
                            child: CustomText(
                              title: conversation.unreadCount.toString(),
                              fontSize: 12,
                              textColor: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(conversationProvider.notifier).getConversations();
                },
                child: const Text("Retry"),
              ),
            ],
          ),
        );
      },
      orElse: () => const SizedBox(),
    );
  }
}
