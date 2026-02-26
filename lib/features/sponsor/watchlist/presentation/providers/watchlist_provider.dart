import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/sponsor/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/features/sponsor/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/state/watchlist_state.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/providers/watchlist_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Export watchlistIdsProvider from watchlist_notifier.dart
export 'watchlist_notifier.dart' show watchlistIdsProvider;

final watchlistProvider =
    StateNotifierProvider<WatchlistNotifier, WatchlistState>((ref) {
      return WatchlistNotifier(sl<WatchlistRepository>(), ref);
    });

/// Search query state provider for watchlist
final watchlistSearchQueryProvider = StateProvider<String>((ref) => '');

/// Provider for filtered watchlist with search support
final filteredWatchlistProvider = Provider.family<List<WatchlistItem>, String>((
  ref,
  searchQuery,
) {
  final state = ref.watch(watchlistProvider);
  final query = searchQuery.toLowerCase().trim();

  return state.maybeWhen(
    success: (data) {
      final watchlist = data.watchlist;
      // If no search query, return all
      if (query.isEmpty) {
        return watchlist;
      }

      // Filter by athlete name or sport
      return watchlist.where((item) {
        final athlete = item.athlete;
        if (athlete == null) return false;

        final nameMatch = (athlete.athleteProfile?.name ?? athlete.name ?? '')
            .toLowerCase()
            .contains(query);

        final sportMatch = athlete.sport.any(
          (s) => (s.name ?? '').toLowerCase().contains(query),
        );

        return nameMatch || sportMatch;
      }).toList();
    },
    orElse: () => [],
  );
});
