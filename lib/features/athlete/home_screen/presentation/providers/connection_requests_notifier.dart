
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/state/connection_list_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for managing connection requests (received and sent)
class ConnectionRequestsNotifier
    extends StateNotifier<ConnectionListState<FriendRequest>> {
  final AthleteFeedRepository _repository;

   ConnectionRequestsNotifier(this._repository)
    : super(const ConnectionListState.loading());

  Future<void> getReceivedRequests() async {
    state = const ConnectionListState.loading();

    final response = await _repository.getReceivedRequests();

    response.when(
      success: (requests) {
        if (requests.isEmpty) {
          state = const ConnectionListState.empty();
        } else {
          state = ConnectionListState.loaded(requests);
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
    getReceivedRequests();
  }
}


/// Notifier for managing connection requests (received and sent)
class SentConnectionRequestsNotifier
    extends StateNotifier<ConnectionListState<SendFriendRequest>> {
  final AthleteFeedRepository _repository;

   SentConnectionRequestsNotifier(this._repository)
    : super(const ConnectionListState.loading());



  Future<void> getSentRequests() async {
    state = const ConnectionListState.loading();

    final response = await _repository.getSentRequests();

    response.when(
      success: (requests) {
        if (requests.isEmpty) {
          state = const ConnectionListState.empty();
        } else {
          state = ConnectionListState.loaded(requests);
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
    getSentRequests();
  }
}