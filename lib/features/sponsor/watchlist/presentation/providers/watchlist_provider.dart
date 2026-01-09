import 'package:athlink/di.dart' show sl;
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
