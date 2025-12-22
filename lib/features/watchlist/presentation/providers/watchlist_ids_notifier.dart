import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/features/watchlist/domain/models/watchlist_models.dart';

/// Lightweight notifier that manages a set of athlete IDs in the watchlist
/// Provides O(1) lookup performance and persists state to local storage
class WatchlistIdsNotifier extends StateNotifier<Set<String>> {
  final LocalStorageService _storage;

  WatchlistIdsNotifier(this._storage) : super({}) {
    _loadFromStorage();
  }

  /// Load cached IDs from storage on initialization
  Future<void> _loadFromStorage() async {
    final cachedIds = await _storage.getWatchlistIds();
    if (cachedIds.isNotEmpty) {
      state = cachedIds;
    }
  }

  /// Save IDs to storage
  Future<void> _saveToStorage() async {
    await _storage.setWatchlistIds(state);
  }

  /// Check if athlete is in watchlist
  bool isInWatchlist(String athleteId) => state.contains(athleteId);

  /// Add athlete ID to set
  Future<void> add(String athleteId) async {
    if (!state.contains(athleteId)) {
      state = {...state, athleteId};
      await _saveToStorage();
    }
  }

  /// Remove athlete ID from set
  Future<void> remove(String athleteId) async {
    if (state.contains(athleteId)) {
      state = state.where((id) => id != athleteId).toSet();
      await _saveToStorage();
    }
  }

  /// Sync entire set with watchlist data from server
  Future<void> syncFromWatchlist(List<WatchlistItem> items) async {
    final ids = items
        .where((item) => item.athlete?.id != null)
        .map((item) => item.athlete!.id!)
        .toSet();
    state = ids;
    await _saveToStorage();
  }

  /// Clear all IDs
  Future<void> clear() async {
    state = {};
    await _saveToStorage();
  }
}
