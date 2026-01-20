import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for managing connections list (friends)
class ConnectionsListNotifier
    extends StateNotifier<ConnectionListState<ConnectedUser>> {
  final AthleteFeedRepository _repository;

  ConnectionsListNotifier(this._repository)
    : super(const ConnectionListState.loading());

  Future<void> getConnections() async {
    state = const ConnectionListState.loading();

    final response = await _repository.getConnections();

    response.when(
      success: (connections) {
        if (connections.isEmpty) {
          state = const ConnectionListState.empty();
        } else {
          state = ConnectionListState.loaded(connections);
        }
      },
      failure: (error) {
        state = ConnectionListState.error(
          NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void refresh() {
    getConnections();
  }
}
