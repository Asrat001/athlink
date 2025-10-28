import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/features/watchlist/presentation/providers/state/watchlist_state.dart';
import 'package:athlink/features/watchlist/presentation/providers/watchlist_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final watchlistProvider =
    StateNotifierProvider<WatchlistNotifier, WatchlistState>((
  ref,
) {
  return WatchlistNotifier(sl<WatchlistRepository>());
});
