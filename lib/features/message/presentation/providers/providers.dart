import 'package:athlink/features/message/domain/repository/chat_repository.dart';
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
