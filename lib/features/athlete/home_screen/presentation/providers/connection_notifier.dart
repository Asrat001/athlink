import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_state.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectionNotifier extends StateNotifier<ConnectionState> {
  final AthleteFeedRepository _athleteFeedRepository;

  ConnectionNotifier(this._athleteFeedRepository)
    : super(const ConnectionState.initial());

  Future<void> sendConnectionRequest(String athleteId) async {
    state = const ConnectionState.loading();

    final response = await _athleteFeedRepository.sendConnectionRequest(
      athleteId,
    );

    response.when(
      success: (data) {
        if (data.success) {
          state = ConnectionState.success(message: data.message);
        } else {
          state = ConnectionState.error(errorMessage: data.message);
        }
      },
      failure: (error) {
        state = ConnectionState.error(
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> acceptRequest(String connectionId) async {
    state = const ConnectionState.loading();

    final response = await _athleteFeedRepository.acceptRequest(connectionId);

    response.when(
      success: (connection) {
        state = const ConnectionState.success(
          message: 'Connection request accepted',
        );
      },
      failure: (error) {
        state = ConnectionState.error(
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> rejectRequest(String connectionId) async {
    state = const ConnectionState.loading();

    final response = await _athleteFeedRepository.rejectRequest(connectionId);

    response.when(
      success: (connection) {
        state = const ConnectionState.success(
          message: 'Connection request rejected',
        );
      },
      failure: (error) {
        state = ConnectionState.error(
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> cancelRequest(String connectionId) async {
    state = const ConnectionState.loading();

    final response = await _athleteFeedRepository.cancelRequest(connectionId);

    response.when(
      success: (success) {
        if (success) {
          state = const ConnectionState.success(
            message: 'Connection request cancelled',
          );
        } else {
          state = const ConnectionState.error(
            errorMessage: 'Failed to cancel request',
          );
        }
      },
      failure: (error) {
        state = ConnectionState.error(
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> removeConnection(String connectionId) async {
    state = const ConnectionState.loading();

    final response = await _athleteFeedRepository.removeConnection(
      connectionId,
    );

    response.when(
      success: (success) {
        if (success) {
          state = const ConnectionState.success(message: 'Connection removed');
        } else {
          state = const ConnectionState.error(
            errorMessage: 'Failed to remove connection',
          );
        }
      },
      failure: (error) {
        state = ConnectionState.error(
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void resetState() {
    state = const ConnectionState.initial();
  }
}
