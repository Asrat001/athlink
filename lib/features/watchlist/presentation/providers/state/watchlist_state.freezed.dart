// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WatchlistState {

 bool get isLoading; bool get isSuccess; WatchlistData? get watchlistData; String? get errorMessage;
/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchlistStateCopyWith<WatchlistState> get copyWith => _$WatchlistStateCopyWithImpl<WatchlistState>(this as WatchlistState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchlistState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.watchlistData, watchlistData) || other.watchlistData == watchlistData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,watchlistData,errorMessage);

@override
String toString() {
  return 'WatchlistState(isLoading: $isLoading, isSuccess: $isSuccess, watchlistData: $watchlistData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $WatchlistStateCopyWith<$Res>  {
  factory $WatchlistStateCopyWith(WatchlistState value, $Res Function(WatchlistState) _then) = _$WatchlistStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, WatchlistData? watchlistData, String? errorMessage
});


$WatchlistDataCopyWith<$Res>? get watchlistData;

}
/// @nodoc
class _$WatchlistStateCopyWithImpl<$Res>
    implements $WatchlistStateCopyWith<$Res> {
  _$WatchlistStateCopyWithImpl(this._self, this._then);

  final WatchlistState _self;
  final $Res Function(WatchlistState) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? watchlistData = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,watchlistData: freezed == watchlistData ? _self.watchlistData : watchlistData // ignore: cast_nullable_to_non_nullable
as WatchlistData?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchlistDataCopyWith<$Res>? get watchlistData {
    if (_self.watchlistData == null) {
    return null;
  }

  return $WatchlistDataCopyWith<$Res>(_self.watchlistData!, (value) {
    return _then(_self.copyWith(watchlistData: value));
  });
}
}


/// Adds pattern-matching-related methods to [WatchlistState].
extension WatchlistStatePatterns on WatchlistState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchlistState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchlistState value)  $default,){
final _that = this;
switch (_that) {
case _WatchlistState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchlistState value)?  $default,){
final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  WatchlistData? watchlistData,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.watchlistData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  WatchlistData? watchlistData,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _WatchlistState():
return $default(_that.isLoading,_that.isSuccess,_that.watchlistData,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  WatchlistData? watchlistData,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _WatchlistState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.watchlistData,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WatchlistState implements WatchlistState {
  const _WatchlistState({this.isLoading = false, this.isSuccess = false, this.watchlistData, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override final  WatchlistData? watchlistData;
@override final  String? errorMessage;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchlistStateCopyWith<_WatchlistState> get copyWith => __$WatchlistStateCopyWithImpl<_WatchlistState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchlistState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.watchlistData, watchlistData) || other.watchlistData == watchlistData)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,watchlistData,errorMessage);

@override
String toString() {
  return 'WatchlistState(isLoading: $isLoading, isSuccess: $isSuccess, watchlistData: $watchlistData, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$WatchlistStateCopyWith<$Res> implements $WatchlistStateCopyWith<$Res> {
  factory _$WatchlistStateCopyWith(_WatchlistState value, $Res Function(_WatchlistState) _then) = __$WatchlistStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, WatchlistData? watchlistData, String? errorMessage
});


@override $WatchlistDataCopyWith<$Res>? get watchlistData;

}
/// @nodoc
class __$WatchlistStateCopyWithImpl<$Res>
    implements _$WatchlistStateCopyWith<$Res> {
  __$WatchlistStateCopyWithImpl(this._self, this._then);

  final _WatchlistState _self;
  final $Res Function(_WatchlistState) _then;

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? watchlistData = freezed,Object? errorMessage = freezed,}) {
  return _then(_WatchlistState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,watchlistData: freezed == watchlistData ? _self.watchlistData : watchlistData // ignore: cast_nullable_to_non_nullable
as WatchlistData?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WatchlistState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WatchlistDataCopyWith<$Res>? get watchlistData {
    if (_self.watchlistData == null) {
    return null;
  }

  return $WatchlistDataCopyWith<$Res>(_self.watchlistData!, (value) {
    return _then(_self.copyWith(watchlistData: value));
  });
}
}

// dart format on
