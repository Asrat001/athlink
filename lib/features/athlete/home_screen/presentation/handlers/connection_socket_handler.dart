import 'package:athlink/core/services/socket_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/connection_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that initializes connection socket listeners
final connectionSocketHandlerProvider = Provider<ConnectionSocketHandler>((
  ref,
) {
  return ConnectionSocketHandler(ref);
});

/// Handles real-time connection events via WebSocket
class ConnectionSocketHandler {
  final Ref _ref;
  final SocketIoService _socketService = sl<SocketIoService>();

  ConnectionSocketHandler(this._ref) {
    _initializeListeners();
  }

  void _initializeListeners() {
    // Listen for connection request received
    _socketService.onConnectionRequest((connectionId, requesterId) {
      // Refresh received requests list
      _ref.read(connectionRequestsProvider.notifier).refresh();
    });

    // Listen for connection accepted
    _socketService.onConnectionAccepted((connectionId, acceptedBy) {
      // Refresh connections list and sent requests
      _ref.read(connectionsListProvider.notifier).refresh();
      _ref.read(sentConnectionRequestsProvider.notifier).refresh();
    });

    // Listen for connection rejected
    _socketService.onConnectionRejected((connectionId) {
      // Refresh sent requests list
      _ref.read(sentConnectionRequestsProvider.notifier).refresh();
    });
  }
}
