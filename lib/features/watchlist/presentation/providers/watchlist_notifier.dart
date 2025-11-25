import 'dart:developer' as developer;
import 'package:athlink/features/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/features/watchlist/presentation/providers/state/watchlist_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchlistNotifier extends StateNotifier<WatchlistState> {
  final WatchlistRepository _watchlistRepository;

  WatchlistNotifier(this._watchlistRepository)
      : super(WatchlistState.initial());

  Future<void> getWatchlist() async {
    developer.log('WatchlistNotifier: Starting to fetch watchlist...');
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _watchlistRepository.getWatchlist();

    response.when(
      success: (data) {
        developer.log(
            'WatchlistNotifier: Success! Got ${data.data?.count ?? 0} items');
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          watchlistData: data.data,
          errorMessage: null,
        );
      },
      failure: (error) {
        final errorMsg = NetworkExceptions.getErrorMessage(error);
        developer.log('WatchlistNotifier: Error - $errorMsg');
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: errorMsg,
        );
      },
    );
  }

  Future<bool> addToWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    developer.log('WatchlistNotifier: Adding athlete $athleteId to watchlist...');

    final response = await _watchlistRepository.addToWatchlist(
      athleteId: athleteId,
      notes: notes,
    );

    return response.when(
      success: (data) {
        developer.log(
            'WatchlistNotifier: Successfully added athlete to watchlist');
        // Refresh the watchlist after adding
        getWatchlist();
        return true;
      },
      failure: (error) {
        final errorMsg = NetworkExceptions.getErrorMessage(error);
        developer.log('WatchlistNotifier: Error adding to watchlist - $errorMsg');
        state = state.copyWith(errorMessage: errorMsg);
        return false;
      },
    );
  }

  Future<bool> deleteAthleteFromWatchlist({
    required String athleteId,
  }) async {
    developer.log('WatchlistNotifier: Removing athlete $athleteId from watchlist...');

    final response = await _watchlistRepository.deleteAthleteFromWatchlist(
      athleteId: athleteId,
    );

    return response.when(
      success: (data) {
        developer.log(
            'WatchlistNotifier: Successfully removed athlete from watchlist');
        // Refresh the watchlist after removing
        getWatchlist();
        return true;
      },
      failure: (error) {
        final errorMsg = NetworkExceptions.getErrorMessage(error);
        developer.log('WatchlistNotifier: Error removing from watchlist - $errorMsg');
        state = state.copyWith(errorMessage: errorMsg);
        return false;
      },
    );
  }

  void resetState() {
    state = WatchlistState.initial();
  }
}
