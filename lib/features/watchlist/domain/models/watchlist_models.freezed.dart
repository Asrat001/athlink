// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchlistItem {

@JsonKey(name: '_id') String? get id; String? get sponsor; Athlete? get athlete; String? get notes; String? get createdAt; String? get updatedAt;
/// Create a copy of WatchlistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistItemCopyWith<WatchlistItem> get copyWith => _$WatchlistItemCopyWithImpl<WatchlistItem>(this as WatchlistItem, _$identity);

  /// Serializes this WatchlistItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.athlete, athlete) || other.athlete == athlete)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsor,athlete,notes,createdAt,updatedAt);

@override
String toString() {
  return 'WatchlistItem(id: $id, sponsor: $sponsor, athlete: $athlete, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WatchlistItemCopyWith<$Res>  {
  factory $WatchlistItemCopyWith(WatchlistItem value, $Res Function(WatchlistItem) _then) = _$WatchlistItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? sponsor, Athlete? athlete, String? notes, String? createdAt, String? updatedAt
});


$AthleteCopyWith<$Res>? get athlete;

}
/// @nodoc
class _$WatchlistItemCopyWithImpl<$Res>
    implements $WatchlistItemCopyWith<$Res> {
  _$WatchlistItemCopyWithImpl(this._self, this._then);

  final WatchlistItem _self;
  final $Res Function(WatchlistItem) _then;

/// Create a copy of WatchlistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? sponsor = freezed,Object? athlete = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,athlete: freezed == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Athlete?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WatchlistItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteCopyWith<$Res>? get athlete {
    if (_self.athlete == null) {
    return null;
  }

  return $AthleteCopyWith<$Res>(_self.athlete!, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}
}


/// Adds pattern-matching-related methods to [WatchlistItem].
extension WatchlistItemPatterns on WatchlistItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistItem value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistItem value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? sponsor,  Athlete? athlete,  String? notes,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistItem() when $default != null:
return $default(_that.id,_that.sponsor,_that.athlete,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? sponsor,  Athlete? athlete,  String? notes,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WatchlistItem():
return $default(_that.id,_that.sponsor,_that.athlete,_that.notes,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? sponsor,  Athlete? athlete,  String? notes,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistItem() when $default != null:
return $default(_that.id,_that.sponsor,_that.athlete,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistItem implements WatchlistItem {
  const _WatchlistItem({@JsonKey(name: '_id') this.id, this.sponsor, this.athlete, this.notes, this.createdAt, this.updatedAt});
  factory _WatchlistItem.fromJson(Map<String, dynamic> json) => _$WatchlistItemFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? sponsor;
@override final  Athlete? athlete;
@override final  String? notes;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of WatchlistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistItemCopyWith<_WatchlistItem> get copyWith => __$WatchlistItemCopyWithImpl<_WatchlistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.athlete, athlete) || other.athlete == athlete)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsor,athlete,notes,createdAt,updatedAt);

@override
String toString() {
  return 'WatchlistItem(id: $id, sponsor: $sponsor, athlete: $athlete, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WatchlistItemCopyWith<$Res> implements $WatchlistItemCopyWith<$Res> {
  factory _$WatchlistItemCopyWith(_WatchlistItem value, $Res Function(_WatchlistItem) _then) = __$WatchlistItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? sponsor, Athlete? athlete, String? notes, String? createdAt, String? updatedAt
});


@override $AthleteCopyWith<$Res>? get athlete;

}
/// @nodoc
class __$WatchlistItemCopyWithImpl<$Res>
    implements _$WatchlistItemCopyWith<$Res> {
  __$WatchlistItemCopyWithImpl(this._self, this._then);

  final _WatchlistItem _self;
  final $Res Function(_WatchlistItem) _then;

/// Create a copy of WatchlistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? sponsor = freezed,Object? athlete = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_WatchlistItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,athlete: freezed == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Athlete?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WatchlistItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteCopyWith<$Res>? get athlete {
    if (_self.athlete == null) {
    return null;
  }

  return $AthleteCopyWith<$Res>(_self.athlete!, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}
}


/// @nodoc
mixin _$WatchlistData {

 List<WatchlistItem> get watchlist; int get count;
/// Create a copy of WatchlistData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistDataCopyWith<WatchlistData> get copyWith => _$WatchlistDataCopyWithImpl<WatchlistData>(this as WatchlistData, _$identity);

  /// Serializes this WatchlistData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistData&&const DeepCollectionEquality().equals(other.watchlist, watchlist)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(watchlist),count);

@override
String toString() {
  return 'WatchlistData(watchlist: $watchlist, count: $count)';
}


}

/// @nodoc
abstract mixin class $WatchlistDataCopyWith<$Res>  {
  factory $WatchlistDataCopyWith(WatchlistData value, $Res Function(WatchlistData) _then) = _$WatchlistDataCopyWithImpl;
@useResult
$Res call({
 List<WatchlistItem> watchlist, int count
});




}
/// @nodoc
class _$WatchlistDataCopyWithImpl<$Res>
    implements $WatchlistDataCopyWith<$Res> {
  _$WatchlistDataCopyWithImpl(this._self, this._then);

  final WatchlistData _self;
  final $Res Function(WatchlistData) _then;

/// Create a copy of WatchlistData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? watchlist = null,Object? count = null,}) {
  return _then(_self.copyWith(
watchlist: null == watchlist ? _self.watchlist : watchlist // ignore: cast_nullable_to_non_nullable
as List<WatchlistItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchlistData].
extension WatchlistDataPatterns on WatchlistData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistData value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistData value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WatchlistItem> watchlist,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistData() when $default != null:
return $default(_that.watchlist,_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WatchlistItem> watchlist,  int count)  $default,) {final _that = this;
switch (_that) {
case _WatchlistData():
return $default(_that.watchlist,_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WatchlistItem> watchlist,  int count)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistData() when $default != null:
return $default(_that.watchlist,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistData implements WatchlistData {
  const _WatchlistData({final  List<WatchlistItem> watchlist = const [], this.count = 0}): _watchlist = watchlist;
  factory _WatchlistData.fromJson(Map<String, dynamic> json) => _$WatchlistDataFromJson(json);

 final  List<WatchlistItem> _watchlist;
@override@JsonKey() List<WatchlistItem> get watchlist {
  if (_watchlist is EqualUnmodifiableListView) return _watchlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watchlist);
}

@override@JsonKey() final  int count;

/// Create a copy of WatchlistData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistDataCopyWith<_WatchlistData> get copyWith => __$WatchlistDataCopyWithImpl<_WatchlistData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistData&&const DeepCollectionEquality().equals(other._watchlist, _watchlist)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_watchlist),count);

@override
String toString() {
  return 'WatchlistData(watchlist: $watchlist, count: $count)';
}


}

/// @nodoc
abstract mixin class _$WatchlistDataCopyWith<$Res> implements $WatchlistDataCopyWith<$Res> {
  factory _$WatchlistDataCopyWith(_WatchlistData value, $Res Function(_WatchlistData) _then) = __$WatchlistDataCopyWithImpl;
@override @useResult
$Res call({
 List<WatchlistItem> watchlist, int count
});




}
/// @nodoc
class __$WatchlistDataCopyWithImpl<$Res>
    implements _$WatchlistDataCopyWith<$Res> {
  __$WatchlistDataCopyWithImpl(this._self, this._then);

  final _WatchlistData _self;
  final $Res Function(_WatchlistData) _then;

/// Create a copy of WatchlistData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? watchlist = null,Object? count = null,}) {
  return _then(_WatchlistData(
watchlist: null == watchlist ? _self._watchlist : watchlist // ignore: cast_nullable_to_non_nullable
as List<WatchlistItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$WatchlistResponse {

 bool get success; String get message; WatchlistData? get data;
/// Create a copy of WatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistResponseCopyWith<WatchlistResponse> get copyWith => _$WatchlistResponseCopyWithImpl<WatchlistResponse>(this as WatchlistResponse, _$identity);

  /// Serializes this WatchlistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'WatchlistResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $WatchlistResponseCopyWith<$Res>  {
  factory $WatchlistResponseCopyWith(WatchlistResponse value, $Res Function(WatchlistResponse) _then) = _$WatchlistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, WatchlistData? data
});


$WatchlistDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$WatchlistResponseCopyWithImpl<$Res>
    implements $WatchlistResponseCopyWith<$Res> {
  _$WatchlistResponseCopyWithImpl(this._self, this._then);

  final WatchlistResponse _self;
  final $Res Function(WatchlistResponse) _then;

/// Create a copy of WatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as WatchlistData?,
  ));
}
/// Create a copy of WatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchlistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $WatchlistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [WatchlistResponse].
extension WatchlistResponsePatterns on WatchlistResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistResponse value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  WatchlistData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  WatchlistData? data)  $default,) {final _that = this;
switch (_that) {
case _WatchlistResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  WatchlistData? data)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchlistResponse implements WatchlistResponse {
  const _WatchlistResponse({this.success = false, this.message = '', this.data});
  factory _WatchlistResponse.fromJson(Map<String, dynamic> json) => _$WatchlistResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  WatchlistData? data;

/// Create a copy of WatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistResponseCopyWith<_WatchlistResponse> get copyWith => __$WatchlistResponseCopyWithImpl<_WatchlistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchlistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'WatchlistResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$WatchlistResponseCopyWith<$Res> implements $WatchlistResponseCopyWith<$Res> {
  factory _$WatchlistResponseCopyWith(_WatchlistResponse value, $Res Function(_WatchlistResponse) _then) = __$WatchlistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, WatchlistData? data
});


@override $WatchlistDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$WatchlistResponseCopyWithImpl<$Res>
    implements _$WatchlistResponseCopyWith<$Res> {
  __$WatchlistResponseCopyWithImpl(this._self, this._then);

  final _WatchlistResponse _self;
  final $Res Function(_WatchlistResponse) _then;

/// Create a copy of WatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_WatchlistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as WatchlistData?,
  ));
}

/// Create a copy of WatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchlistDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $WatchlistDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AddWatchlistRequest {

 String get athleteId; String? get notes;
/// Create a copy of AddWatchlistRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddWatchlistRequestCopyWith<AddWatchlistRequest> get copyWith => _$AddWatchlistRequestCopyWithImpl<AddWatchlistRequest>(this as AddWatchlistRequest, _$identity);

  /// Serializes this AddWatchlistRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddWatchlistRequest&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athleteId,notes);

@override
String toString() {
  return 'AddWatchlistRequest(athleteId: $athleteId, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AddWatchlistRequestCopyWith<$Res>  {
  factory $AddWatchlistRequestCopyWith(AddWatchlistRequest value, $Res Function(AddWatchlistRequest) _then) = _$AddWatchlistRequestCopyWithImpl;
@useResult
$Res call({
 String athleteId, String? notes
});




}
/// @nodoc
class _$AddWatchlistRequestCopyWithImpl<$Res>
    implements $AddWatchlistRequestCopyWith<$Res> {
  _$AddWatchlistRequestCopyWithImpl(this._self, this._then);

  final AddWatchlistRequest _self;
  final $Res Function(AddWatchlistRequest) _then;

/// Create a copy of AddWatchlistRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athleteId = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddWatchlistRequest].
extension AddWatchlistRequestPatterns on AddWatchlistRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddWatchlistRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddWatchlistRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddWatchlistRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddWatchlistRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddWatchlistRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddWatchlistRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String athleteId,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddWatchlistRequest() when $default != null:
return $default(_that.athleteId,_that.notes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String athleteId,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AddWatchlistRequest():
return $default(_that.athleteId,_that.notes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String athleteId,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AddWatchlistRequest() when $default != null:
return $default(_that.athleteId,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddWatchlistRequest implements AddWatchlistRequest {
  const _AddWatchlistRequest({required this.athleteId, this.notes});
  factory _AddWatchlistRequest.fromJson(Map<String, dynamic> json) => _$AddWatchlistRequestFromJson(json);

@override final  String athleteId;
@override final  String? notes;

/// Create a copy of AddWatchlistRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddWatchlistRequestCopyWith<_AddWatchlistRequest> get copyWith => __$AddWatchlistRequestCopyWithImpl<_AddWatchlistRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddWatchlistRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddWatchlistRequest&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athleteId,notes);

@override
String toString() {
  return 'AddWatchlistRequest(athleteId: $athleteId, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AddWatchlistRequestCopyWith<$Res> implements $AddWatchlistRequestCopyWith<$Res> {
  factory _$AddWatchlistRequestCopyWith(_AddWatchlistRequest value, $Res Function(_AddWatchlistRequest) _then) = __$AddWatchlistRequestCopyWithImpl;
@override @useResult
$Res call({
 String athleteId, String? notes
});




}
/// @nodoc
class __$AddWatchlistRequestCopyWithImpl<$Res>
    implements _$AddWatchlistRequestCopyWith<$Res> {
  __$AddWatchlistRequestCopyWithImpl(this._self, this._then);

  final _AddWatchlistRequest _self;
  final $Res Function(_AddWatchlistRequest) _then;

/// Create a copy of AddWatchlistRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athleteId = null,Object? notes = freezed,}) {
  return _then(_AddWatchlistRequest(
athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AddWatchlistResponse {

 bool get success; String get message; WatchlistItem? get watchlistEntry;
/// Create a copy of AddWatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddWatchlistResponseCopyWith<AddWatchlistResponse> get copyWith => _$AddWatchlistResponseCopyWithImpl<AddWatchlistResponse>(this as AddWatchlistResponse, _$identity);

  /// Serializes this AddWatchlistResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddWatchlistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.watchlistEntry, watchlistEntry) || other.watchlistEntry == watchlistEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,watchlistEntry);

@override
String toString() {
  return 'AddWatchlistResponse(success: $success, message: $message, watchlistEntry: $watchlistEntry)';
}


}

/// @nodoc
abstract mixin class $AddWatchlistResponseCopyWith<$Res>  {
  factory $AddWatchlistResponseCopyWith(AddWatchlistResponse value, $Res Function(AddWatchlistResponse) _then) = _$AddWatchlistResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, WatchlistItem? watchlistEntry
});


$WatchlistItemCopyWith<$Res>? get watchlistEntry;

}
/// @nodoc
class _$AddWatchlistResponseCopyWithImpl<$Res>
    implements $AddWatchlistResponseCopyWith<$Res> {
  _$AddWatchlistResponseCopyWithImpl(this._self, this._then);

  final AddWatchlistResponse _self;
  final $Res Function(AddWatchlistResponse) _then;

/// Create a copy of AddWatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? watchlistEntry = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,watchlistEntry: freezed == watchlistEntry ? _self.watchlistEntry : watchlistEntry // ignore: cast_nullable_to_non_nullable
as WatchlistItem?,
  ));
}
/// Create a copy of AddWatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchlistItemCopyWith<$Res>? get watchlistEntry {
    if (_self.watchlistEntry == null) {
    return null;
  }

  return $WatchlistItemCopyWith<$Res>(_self.watchlistEntry!, (value) {
    return _then(_self.copyWith(watchlistEntry: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddWatchlistResponse].
extension AddWatchlistResponsePatterns on AddWatchlistResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddWatchlistResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddWatchlistResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddWatchlistResponse value)  $default,){
final _that = this;
switch (_that) {
case _AddWatchlistResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddWatchlistResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AddWatchlistResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  WatchlistItem? watchlistEntry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddWatchlistResponse() when $default != null:
return $default(_that.success,_that.message,_that.watchlistEntry);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  WatchlistItem? watchlistEntry)  $default,) {final _that = this;
switch (_that) {
case _AddWatchlistResponse():
return $default(_that.success,_that.message,_that.watchlistEntry);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  WatchlistItem? watchlistEntry)?  $default,) {final _that = this;
switch (_that) {
case _AddWatchlistResponse() when $default != null:
return $default(_that.success,_that.message,_that.watchlistEntry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddWatchlistResponse implements AddWatchlistResponse {
  const _AddWatchlistResponse({this.success = false, this.message = '', this.watchlistEntry});
  factory _AddWatchlistResponse.fromJson(Map<String, dynamic> json) => _$AddWatchlistResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  WatchlistItem? watchlistEntry;

/// Create a copy of AddWatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddWatchlistResponseCopyWith<_AddWatchlistResponse> get copyWith => __$AddWatchlistResponseCopyWithImpl<_AddWatchlistResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddWatchlistResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddWatchlistResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.watchlistEntry, watchlistEntry) || other.watchlistEntry == watchlistEntry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,watchlistEntry);

@override
String toString() {
  return 'AddWatchlistResponse(success: $success, message: $message, watchlistEntry: $watchlistEntry)';
}


}

/// @nodoc
abstract mixin class _$AddWatchlistResponseCopyWith<$Res> implements $AddWatchlistResponseCopyWith<$Res> {
  factory _$AddWatchlistResponseCopyWith(_AddWatchlistResponse value, $Res Function(_AddWatchlistResponse) _then) = __$AddWatchlistResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, WatchlistItem? watchlistEntry
});


@override $WatchlistItemCopyWith<$Res>? get watchlistEntry;

}
/// @nodoc
class __$AddWatchlistResponseCopyWithImpl<$Res>
    implements _$AddWatchlistResponseCopyWith<$Res> {
  __$AddWatchlistResponseCopyWithImpl(this._self, this._then);

  final _AddWatchlistResponse _self;
  final $Res Function(_AddWatchlistResponse) _then;

/// Create a copy of AddWatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? watchlistEntry = freezed,}) {
  return _then(_AddWatchlistResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,watchlistEntry: freezed == watchlistEntry ? _self.watchlistEntry : watchlistEntry // ignore: cast_nullable_to_non_nullable
as WatchlistItem?,
  ));
}

/// Create a copy of AddWatchlistResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchlistItemCopyWith<$Res>? get watchlistEntry {
    if (_self.watchlistEntry == null) {
    return null;
  }

  return $WatchlistItemCopyWith<$Res>(_self.watchlistEntry!, (value) {
    return _then(_self.copyWith(watchlistEntry: value));
  });
}
}

// dart format on
