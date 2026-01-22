import 'package:athlink/features/message/domain/models/conversation.dart';
import 'package:athlink/features/message/domain/repository/chat_repository.dart';
import 'package:athlink/features/message/presentation/providers/conversation_filter.dart';
import 'package:athlink/features/message/presentation/providers/notifiers/chat_notifier.dart';
import 'package:athlink/features/message/presentation/providers/notifiers/conversation_notifier.dart';
import 'package:athlink/features/message/presentation/providers/notifiers/online_status_notifier.dart';
import 'package:athlink/features/message/presentation/providers/states/chat_state.dart';
import 'package:athlink/features/message/presentation/providers/states/conversation_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di.dart';

final conversationProvider =
    StateNotifierProvider<ConversationNotifier, ConversationState>(
      (ref) => ConversationNotifier(sl<ChatRepository>()),
    );

// Chat provider for individual conversations
// Uses direct injection of SocketIoService singleton from GetIt
final chatProvider = StateNotifierProvider.family
    .autoDispose<ChatNotifier, ChatState, String>((ref, conversationId) {
      return ChatNotifier(
        repository: sl<ChatRepository>(),
        conversationId: conversationId,
        ref: ref,
      );
    });

final onlineStatusProvider =
    StateNotifierProvider<OnlineStatusNotifier, Map<String, bool>>((ref) {
      return OnlineStatusNotifier();
    });

// Search query state provider
final searchQueryProvider = StateProvider<String>((ref) => '');

// Family provider for filtered conversations with search support
// Returns conversations filtered by participant role and search query
final filteredConversationsProvider = Provider.family<
    List<Conversation>,
    ({ConversationFilter filter, String searchQuery})>((ref, params) {
  final state = ref.watch(conversationProvider);
  final searchQuery = params.searchQuery.toLowerCase().trim();

  return state.maybeWhen(
    loaded: (conversations, _) {
      // First filter by role
      List<Conversation> filtered = conversations;
      if (params.filter == ConversationFilter.sponsors) {
        filtered = conversations
            .where((conv) =>
                conv.participant.role.toLowerCase().contains('sponsor'))
            .toList();
      } else if (params.filter == ConversationFilter.athletes) {
        filtered = conversations
            .where(
                (conv) => conv.participant.role.toLowerCase().contains('athlet'))
            .toList();
      }

      // Then apply search query if provided
      if (searchQuery.isEmpty) {
        return filtered;
      }

      return filtered.where((conv) {
        final nameMatch =
            conv.participant.name.toLowerCase().contains(searchQuery);
        final messageMatch =
            conv.lastMessage?.content.toLowerCase().contains(searchQuery) ??
                false;
        return nameMatch || messageMatch;
      }).toList();
    },
    orElse: () => [],
  );
});
