import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_models.freezed.dart';
part 'watchlist_models.g.dart';

// Watchlist API response models

@freezed
abstract class WatchlistItem with _$WatchlistItem {
  const factory WatchlistItem({
    @JsonKey(name: '_id') String? id,
    String? sponsor,
    Athlete? athlete,
    String? notes,
    String? createdAt,
    String? updatedAt,
  }) = _WatchlistItem;

  factory WatchlistItem.fromJson(Map<String, dynamic> json) =>
      _$WatchlistItemFromJson(json);
}

@freezed
abstract class WatchlistData with _$WatchlistData {
  const factory WatchlistData({
    @Default([]) List<WatchlistItem> watchlist,
    @Default(0) int count,
  }) = _WatchlistData;

  factory WatchlistData.fromJson(Map<String, dynamic> json) =>
      _$WatchlistDataFromJson(json);
}

@freezed
abstract class WatchlistResponse with _$WatchlistResponse {
  const factory WatchlistResponse({
    @Default(false) bool success,
    @Default('') String message,
    WatchlistData? data,
  }) = _WatchlistResponse;

  factory WatchlistResponse.fromJson(Map<String, dynamic> json) =>
      _$WatchlistResponseFromJson(json);
}

// Add to watchlist request
@freezed
abstract class AddWatchlistRequest with _$AddWatchlistRequest {
  const factory AddWatchlistRequest({
    required String athleteId,
    String? notes,
  }) = _AddWatchlistRequest;

  factory AddWatchlistRequest.fromJson(Map<String, dynamic> json) =>
      _$AddWatchlistRequestFromJson(json);
}

// Add to watchlist response
@freezed
abstract class AddWatchlistResponse with _$AddWatchlistResponse {
  const factory AddWatchlistResponse({
    @Default(false) bool success,
    @Default('') String message,
    WatchlistItem? watchlistEntry,
  }) = _AddWatchlistResponse;

  factory AddWatchlistResponse.fromJson(Map<String, dynamic> json) =>
      _$AddWatchlistResponseFromJson(json);
}
