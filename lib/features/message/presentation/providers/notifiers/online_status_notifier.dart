import 'package:athlink/core/services/socket_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/di.dart';

class OnlineStatusNotifier extends StateNotifier<Map<String, bool>> {
  final SocketIoService _socketService;

  OnlineStatusNotifier() : _socketService = sl<SocketIoService>(), super({}) {
    _init();
  }

  void _init() {
    _socketService.onUserOnlineStatusChanged((userId, isOnline) {
      state = {...state, userId: isOnline};
    });
  }

  void checkOnlineStatus(List<String> userIds) {
    // Filter out users we already know about to avoid unnecessary traffic?
    // For now, just fetch all requested to be safe/fresh.
    if (userIds.isEmpty) return;

    _socketService.getOnlineStatus(userIds, (statusMap) {
      state = {...state, ...statusMap};
    });
  }
}
