// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedState()';
}


}

/// @nodoc
class $FeedStateCopyWith<$Res>  {
$FeedStateCopyWith(FeedState _, $Res Function(FeedState) __);
}


/// Adds pattern-matching-related methods to [FeedState].
extension FeedStatePatterns on FeedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FeedStateLoading value)?  loading,TResult Function( _FeedStateSuccess value)?  success,TResult Function( _FeedStateError value)?  error,TResult Function( Initial value)?  initial,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedStateLoading() when loading != null:
return loading(_that);case _FeedStateSuccess() when success != null:
return success(_that);case _FeedStateError() when error != null:
return error(_that);case Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FeedStateLoading value)  loading,required TResult Function( _FeedStateSuccess value)  success,required TResult Function( _FeedStateError value)  error,required TResult Function( Initial value)  initial,}){
final _that = this;
switch (_that) {
case _FeedStateLoading():
return loading(_that);case _FeedStateSuccess():
return success(_that);case _FeedStateError():
return error(_that);case Initial():
return initial(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FeedStateLoading value)?  loading,TResult? Function( _FeedStateSuccess value)?  success,TResult? Function( _FeedStateError value)?  error,TResult? Function( Initial value)?  initial,}){
final _that = this;
switch (_that) {
case _FeedStateLoading() when loading != null:
return loading(_that);case _FeedStateSuccess() when success != null:
return success(_that);case _FeedStateError() when error != null:
return error(_that);case Initial() when initial != null:
return initial(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( FeedData feedData,  Map<String, List<Athlete>> athletesBySport)?  success,TResult Function( String errorMessage)?  error,TResult Function()?  initial,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedStateLoading() when loading != null:
return loading();case _FeedStateSuccess() when success != null:
return success(_that.feedData,_that.athletesBySport);case _FeedStateError() when error != null:
return error(_that.errorMessage);case Initial() when initial != null:
return initial();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( FeedData feedData,  Map<String, List<Athlete>> athletesBySport)  success,required TResult Function( String errorMessage)  error,required TResult Function()  initial,}) {final _that = this;
switch (_that) {
case _FeedStateLoading():
return loading();case _FeedStateSuccess():
return success(_that.feedData,_that.athletesBySport);case _FeedStateError():
return error(_that.errorMessage);case Initial():
return initial();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( FeedData feedData,  Map<String, List<Athlete>> athletesBySport)?  success,TResult? Function( String errorMessage)?  error,TResult? Function()?  initial,}) {final _that = this;
switch (_that) {
case _FeedStateLoading() when loading != null:
return loading();case _FeedStateSuccess() when success != null:
return success(_that.feedData,_that.athletesBySport);case _FeedStateError() when error != null:
return error(_that.errorMessage);case Initial() when initial != null:
return initial();case _:
  return null;

}
}

}

/// @nodoc


class _FeedStateLoading implements FeedState {
  const _FeedStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedState.loading()';
}


}




/// @nodoc


class _FeedStateSuccess implements FeedState {
  const _FeedStateSuccess({required this.feedData, required final  Map<String, List<Athlete>> athletesBySport}): _athletesBySport = athletesBySport;
  

 final  FeedData feedData;
 final  Map<String, List<Athlete>> _athletesBySport;
 Map<String, List<Athlete>> get athletesBySport {
  if (_athletesBySport is EqualUnmodifiableMapView) return _athletesBySport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_athletesBySport);
}


/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedStateSuccessCopyWith<_FeedStateSuccess> get copyWith => __$FeedStateSuccessCopyWithImpl<_FeedStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedStateSuccess&&(identical(other.feedData, feedData) || other.feedData == feedData)&&const DeepCollectionEquality().equals(other._athletesBySport, _athletesBySport));
}


@override
int get hashCode => Object.hash(runtimeType,feedData,const DeepCollectionEquality().hash(_athletesBySport));

@override
String toString() {
  return 'FeedState.success(feedData: $feedData, athletesBySport: $athletesBySport)';
}


}

/// @nodoc
abstract mixin class _$FeedStateSuccessCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$FeedStateSuccessCopyWith(_FeedStateSuccess value, $Res Function(_FeedStateSuccess) _then) = __$FeedStateSuccessCopyWithImpl;
@useResult
$Res call({
 FeedData feedData, Map<String, List<Athlete>> athletesBySport
});


$FeedDataCopyWith<$Res> get feedData;

}
/// @nodoc
class __$FeedStateSuccessCopyWithImpl<$Res>
    implements _$FeedStateSuccessCopyWith<$Res> {
  __$FeedStateSuccessCopyWithImpl(this._self, this._then);

  final _FeedStateSuccess _self;
  final $Res Function(_FeedStateSuccess) _then;

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? feedData = null,Object? athletesBySport = null,}) {
  return _then(_FeedStateSuccess(
feedData: null == feedData ? _self.feedData : feedData // ignore: cast_nullable_to_non_nullable
as FeedData,athletesBySport: null == athletesBySport ? _self._athletesBySport : athletesBySport // ignore: cast_nullable_to_non_nullable
as Map<String, List<Athlete>>,
  ));
}

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedDataCopyWith<$Res> get feedData {
  
  return $FeedDataCopyWith<$Res>(_self.feedData, (value) {
    return _then(_self.copyWith(feedData: value));
  });
}
}

/// @nodoc


class _FeedStateError implements FeedState {
  const _FeedStateError({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedStateErrorCopyWith<_FeedStateError> get copyWith => __$FeedStateErrorCopyWithImpl<_FeedStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedStateError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'FeedState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$FeedStateErrorCopyWith<$Res> implements $FeedStateCopyWith<$Res> {
  factory _$FeedStateErrorCopyWith(_FeedStateError value, $Res Function(_FeedStateError) _then) = __$FeedStateErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class __$FeedStateErrorCopyWithImpl<$Res>
    implements _$FeedStateErrorCopyWith<$Res> {
  __$FeedStateErrorCopyWithImpl(this._self, this._then);

  final _FeedStateError _self;
  final $Res Function(_FeedStateError) _then;

/// Create a copy of FeedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(_FeedStateError(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class Initial implements FeedState {
   Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FeedState.initial()';
}


}




// dart format on
