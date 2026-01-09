// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchlistItem _$WatchlistItemFromJson(Map<String, dynamic> json) =>
    _WatchlistItem(
      id: json['_id'] as String?,
      sponsor: json['sponsor'] as String?,
      athlete: json['athlete'] == null
          ? null
          : Athlete.fromJson(json['athlete'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$WatchlistItemToJson(_WatchlistItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sponsor': instance.sponsor,
      'athlete': instance.athlete,
      'notes': instance.notes,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_WatchlistData _$WatchlistDataFromJson(Map<String, dynamic> json) =>
    _WatchlistData(
      watchlist:
          (json['watchlist'] as List<dynamic>?)
              ?.map((e) => WatchlistItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WatchlistDataToJson(_WatchlistData instance) =>
    <String, dynamic>{'watchlist': instance.watchlist, 'count': instance.count};

_WatchlistResponse _$WatchlistResponseFromJson(Map<String, dynamic> json) =>
    _WatchlistResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : WatchlistData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchlistResponseToJson(_WatchlistResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_AddWatchlistRequest _$AddWatchlistRequestFromJson(Map<String, dynamic> json) =>
    _AddWatchlistRequest(
      athleteId: json['athleteId'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddWatchlistRequestToJson(
  _AddWatchlistRequest instance,
) => <String, dynamic>{
  'athleteId': instance.athleteId,
  'notes': instance.notes,
};

_AddWatchlistResponse _$AddWatchlistResponseFromJson(
  Map<String, dynamic> json,
) => _AddWatchlistResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  watchlistEntry: json['watchlistEntry'] == null
      ? null
      : WatchlistItem.fromJson(json['watchlistEntry'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddWatchlistResponseToJson(
  _AddWatchlistResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'watchlistEntry': instance.watchlistEntry,
};

_UpdateWatchlistNotesResponse _$UpdateWatchlistNotesResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateWatchlistNotesResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  watchlistEntry: json['watchlistEntry'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateWatchlistNotesResponseToJson(
  _UpdateWatchlistNotesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'watchlistEntry': instance.watchlistEntry,
};

_DeleteWatchlistResponse _$DeleteWatchlistResponseFromJson(
  Map<String, dynamic> json,
) => _DeleteWatchlistResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  athleteId: json['athleteId'] as String?,
);

Map<String, dynamic> _$DeleteWatchlistResponseToJson(
  _DeleteWatchlistResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'athleteId': instance.athleteId,
};
