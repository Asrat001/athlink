import 'package:athlink/features/sponsor/watchlist/domain/models/watchlist_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_state.freezed.dart';

/// Clean union-based state - predictable and type-safe
@freezed
abstract class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = _Initial;
  const factory WatchlistState.loading() = _Loading;
  const factory WatchlistState.success({
    required WatchlistData watchlistData,
  }) = _Success;
  const factory WatchlistState.error({
    required String errorMessage,
  }) = _Error;
}
