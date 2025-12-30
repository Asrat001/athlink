// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationResponse {

 String get message; User get user;// Now you can use User
 String get accessToken; String get refreshToken;
/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationResponseCopyWith<VerificationResponse> get copyWith => _$VerificationResponseCopyWithImpl<VerificationResponse>(this as VerificationResponse, _$identity);

  /// Serializes this VerificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,user,accessToken,refreshToken);

@override
String toString() {
  return 'VerificationResponse(message: $message, user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class $VerificationResponseCopyWith<$Res>  {
  factory $VerificationResponseCopyWith(VerificationResponse value, $Res Function(VerificationResponse) _then) = _$VerificationResponseCopyWithImpl;
@useResult
$Res call({
 String message, User user, String accessToken, String refreshToken
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$VerificationResponseCopyWithImpl<$Res>
    implements $VerificationResponseCopyWith<$Res> {
  _$VerificationResponseCopyWithImpl(this._self, this._then);

  final VerificationResponse _self;
  final $Res Function(VerificationResponse) _then;

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? user = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerificationResponse].
extension VerificationResponsePatterns on VerificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerificationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  User user,  String accessToken,  String refreshToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
return $default(_that.message,_that.user,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  User user,  String accessToken,  String refreshToken)  $default,) {final _that = this;
switch (_that) {
case _VerificationResponse():
return $default(_that.message,_that.user,_that.accessToken,_that.refreshToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  User user,  String accessToken,  String refreshToken)?  $default,) {final _that = this;
switch (_that) {
case _VerificationResponse() when $default != null:
return $default(_that.message,_that.user,_that.accessToken,_that.refreshToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationResponse implements VerificationResponse {
  const _VerificationResponse({required this.message, required this.user, required this.accessToken, required this.refreshToken});
  factory _VerificationResponse.fromJson(Map<String, dynamic> json) => _$VerificationResponseFromJson(json);

@override final  String message;
@override final  User user;
// Now you can use User
@override final  String accessToken;
@override final  String refreshToken;

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationResponseCopyWith<_VerificationResponse> get copyWith => __$VerificationResponseCopyWithImpl<_VerificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,user,accessToken,refreshToken);

@override
String toString() {
  return 'VerificationResponse(message: $message, user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
}


}

/// @nodoc
abstract mixin class _$VerificationResponseCopyWith<$Res> implements $VerificationResponseCopyWith<$Res> {
  factory _$VerificationResponseCopyWith(_VerificationResponse value, $Res Function(_VerificationResponse) _then) = __$VerificationResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, User user, String accessToken, String refreshToken
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$VerificationResponseCopyWithImpl<$Res>
    implements _$VerificationResponseCopyWith<$Res> {
  __$VerificationResponseCopyWithImpl(this._self, this._then);

  final _VerificationResponse _self;
  final $Res Function(_VerificationResponse) _then;

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? user = null,Object? accessToken = null,Object? refreshToken = null,}) {
  return _then(_VerificationResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of VerificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
