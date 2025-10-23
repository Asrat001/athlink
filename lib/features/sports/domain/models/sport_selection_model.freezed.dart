// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sport_selection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SportSelectionRequest {

 List<String> get sportIds;
/// Create a copy of SportSelectionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportSelectionRequestCopyWith<SportSelectionRequest> get copyWith => _$SportSelectionRequestCopyWithImpl<SportSelectionRequest>(this as SportSelectionRequest, _$identity);

  /// Serializes this SportSelectionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportSelectionRequest&&const DeepCollectionEquality().equals(other.sportIds, sportIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sportIds));

@override
String toString() {
  return 'SportSelectionRequest(sportIds: $sportIds)';
}


}

/// @nodoc
abstract mixin class $SportSelectionRequestCopyWith<$Res>  {
  factory $SportSelectionRequestCopyWith(SportSelectionRequest value, $Res Function(SportSelectionRequest) _then) = _$SportSelectionRequestCopyWithImpl;
@useResult
$Res call({
 List<String> sportIds
});




}
/// @nodoc
class _$SportSelectionRequestCopyWithImpl<$Res>
    implements $SportSelectionRequestCopyWith<$Res> {
  _$SportSelectionRequestCopyWithImpl(this._self, this._then);

  final SportSelectionRequest _self;
  final $Res Function(SportSelectionRequest) _then;

/// Create a copy of SportSelectionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sportIds = null,}) {
  return _then(_self.copyWith(
sportIds: null == sportIds ? _self.sportIds : sportIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SportSelectionRequest].
extension SportSelectionRequestPatterns on SportSelectionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportSelectionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportSelectionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportSelectionRequest value)  $default,){
final _that = this;
switch (_that) {
case _SportSelectionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportSelectionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SportSelectionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> sportIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportSelectionRequest() when $default != null:
return $default(_that.sportIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> sportIds)  $default,) {final _that = this;
switch (_that) {
case _SportSelectionRequest():
return $default(_that.sportIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> sportIds)?  $default,) {final _that = this;
switch (_that) {
case _SportSelectionRequest() when $default != null:
return $default(_that.sportIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportSelectionRequest implements SportSelectionRequest {
  const _SportSelectionRequest({required final  List<String> sportIds}): _sportIds = sportIds;
  factory _SportSelectionRequest.fromJson(Map<String, dynamic> json) => _$SportSelectionRequestFromJson(json);

 final  List<String> _sportIds;
@override List<String> get sportIds {
  if (_sportIds is EqualUnmodifiableListView) return _sportIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sportIds);
}


/// Create a copy of SportSelectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportSelectionRequestCopyWith<_SportSelectionRequest> get copyWith => __$SportSelectionRequestCopyWithImpl<_SportSelectionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportSelectionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportSelectionRequest&&const DeepCollectionEquality().equals(other._sportIds, _sportIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sportIds));

@override
String toString() {
  return 'SportSelectionRequest(sportIds: $sportIds)';
}


}

/// @nodoc
abstract mixin class _$SportSelectionRequestCopyWith<$Res> implements $SportSelectionRequestCopyWith<$Res> {
  factory _$SportSelectionRequestCopyWith(_SportSelectionRequest value, $Res Function(_SportSelectionRequest) _then) = __$SportSelectionRequestCopyWithImpl;
@override @useResult
$Res call({
 List<String> sportIds
});




}
/// @nodoc
class __$SportSelectionRequestCopyWithImpl<$Res>
    implements _$SportSelectionRequestCopyWith<$Res> {
  __$SportSelectionRequestCopyWithImpl(this._self, this._then);

  final _SportSelectionRequest _self;
  final $Res Function(_SportSelectionRequest) _then;

/// Create a copy of SportSelectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sportIds = null,}) {
  return _then(_SportSelectionRequest(
sportIds: null == sportIds ? _self._sportIds : sportIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SportSelectionResponse {

 String get message; bool get success;
/// Create a copy of SportSelectionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportSelectionResponseCopyWith<SportSelectionResponse> get copyWith => _$SportSelectionResponseCopyWithImpl<SportSelectionResponse>(this as SportSelectionResponse, _$identity);

  /// Serializes this SportSelectionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportSelectionResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'SportSelectionResponse(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class $SportSelectionResponseCopyWith<$Res>  {
  factory $SportSelectionResponseCopyWith(SportSelectionResponse value, $Res Function(SportSelectionResponse) _then) = _$SportSelectionResponseCopyWithImpl;
@useResult
$Res call({
 String message, bool success
});




}
/// @nodoc
class _$SportSelectionResponseCopyWithImpl<$Res>
    implements $SportSelectionResponseCopyWith<$Res> {
  _$SportSelectionResponseCopyWithImpl(this._self, this._then);

  final SportSelectionResponse _self;
  final $Res Function(SportSelectionResponse) _then;

/// Create a copy of SportSelectionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? success = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SportSelectionResponse].
extension SportSelectionResponsePatterns on SportSelectionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportSelectionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportSelectionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportSelectionResponse value)  $default,){
final _that = this;
switch (_that) {
case _SportSelectionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportSelectionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SportSelectionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportSelectionResponse() when $default != null:
return $default(_that.message,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  bool success)  $default,) {final _that = this;
switch (_that) {
case _SportSelectionResponse():
return $default(_that.message,_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  bool success)?  $default,) {final _that = this;
switch (_that) {
case _SportSelectionResponse() when $default != null:
return $default(_that.message,_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportSelectionResponse implements SportSelectionResponse {
  const _SportSelectionResponse({required this.message, required this.success});
  factory _SportSelectionResponse.fromJson(Map<String, dynamic> json) => _$SportSelectionResponseFromJson(json);

@override final  String message;
@override final  bool success;

/// Create a copy of SportSelectionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportSelectionResponseCopyWith<_SportSelectionResponse> get copyWith => __$SportSelectionResponseCopyWithImpl<_SportSelectionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportSelectionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportSelectionResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,success);

@override
String toString() {
  return 'SportSelectionResponse(message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class _$SportSelectionResponseCopyWith<$Res> implements $SportSelectionResponseCopyWith<$Res> {
  factory _$SportSelectionResponseCopyWith(_SportSelectionResponse value, $Res Function(_SportSelectionResponse) _then) = __$SportSelectionResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, bool success
});




}
/// @nodoc
class __$SportSelectionResponseCopyWithImpl<$Res>
    implements _$SportSelectionResponseCopyWith<$Res> {
  __$SportSelectionResponseCopyWithImpl(this._self, this._then);

  final _SportSelectionResponse _self;
  final $Res Function(_SportSelectionResponse) _then;

/// Create a copy of SportSelectionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? success = null,}) {
  return _then(_SportSelectionResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
