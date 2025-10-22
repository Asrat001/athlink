// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SportsState {

 bool get isLoading; bool get isSuccess; List<Sport> get sports; String? get errorMessage;
/// Create a copy of SportsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportsStateCopyWith<SportsState> get copyWith => _$SportsStateCopyWithImpl<SportsState>(this as SportsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other.sports, sports)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,const DeepCollectionEquality().hash(sports),errorMessage);

@override
String toString() {
  return 'SportsState(isLoading: $isLoading, isSuccess: $isSuccess, sports: $sports, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SportsStateCopyWith<$Res>  {
  factory $SportsStateCopyWith(SportsState value, $Res Function(SportsState) _then) = _$SportsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, List<Sport> sports, String? errorMessage
});




}
/// @nodoc
class _$SportsStateCopyWithImpl<$Res>
    implements $SportsStateCopyWith<$Res> {
  _$SportsStateCopyWithImpl(this._self, this._then);

  final SportsState _self;
  final $Res Function(SportsState) _then;

/// Create a copy of SportsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? sports = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,sports: null == sports ? _self.sports : sports // ignore: cast_nullable_to_non_nullable
as List<Sport>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SportsState].
extension SportsStatePatterns on SportsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportsState value)  $default,){
final _that = this;
switch (_that) {
case _SportsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportsState value)?  $default,){
final _that = this;
switch (_that) {
case _SportsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  List<Sport> sports,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportsState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.sports,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  List<Sport> sports,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SportsState():
return $default(_that.isLoading,_that.isSuccess,_that.sports,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  List<Sport> sports,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SportsState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.sports,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SportsState implements SportsState {
  const _SportsState({this.isLoading = false, this.isSuccess = false, final  List<Sport> sports = const [], this.errorMessage}): _sports = sports;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
 final  List<Sport> _sports;
@override@JsonKey() List<Sport> get sports {
  if (_sports is EqualUnmodifiableListView) return _sports;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sports);
}

@override final  String? errorMessage;

/// Create a copy of SportsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportsStateCopyWith<_SportsState> get copyWith => __$SportsStateCopyWithImpl<_SportsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&const DeepCollectionEquality().equals(other._sports, _sports)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,const DeepCollectionEquality().hash(_sports),errorMessage);

@override
String toString() {
  return 'SportsState(isLoading: $isLoading, isSuccess: $isSuccess, sports: $sports, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SportsStateCopyWith<$Res> implements $SportsStateCopyWith<$Res> {
  factory _$SportsStateCopyWith(_SportsState value, $Res Function(_SportsState) _then) = __$SportsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, List<Sport> sports, String? errorMessage
});




}
/// @nodoc
class __$SportsStateCopyWithImpl<$Res>
    implements _$SportsStateCopyWith<$Res> {
  __$SportsStateCopyWithImpl(this._self, this._then);

  final _SportsState _self;
  final $Res Function(_SportsState) _then;

/// Create a copy of SportsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? sports = null,Object? errorMessage = freezed,}) {
  return _then(_SportsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,sports: null == sports ? _self._sports : sports // ignore: cast_nullable_to_non_nullable
as List<Sport>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
