import 'package:athlink/features/watchlist/domain/models/watchlist_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_state.freezed.dart';

@freezed
abstract class WatchlistState with _$WatchlistState {
  const factory WatchlistState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    WatchlistData? watchlistData,
    String? errorMessage,
  }) = _WatchlistState;

  factory WatchlistState.initial() => const WatchlistState();
}
