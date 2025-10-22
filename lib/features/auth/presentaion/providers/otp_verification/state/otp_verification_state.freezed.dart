// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OtpVerificationState {

 bool get isLoading; bool get isSuccess; bool get isResending; String? get errorMessage; String? get email; String? get purpose; int get resendCooldown;
/// Create a copy of OtpVerificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpVerificationStateCopyWith<OtpVerificationState> get copyWith => _$OtpVerificationStateCopyWithImpl<OtpVerificationState>(this as OtpVerificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpVerificationState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.email, email) || other.email == email)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.resendCooldown, resendCooldown) || other.resendCooldown == resendCooldown));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,isResending,errorMessage,email,purpose,resendCooldown);

@override
String toString() {
  return 'OtpVerificationState(isLoading: $isLoading, isSuccess: $isSuccess, isResending: $isResending, errorMessage: $errorMessage, email: $email, purpose: $purpose, resendCooldown: $resendCooldown)';
}


}

/// @nodoc
abstract mixin class $OtpVerificationStateCopyWith<$Res>  {
  factory $OtpVerificationStateCopyWith(OtpVerificationState value, $Res Function(OtpVerificationState) _then) = _$OtpVerificationStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, bool isResending, String? errorMessage, String? email, String? purpose, int resendCooldown
});




}
/// @nodoc
class _$OtpVerificationStateCopyWithImpl<$Res>
    implements $OtpVerificationStateCopyWith<$Res> {
  _$OtpVerificationStateCopyWithImpl(this._self, this._then);

  final OtpVerificationState _self;
  final $Res Function(OtpVerificationState) _then;

/// Create a copy of OtpVerificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? isResending = null,Object? errorMessage = freezed,Object? email = freezed,Object? purpose = freezed,Object? resendCooldown = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,resendCooldown: null == resendCooldown ? _self.resendCooldown : resendCooldown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpVerificationState].
extension OtpVerificationStatePatterns on OtpVerificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpVerificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpVerificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpVerificationState value)  $default,){
final _that = this;
switch (_that) {
case _OtpVerificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpVerificationState value)?  $default,){
final _that = this;
switch (_that) {
case _OtpVerificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  bool isResending,  String? errorMessage,  String? email,  String? purpose,  int resendCooldown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpVerificationState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.isResending,_that.errorMessage,_that.email,_that.purpose,_that.resendCooldown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  bool isResending,  String? errorMessage,  String? email,  String? purpose,  int resendCooldown)  $default,) {final _that = this;
switch (_that) {
case _OtpVerificationState():
return $default(_that.isLoading,_that.isSuccess,_that.isResending,_that.errorMessage,_that.email,_that.purpose,_that.resendCooldown);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  bool isResending,  String? errorMessage,  String? email,  String? purpose,  int resendCooldown)?  $default,) {final _that = this;
switch (_that) {
case _OtpVerificationState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.isResending,_that.errorMessage,_that.email,_that.purpose,_that.resendCooldown);case _:
  return null;

}
}

}

/// @nodoc


class _OtpVerificationState implements OtpVerificationState {
  const _OtpVerificationState({this.isLoading = false, this.isSuccess = false, this.isResending = false, this.errorMessage, this.email, this.purpose, this.resendCooldown = 0});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isResending;
@override final  String? errorMessage;
@override final  String? email;
@override final  String? purpose;
@override@JsonKey() final  int resendCooldown;

/// Create a copy of OtpVerificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpVerificationStateCopyWith<_OtpVerificationState> get copyWith => __$OtpVerificationStateCopyWithImpl<_OtpVerificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpVerificationState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.email, email) || other.email == email)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.resendCooldown, resendCooldown) || other.resendCooldown == resendCooldown));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,isResending,errorMessage,email,purpose,resendCooldown);

@override
String toString() {
  return 'OtpVerificationState(isLoading: $isLoading, isSuccess: $isSuccess, isResending: $isResending, errorMessage: $errorMessage, email: $email, purpose: $purpose, resendCooldown: $resendCooldown)';
}


}

/// @nodoc
abstract mixin class _$OtpVerificationStateCopyWith<$Res> implements $OtpVerificationStateCopyWith<$Res> {
  factory _$OtpVerificationStateCopyWith(_OtpVerificationState value, $Res Function(_OtpVerificationState) _then) = __$OtpVerificationStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, bool isResending, String? errorMessage, String? email, String? purpose, int resendCooldown
});




}
/// @nodoc
class __$OtpVerificationStateCopyWithImpl<$Res>
    implements _$OtpVerificationStateCopyWith<$Res> {
  __$OtpVerificationStateCopyWithImpl(this._self, this._then);

  final _OtpVerificationState _self;
  final $Res Function(_OtpVerificationState) _then;

/// Create a copy of OtpVerificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? isResending = null,Object? errorMessage = freezed,Object? email = freezed,Object? purpose = freezed,Object? resendCooldown = null,}) {
  return _then(_OtpVerificationState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as String?,resendCooldown: null == resendCooldown ? _self.resendCooldown : resendCooldown // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
