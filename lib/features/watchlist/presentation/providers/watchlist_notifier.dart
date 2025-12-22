import 'package:athlink/di.dart' show sl;
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/features/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/features/watchlist/presentation/providers/state/watchlist_state.dart';
import 'package:athlink/features/watchlist/presentation/providers/watchlist_ids_notifier.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for watchlist IDs - defined here to avoid circular dependency
final watchlistIdsProvider =
    StateNotifierProvider<WatchlistIdsNotifier, Set<String>>((ref) {
      return WatchlistIdsNotifier(sl<LocalStorageService>());
    });

/// Clean watchlist notifier - no UI state, only business logic
class WatchlistNotifier extends StateNotifier<WatchlistState> {
  final WatchlistRepository _watchlistRepository;
  final Ref _ref;

  WatchlistNotifier(this._watchlistRepository, this._ref)
    : super(const WatchlistState.initial());

  /// Sync IDs after data changes
  void _syncIds(WatchlistData data) {
    _ref.read(watchlistIdsProvider.notifier).syncFromWatchlist(data.watchlist);
  }

  Future<void> getWatchlist() async {
    state = const WatchlistState.loading();
    try {
      final response = await _watchlistRepository.getWatchlist();
      response.when(
        success: (data) {
          if (data.data != null) {
            state = WatchlistState.success(watchlistData: data.data!);
            _syncIds(data.data!); // Sync IDs after successful fetch
          } else {
            state = const WatchlistState.error(
              errorMessage: 'No watchlist data found',
            );
          }
        },
        failure: (error) {
          final errorMsg = NetworkExceptions.getErrorMessage(error);
          state = WatchlistState.error(errorMessage: errorMsg);
        },
      );
    } catch (e) {
      state = WatchlistState.error(errorMessage: e.toString());
    }
  }

  Future<bool> addToWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    if (athleteId.isEmpty) {
      state = const WatchlistState.error(
        errorMessage: 'No athlete ID provided',
      );
      return false;
    }

    // Optimistic update
    await _ref.read(watchlistIdsProvider.notifier).add(athleteId);

    final response = await _watchlistRepository.addToWatchlist(
      athleteId: athleteId,
      notes: notes,
    );

    return response.when(
      success: (data) {
        getWatchlist(); // Refresh full data
        return true;
      },
      failure: (error) {
        // Rollback on failure
        _ref.read(watchlistIdsProvider.notifier).remove(athleteId);
        final errorMsg = NetworkExceptions.getErrorMessage(error);
        state = WatchlistState.error(errorMessage: errorMsg);
        return false;
      },
    );
  }

  Future<bool> deleteAthleteFromWatchlist({required String athleteId}) async {
    // Optimistic update
    await _ref.read(watchlistIdsProvider.notifier).remove(athleteId);

    final response = await _watchlistRepository.deleteAthleteFromWatchlist(
      athleteId: athleteId,
    );

    return response.when(
      success: (data) {
        getWatchlist(); // Refresh full data
        return true;
      },
      failure: (error) {
        // Rollback on failure
        _ref.read(watchlistIdsProvider.notifier).add(athleteId);
        final errorMsg = NetworkExceptions.getErrorMessage(error);
        state = WatchlistState.error(errorMessage: errorMsg);
        return false;
      },
    );
  }

  /// Toggle watchlist - convenience method for UI
  Future<bool> toggleWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    final isInWatchlist = _ref.read(watchlistIdsProvider).contains(athleteId);

    if (isInWatchlist) {
      return await deleteAthleteFromWatchlist(athleteId: athleteId);
    } else {
      return await addToWatchlist(athleteId: athleteId, notes: notes);
    }
  }

  void resetState() {
    state = const WatchlistState.initial();
    _ref.read(watchlistIdsProvider.notifier).clear();
  }
}
