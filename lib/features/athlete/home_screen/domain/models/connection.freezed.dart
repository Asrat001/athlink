// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Connection {

@JsonKey(name: '_id') String get id; String get requester; String get recipient; String get status;// pending, accepted, rejected
 DateTime get requestedAt; DateTime? get respondedAt; AthleteProfile? get requesterProfile; AthleteProfile? get recipientProfile;
/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionCopyWith<Connection> get copyWith => _$ConnectionCopyWithImpl<Connection>(this as Connection, _$identity);

  /// Serializes this Connection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Connection&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.requesterProfile, requesterProfile) || other.requesterProfile == requesterProfile)&&(identical(other.recipientProfile, recipientProfile) || other.recipientProfile == recipientProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt,respondedAt,requesterProfile,recipientProfile);

@override
String toString() {
  return 'Connection(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt, respondedAt: $respondedAt, requesterProfile: $requesterProfile, recipientProfile: $recipientProfile)';
}


}

/// @nodoc
abstract mixin class $ConnectionCopyWith<$Res>  {
  factory $ConnectionCopyWith(Connection value, $Res Function(Connection) _then) = _$ConnectionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String requester, String recipient, String status, DateTime requestedAt, DateTime? respondedAt, AthleteProfile? requesterProfile, AthleteProfile? recipientProfile
});


$AthleteProfileCopyWith<$Res>? get requesterProfile;$AthleteProfileCopyWith<$Res>? get recipientProfile;

}
/// @nodoc
class _$ConnectionCopyWithImpl<$Res>
    implements $ConnectionCopyWith<$Res> {
  _$ConnectionCopyWithImpl(this._self, this._then);

  final Connection _self;
  final $Res Function(Connection) _then;

/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requester = null,Object? recipient = null,Object? status = null,Object? requestedAt = null,Object? respondedAt = freezed,Object? requesterProfile = freezed,Object? recipientProfile = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,requesterProfile: freezed == requesterProfile ? _self.requesterProfile : requesterProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,recipientProfile: freezed == recipientProfile ? _self.recipientProfile : recipientProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,
  ));
}
/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get requesterProfile {
    if (_self.requesterProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.requesterProfile!, (value) {
    return _then(_self.copyWith(requesterProfile: value));
  });
}/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get recipientProfile {
    if (_self.recipientProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.recipientProfile!, (value) {
    return _then(_self.copyWith(recipientProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [Connection].
extension ConnectionPatterns on Connection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Connection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Connection value)  $default,){
final _that = this;
switch (_that) {
case _Connection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Connection value)?  $default,){
final _that = this;
switch (_that) {
case _Connection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String requester,  String recipient,  String status,  DateTime requestedAt,  DateTime? respondedAt,  AthleteProfile? requesterProfile,  AthleteProfile? recipientProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connection() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.respondedAt,_that.requesterProfile,_that.recipientProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String requester,  String recipient,  String status,  DateTime requestedAt,  DateTime? respondedAt,  AthleteProfile? requesterProfile,  AthleteProfile? recipientProfile)  $default,) {final _that = this;
switch (_that) {
case _Connection():
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.respondedAt,_that.requesterProfile,_that.recipientProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String requester,  String recipient,  String status,  DateTime requestedAt,  DateTime? respondedAt,  AthleteProfile? requesterProfile,  AthleteProfile? recipientProfile)?  $default,) {final _that = this;
switch (_that) {
case _Connection() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.respondedAt,_that.requesterProfile,_that.recipientProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Connection implements Connection {
  const _Connection({@JsonKey(name: '_id') required this.id, required this.requester, required this.recipient, required this.status, required this.requestedAt, this.respondedAt, this.requesterProfile, this.recipientProfile});
  factory _Connection.fromJson(Map<String, dynamic> json) => _$ConnectionFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String requester;
@override final  String recipient;
@override final  String status;
// pending, accepted, rejected
@override final  DateTime requestedAt;
@override final  DateTime? respondedAt;
@override final  AthleteProfile? requesterProfile;
@override final  AthleteProfile? recipientProfile;

/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionCopyWith<_Connection> get copyWith => __$ConnectionCopyWithImpl<_Connection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connection&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt)&&(identical(other.requesterProfile, requesterProfile) || other.requesterProfile == requesterProfile)&&(identical(other.recipientProfile, recipientProfile) || other.recipientProfile == recipientProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt,respondedAt,requesterProfile,recipientProfile);

@override
String toString() {
  return 'Connection(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt, respondedAt: $respondedAt, requesterProfile: $requesterProfile, recipientProfile: $recipientProfile)';
}


}

/// @nodoc
abstract mixin class _$ConnectionCopyWith<$Res> implements $ConnectionCopyWith<$Res> {
  factory _$ConnectionCopyWith(_Connection value, $Res Function(_Connection) _then) = __$ConnectionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String requester, String recipient, String status, DateTime requestedAt, DateTime? respondedAt, AthleteProfile? requesterProfile, AthleteProfile? recipientProfile
});


@override $AthleteProfileCopyWith<$Res>? get requesterProfile;@override $AthleteProfileCopyWith<$Res>? get recipientProfile;

}
/// @nodoc
class __$ConnectionCopyWithImpl<$Res>
    implements _$ConnectionCopyWith<$Res> {
  __$ConnectionCopyWithImpl(this._self, this._then);

  final _Connection _self;
  final $Res Function(_Connection) _then;

/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requester = null,Object? recipient = null,Object? status = null,Object? requestedAt = null,Object? respondedAt = freezed,Object? requesterProfile = freezed,Object? recipientProfile = freezed,}) {
  return _then(_Connection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,requesterProfile: freezed == requesterProfile ? _self.requesterProfile : requesterProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,recipientProfile: freezed == recipientProfile ? _self.recipientProfile : recipientProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,
  ));
}

/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get requesterProfile {
    if (_self.requesterProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.requesterProfile!, (value) {
    return _then(_self.copyWith(requesterProfile: value));
  });
}/// Create a copy of Connection
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get recipientProfile {
    if (_self.recipientProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.recipientProfile!, (value) {
    return _then(_self.copyWith(recipientProfile: value));
  });
}
}


/// @nodoc
mixin _$ConnectionRequest {

@JsonKey(name: '_id') String get id; AthleteProfile get requester; String get status; DateTime get requestedAt;
/// Create a copy of ConnectionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionRequestCopyWith<ConnectionRequest> get copyWith => _$ConnectionRequestCopyWithImpl<ConnectionRequest>(this as ConnectionRequest, _$identity);

  /// Serializes this ConnectionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,status,requestedAt);

@override
String toString() {
  return 'ConnectionRequest(id: $id, requester: $requester, status: $status, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $ConnectionRequestCopyWith<$Res>  {
  factory $ConnectionRequestCopyWith(ConnectionRequest value, $Res Function(ConnectionRequest) _then) = _$ConnectionRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, AthleteProfile requester, String status, DateTime requestedAt
});


$AthleteProfileCopyWith<$Res> get requester;

}
/// @nodoc
class _$ConnectionRequestCopyWithImpl<$Res>
    implements $ConnectionRequestCopyWith<$Res> {
  _$ConnectionRequestCopyWithImpl(this._self, this._then);

  final ConnectionRequest _self;
  final $Res Function(ConnectionRequest) _then;

/// Create a copy of ConnectionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requester = null,Object? status = null,Object? requestedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as AthleteProfile,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ConnectionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res> get requester {
  
  return $AthleteProfileCopyWith<$Res>(_self.requester, (value) {
    return _then(_self.copyWith(requester: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionRequest].
extension ConnectionRequestPatterns on ConnectionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  AthleteProfile requester,  String status,  DateTime requestedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionRequest() when $default != null:
return $default(_that.id,_that.requester,_that.status,_that.requestedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  AthleteProfile requester,  String status,  DateTime requestedAt)  $default,) {final _that = this;
switch (_that) {
case _ConnectionRequest():
return $default(_that.id,_that.requester,_that.status,_that.requestedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  AthleteProfile requester,  String status,  DateTime requestedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionRequest() when $default != null:
return $default(_that.id,_that.requester,_that.status,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionRequest implements ConnectionRequest {
  const _ConnectionRequest({@JsonKey(name: '_id') required this.id, required this.requester, required this.status, required this.requestedAt});
  factory _ConnectionRequest.fromJson(Map<String, dynamic> json) => _$ConnectionRequestFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  AthleteProfile requester;
@override final  String status;
@override final  DateTime requestedAt;

/// Create a copy of ConnectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionRequestCopyWith<_ConnectionRequest> get copyWith => __$ConnectionRequestCopyWithImpl<_ConnectionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,status,requestedAt);

@override
String toString() {
  return 'ConnectionRequest(id: $id, requester: $requester, status: $status, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$ConnectionRequestCopyWith<$Res> implements $ConnectionRequestCopyWith<$Res> {
  factory _$ConnectionRequestCopyWith(_ConnectionRequest value, $Res Function(_ConnectionRequest) _then) = __$ConnectionRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, AthleteProfile requester, String status, DateTime requestedAt
});


@override $AthleteProfileCopyWith<$Res> get requester;

}
/// @nodoc
class __$ConnectionRequestCopyWithImpl<$Res>
    implements _$ConnectionRequestCopyWith<$Res> {
  __$ConnectionRequestCopyWithImpl(this._self, this._then);

  final _ConnectionRequest _self;
  final $Res Function(_ConnectionRequest) _then;

/// Create a copy of ConnectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requester = null,Object? status = null,Object? requestedAt = null,}) {
  return _then(_ConnectionRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as AthleteProfile,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ConnectionRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res> get requester {
  
  return $AthleteProfileCopyWith<$Res>(_self.requester, (value) {
    return _then(_self.copyWith(requester: value));
  });
}
}


/// @nodoc
mixin _$FriendRequest {

@JsonKey(name: '_id') String get id; Requester? get requester; String get recipient; String get status; DateTime get requestedAt; DateTime get createdAt; DateTime get updatedAt;@JsonKey(name: '__v') int get version;
/// Create a copy of FriendRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRequestCopyWith<FriendRequest> get copyWith => _$FriendRequestCopyWithImpl<FriendRequest>(this as FriendRequest, _$identity);

  /// Serializes this FriendRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt,createdAt,updatedAt,version);

@override
String toString() {
  return 'FriendRequest(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class $FriendRequestCopyWith<$Res>  {
  factory $FriendRequestCopyWith(FriendRequest value, $Res Function(FriendRequest) _then) = _$FriendRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, Requester? requester, String recipient, String status, DateTime requestedAt, DateTime createdAt, DateTime updatedAt,@JsonKey(name: '__v') int version
});


$RequesterCopyWith<$Res>? get requester;

}
/// @nodoc
class _$FriendRequestCopyWithImpl<$Res>
    implements $FriendRequestCopyWith<$Res> {
  _$FriendRequestCopyWithImpl(this._self, this._then);

  final FriendRequest _self;
  final $Res Function(FriendRequest) _then;

/// Create a copy of FriendRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requester = freezed,Object? recipient = null,Object? status = null,Object? requestedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as Requester?,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of FriendRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequesterCopyWith<$Res>? get requester {
    if (_self.requester == null) {
    return null;
  }

  return $RequesterCopyWith<$Res>(_self.requester!, (value) {
    return _then(_self.copyWith(requester: value));
  });
}
}


/// Adds pattern-matching-related methods to [FriendRequest].
extension FriendRequestPatterns on FriendRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRequest value)  $default,){
final _that = this;
switch (_that) {
case _FriendRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRequest value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  Requester? requester,  String recipient,  String status,  DateTime requestedAt,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: '__v')  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRequest() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  Requester? requester,  String recipient,  String status,  DateTime requestedAt,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: '__v')  int version)  $default,) {final _that = this;
switch (_that) {
case _FriendRequest():
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  Requester? requester,  String recipient,  String status,  DateTime requestedAt,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: '__v')  int version)?  $default,) {final _that = this;
switch (_that) {
case _FriendRequest() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.createdAt,_that.updatedAt,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendRequest implements FriendRequest {
  const _FriendRequest({@JsonKey(name: '_id') required this.id, this.requester, required this.recipient, required this.status, required this.requestedAt, required this.createdAt, required this.updatedAt, @JsonKey(name: '__v') required this.version});
  factory _FriendRequest.fromJson(Map<String, dynamic> json) => _$FriendRequestFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  Requester? requester;
@override final  String recipient;
@override final  String status;
@override final  DateTime requestedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey(name: '__v') final  int version;

/// Create a copy of FriendRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRequestCopyWith<_FriendRequest> get copyWith => __$FriendRequestCopyWithImpl<_FriendRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt,createdAt,updatedAt,version);

@override
String toString() {
  return 'FriendRequest(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class _$FriendRequestCopyWith<$Res> implements $FriendRequestCopyWith<$Res> {
  factory _$FriendRequestCopyWith(_FriendRequest value, $Res Function(_FriendRequest) _then) = __$FriendRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, Requester? requester, String recipient, String status, DateTime requestedAt, DateTime createdAt, DateTime updatedAt,@JsonKey(name: '__v') int version
});


@override $RequesterCopyWith<$Res>? get requester;

}
/// @nodoc
class __$FriendRequestCopyWithImpl<$Res>
    implements _$FriendRequestCopyWith<$Res> {
  __$FriendRequestCopyWithImpl(this._self, this._then);

  final _FriendRequest _self;
  final $Res Function(_FriendRequest) _then;

/// Create a copy of FriendRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requester = freezed,Object? recipient = null,Object? status = null,Object? requestedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,}) {
  return _then(_FriendRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as Requester?,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FriendRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequesterCopyWith<$Res>? get requester {
    if (_self.requester == null) {
    return null;
  }

  return $RequesterCopyWith<$Res>(_self.requester!, (value) {
    return _then(_self.copyWith(requester: value));
  });
}
}


/// @nodoc
mixin _$Requester {

@JsonKey(name: '_id') String get id; AthleteProfile? get athleteProfile;
/// Create a copy of Requester
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequesterCopyWith<Requester> get copyWith => _$RequesterCopyWithImpl<Requester>(this as Requester, _$identity);

  /// Serializes this Requester to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Requester&&(identical(other.id, id) || other.id == id)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athleteProfile);

@override
String toString() {
  return 'Requester(id: $id, athleteProfile: $athleteProfile)';
}


}

/// @nodoc
abstract mixin class $RequesterCopyWith<$Res>  {
  factory $RequesterCopyWith(Requester value, $Res Function(Requester) _then) = _$RequesterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, AthleteProfile? athleteProfile
});


$AthleteProfileCopyWith<$Res>? get athleteProfile;

}
/// @nodoc
class _$RequesterCopyWithImpl<$Res>
    implements $RequesterCopyWith<$Res> {
  _$RequesterCopyWithImpl(this._self, this._then);

  final Requester _self;
  final $Res Function(Requester) _then;

/// Create a copy of Requester
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? athleteProfile = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,
  ));
}
/// Create a copy of Requester
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get athleteProfile {
    if (_self.athleteProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.athleteProfile!, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [Requester].
extension RequesterPatterns on Requester {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Requester value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Requester() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Requester value)  $default,){
final _that = this;
switch (_that) {
case _Requester():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Requester value)?  $default,){
final _that = this;
switch (_that) {
case _Requester() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  AthleteProfile? athleteProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Requester() when $default != null:
return $default(_that.id,_that.athleteProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  AthleteProfile? athleteProfile)  $default,) {final _that = this;
switch (_that) {
case _Requester():
return $default(_that.id,_that.athleteProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  AthleteProfile? athleteProfile)?  $default,) {final _that = this;
switch (_that) {
case _Requester() when $default != null:
return $default(_that.id,_that.athleteProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Requester implements Requester {
  const _Requester({@JsonKey(name: '_id') required this.id, this.athleteProfile});
  factory _Requester.fromJson(Map<String, dynamic> json) => _$RequesterFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  AthleteProfile? athleteProfile;

/// Create a copy of Requester
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequesterCopyWith<_Requester> get copyWith => __$RequesterCopyWithImpl<_Requester>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequesterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Requester&&(identical(other.id, id) || other.id == id)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athleteProfile);

@override
String toString() {
  return 'Requester(id: $id, athleteProfile: $athleteProfile)';
}


}

/// @nodoc
abstract mixin class _$RequesterCopyWith<$Res> implements $RequesterCopyWith<$Res> {
  factory _$RequesterCopyWith(_Requester value, $Res Function(_Requester) _then) = __$RequesterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, AthleteProfile? athleteProfile
});


@override $AthleteProfileCopyWith<$Res>? get athleteProfile;

}
/// @nodoc
class __$RequesterCopyWithImpl<$Res>
    implements _$RequesterCopyWith<$Res> {
  __$RequesterCopyWithImpl(this._self, this._then);

  final _Requester _self;
  final $Res Function(_Requester) _then;

/// Create a copy of Requester
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? athleteProfile = freezed,}) {
  return _then(_Requester(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,
  ));
}

/// Create a copy of Requester
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get athleteProfile {
    if (_self.athleteProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.athleteProfile!, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}
}


/// @nodoc
mixin _$AthleteProfile {

 String? get name; String? get profileImageUrl;
/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<AthleteProfile> get copyWith => _$AthleteProfileCopyWithImpl<AthleteProfile>(this as AthleteProfile, _$identity);

  /// Serializes this AthleteProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,profileImageUrl);

@override
String toString() {
  return 'AthleteProfile(name: $name, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class $AthleteProfileCopyWith<$Res>  {
  factory $AthleteProfileCopyWith(AthleteProfile value, $Res Function(AthleteProfile) _then) = _$AthleteProfileCopyWithImpl;
@useResult
$Res call({
 String? name, String? profileImageUrl
});




}
/// @nodoc
class _$AthleteProfileCopyWithImpl<$Res>
    implements $AthleteProfileCopyWith<$Res> {
  _$AthleteProfileCopyWithImpl(this._self, this._then);

  final AthleteProfile _self;
  final $Res Function(AthleteProfile) _then;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? profileImageUrl = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteProfile].
extension AthleteProfilePatterns on AthleteProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteProfile value)  $default,){
final _that = this;
switch (_that) {
case _AthleteProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteProfile value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? profileImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
return $default(_that.name,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? profileImageUrl)  $default,) {final _that = this;
switch (_that) {
case _AthleteProfile():
return $default(_that.name,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? profileImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
return $default(_that.name,_that.profileImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AthleteProfile implements AthleteProfile {
  const _AthleteProfile({this.name, this.profileImageUrl});
  factory _AthleteProfile.fromJson(Map<String, dynamic> json) => _$AthleteProfileFromJson(json);

@override final  String? name;
@override final  String? profileImageUrl;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteProfileCopyWith<_AthleteProfile> get copyWith => __$AthleteProfileCopyWithImpl<_AthleteProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,profileImageUrl);

@override
String toString() {
  return 'AthleteProfile(name: $name, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$AthleteProfileCopyWith<$Res> implements $AthleteProfileCopyWith<$Res> {
  factory _$AthleteProfileCopyWith(_AthleteProfile value, $Res Function(_AthleteProfile) _then) = __$AthleteProfileCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? profileImageUrl
});




}
/// @nodoc
class __$AthleteProfileCopyWithImpl<$Res>
    implements _$AthleteProfileCopyWith<$Res> {
  __$AthleteProfileCopyWithImpl(this._self, this._then);

  final _AthleteProfile _self;
  final $Res Function(_AthleteProfile) _then;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? profileImageUrl = freezed,}) {
  return _then(_AthleteProfile(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Recipient {

@JsonKey(name: '_id') String get id;
/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipientCopyWith<Recipient> get copyWith => _$RecipientCopyWithImpl<Recipient>(this as Recipient, _$identity);

  /// Serializes this Recipient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipient&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'Recipient(id: $id)';
}


}

/// @nodoc
abstract mixin class $RecipientCopyWith<$Res>  {
  factory $RecipientCopyWith(Recipient value, $Res Function(Recipient) _then) = _$RecipientCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id
});




}
/// @nodoc
class _$RecipientCopyWithImpl<$Res>
    implements $RecipientCopyWith<$Res> {
  _$RecipientCopyWithImpl(this._self, this._then);

  final Recipient _self;
  final $Res Function(Recipient) _then;

/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipient].
extension RecipientPatterns on Recipient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipient value)  $default,){
final _that = this;
switch (_that) {
case _Recipient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipient value)?  $default,){
final _that = this;
switch (_that) {
case _Recipient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipient() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id)  $default,) {final _that = this;
switch (_that) {
case _Recipient():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id)?  $default,) {final _that = this;
switch (_that) {
case _Recipient() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recipient implements Recipient {
  const _Recipient({@JsonKey(name: '_id') required this.id});
  factory _Recipient.fromJson(Map<String, dynamic> json) => _$RecipientFromJson(json);

@override@JsonKey(name: '_id') final  String id;

/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipientCopyWith<_Recipient> get copyWith => __$RecipientCopyWithImpl<_Recipient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipient&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'Recipient(id: $id)';
}


}

/// @nodoc
abstract mixin class _$RecipientCopyWith<$Res> implements $RecipientCopyWith<$Res> {
  factory _$RecipientCopyWith(_Recipient value, $Res Function(_Recipient) _then) = __$RecipientCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id
});




}
/// @nodoc
class __$RecipientCopyWithImpl<$Res>
    implements _$RecipientCopyWith<$Res> {
  __$RecipientCopyWithImpl(this._self, this._then);

  final _Recipient _self;
  final $Res Function(_Recipient) _then;

/// Create a copy of Recipient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Recipient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SendFriendRequest {

@JsonKey(name: '_id') String get id; String get requester;// sender user ID
 FriendRecipient get recipient; String get status;// pending / accepted / rejected
 DateTime get requestedAt; DateTime get createdAt; DateTime get updatedAt;@JsonKey(name: '__v') int get version;
/// Create a copy of SendFriendRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendFriendRequestCopyWith<SendFriendRequest> get copyWith => _$SendFriendRequestCopyWithImpl<SendFriendRequest>(this as SendFriendRequest, _$identity);

  /// Serializes this SendFriendRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendFriendRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt,createdAt,updatedAt,version);

@override
String toString() {
  return 'SendFriendRequest(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class $SendFriendRequestCopyWith<$Res>  {
  factory $SendFriendRequestCopyWith(SendFriendRequest value, $Res Function(SendFriendRequest) _then) = _$SendFriendRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String requester, FriendRecipient recipient, String status, DateTime requestedAt, DateTime createdAt, DateTime updatedAt,@JsonKey(name: '__v') int version
});


$FriendRecipientCopyWith<$Res> get recipient;

}
/// @nodoc
class _$SendFriendRequestCopyWithImpl<$Res>
    implements $SendFriendRequestCopyWith<$Res> {
  _$SendFriendRequestCopyWithImpl(this._self, this._then);

  final SendFriendRequest _self;
  final $Res Function(SendFriendRequest) _then;

/// Create a copy of SendFriendRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requester = null,Object? recipient = null,Object? status = null,Object? requestedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as FriendRecipient,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of SendFriendRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FriendRecipientCopyWith<$Res> get recipient {
  
  return $FriendRecipientCopyWith<$Res>(_self.recipient, (value) {
    return _then(_self.copyWith(recipient: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendFriendRequest].
extension SendFriendRequestPatterns on SendFriendRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendFriendRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendFriendRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendFriendRequest value)  $default,){
final _that = this;
switch (_that) {
case _SendFriendRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendFriendRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SendFriendRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String requester,  FriendRecipient recipient,  String status,  DateTime requestedAt,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: '__v')  int version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendFriendRequest() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String requester,  FriendRecipient recipient,  String status,  DateTime requestedAt,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: '__v')  int version)  $default,) {final _that = this;
switch (_that) {
case _SendFriendRequest():
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String requester,  FriendRecipient recipient,  String status,  DateTime requestedAt,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: '__v')  int version)?  $default,) {final _that = this;
switch (_that) {
case _SendFriendRequest() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt,_that.createdAt,_that.updatedAt,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendFriendRequest implements SendFriendRequest {
  const _SendFriendRequest({@JsonKey(name: '_id') required this.id, required this.requester, required this.recipient, required this.status, required this.requestedAt, required this.createdAt, required this.updatedAt, @JsonKey(name: '__v') required this.version});
  factory _SendFriendRequest.fromJson(Map<String, dynamic> json) => _$SendFriendRequestFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String requester;
// sender user ID
@override final  FriendRecipient recipient;
@override final  String status;
// pending / accepted / rejected
@override final  DateTime requestedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey(name: '__v') final  int version;

/// Create a copy of SendFriendRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendFriendRequestCopyWith<_SendFriendRequest> get copyWith => __$SendFriendRequestCopyWithImpl<_SendFriendRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendFriendRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendFriendRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt,createdAt,updatedAt,version);

@override
String toString() {
  return 'SendFriendRequest(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class _$SendFriendRequestCopyWith<$Res> implements $SendFriendRequestCopyWith<$Res> {
  factory _$SendFriendRequestCopyWith(_SendFriendRequest value, $Res Function(_SendFriendRequest) _then) = __$SendFriendRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String requester, FriendRecipient recipient, String status, DateTime requestedAt, DateTime createdAt, DateTime updatedAt,@JsonKey(name: '__v') int version
});


@override $FriendRecipientCopyWith<$Res> get recipient;

}
/// @nodoc
class __$SendFriendRequestCopyWithImpl<$Res>
    implements _$SendFriendRequestCopyWith<$Res> {
  __$SendFriendRequestCopyWithImpl(this._self, this._then);

  final _SendFriendRequest _self;
  final $Res Function(_SendFriendRequest) _then;

/// Create a copy of SendFriendRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requester = null,Object? recipient = null,Object? status = null,Object? requestedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,}) {
  return _then(_SendFriendRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as FriendRecipient,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of SendFriendRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FriendRecipientCopyWith<$Res> get recipient {
  
  return $FriendRecipientCopyWith<$Res>(_self.recipient, (value) {
    return _then(_self.copyWith(recipient: value));
  });
}
}


/// @nodoc
mixin _$FriendRecipient {

@JsonKey(name: '_id') String get id;
/// Create a copy of FriendRecipient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendRecipientCopyWith<FriendRecipient> get copyWith => _$FriendRecipientCopyWithImpl<FriendRecipient>(this as FriendRecipient, _$identity);

  /// Serializes this FriendRecipient to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendRecipient&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FriendRecipient(id: $id)';
}


}

/// @nodoc
abstract mixin class $FriendRecipientCopyWith<$Res>  {
  factory $FriendRecipientCopyWith(FriendRecipient value, $Res Function(FriendRecipient) _then) = _$FriendRecipientCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id
});




}
/// @nodoc
class _$FriendRecipientCopyWithImpl<$Res>
    implements $FriendRecipientCopyWith<$Res> {
  _$FriendRecipientCopyWithImpl(this._self, this._then);

  final FriendRecipient _self;
  final $Res Function(FriendRecipient) _then;

/// Create a copy of FriendRecipient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendRecipient].
extension FriendRecipientPatterns on FriendRecipient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FriendRecipient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FriendRecipient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FriendRecipient value)  $default,){
final _that = this;
switch (_that) {
case _FriendRecipient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FriendRecipient value)?  $default,){
final _that = this;
switch (_that) {
case _FriendRecipient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FriendRecipient() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id)  $default,) {final _that = this;
switch (_that) {
case _FriendRecipient():
return $default(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id)?  $default,) {final _that = this;
switch (_that) {
case _FriendRecipient() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FriendRecipient implements FriendRecipient {
  const _FriendRecipient({@JsonKey(name: '_id') required this.id});
  factory _FriendRecipient.fromJson(Map<String, dynamic> json) => _$FriendRecipientFromJson(json);

@override@JsonKey(name: '_id') final  String id;

/// Create a copy of FriendRecipient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FriendRecipientCopyWith<_FriendRecipient> get copyWith => __$FriendRecipientCopyWithImpl<_FriendRecipient>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FriendRecipientToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FriendRecipient&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'FriendRecipient(id: $id)';
}


}

/// @nodoc
abstract mixin class _$FriendRecipientCopyWith<$Res> implements $FriendRecipientCopyWith<$Res> {
  factory _$FriendRecipientCopyWith(_FriendRecipient value, $Res Function(_FriendRecipient) _then) = __$FriendRecipientCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id
});




}
/// @nodoc
class __$FriendRecipientCopyWithImpl<$Res>
    implements _$FriendRecipientCopyWith<$Res> {
  __$FriendRecipientCopyWithImpl(this._self, this._then);

  final _FriendRecipient _self;
  final $Res Function(_FriendRecipient) _then;

/// Create a copy of FriendRecipient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_FriendRecipient(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ConnectionStatus {

 String get status;// none, pending, accepted, rejected
 String? get connectionId; bool get isRequester;
/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionStatusCopyWith<ConnectionStatus> get copyWith => _$ConnectionStatusCopyWithImpl<ConnectionStatus>(this as ConnectionStatus, _$identity);

  /// Serializes this ConnectionStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.isRequester, isRequester) || other.isRequester == isRequester));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,connectionId,isRequester);

@override
String toString() {
  return 'ConnectionStatus(status: $status, connectionId: $connectionId, isRequester: $isRequester)';
}


}

/// @nodoc
abstract mixin class $ConnectionStatusCopyWith<$Res>  {
  factory $ConnectionStatusCopyWith(ConnectionStatus value, $Res Function(ConnectionStatus) _then) = _$ConnectionStatusCopyWithImpl;
@useResult
$Res call({
 String status, String? connectionId, bool isRequester
});




}
/// @nodoc
class _$ConnectionStatusCopyWithImpl<$Res>
    implements $ConnectionStatusCopyWith<$Res> {
  _$ConnectionStatusCopyWithImpl(this._self, this._then);

  final ConnectionStatus _self;
  final $Res Function(ConnectionStatus) _then;

/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? connectionId = freezed,Object? isRequester = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,connectionId: freezed == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String?,isRequester: null == isRequester ? _self.isRequester : isRequester // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionStatus].
extension ConnectionStatusPatterns on ConnectionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionStatus value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String? connectionId,  bool isRequester)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionStatus() when $default != null:
return $default(_that.status,_that.connectionId,_that.isRequester);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String? connectionId,  bool isRequester)  $default,) {final _that = this;
switch (_that) {
case _ConnectionStatus():
return $default(_that.status,_that.connectionId,_that.isRequester);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String? connectionId,  bool isRequester)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionStatus() when $default != null:
return $default(_that.status,_that.connectionId,_that.isRequester);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionStatus implements ConnectionStatus {
  const _ConnectionStatus({required this.status, this.connectionId, this.isRequester = false});
  factory _ConnectionStatus.fromJson(Map<String, dynamic> json) => _$ConnectionStatusFromJson(json);

@override final  String status;
// none, pending, accepted, rejected
@override final  String? connectionId;
@override@JsonKey() final  bool isRequester;

/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionStatusCopyWith<_ConnectionStatus> get copyWith => __$ConnectionStatusCopyWithImpl<_ConnectionStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionStatus&&(identical(other.status, status) || other.status == status)&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.isRequester, isRequester) || other.isRequester == isRequester));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,connectionId,isRequester);

@override
String toString() {
  return 'ConnectionStatus(status: $status, connectionId: $connectionId, isRequester: $isRequester)';
}


}

/// @nodoc
abstract mixin class _$ConnectionStatusCopyWith<$Res> implements $ConnectionStatusCopyWith<$Res> {
  factory _$ConnectionStatusCopyWith(_ConnectionStatus value, $Res Function(_ConnectionStatus) _then) = __$ConnectionStatusCopyWithImpl;
@override @useResult
$Res call({
 String status, String? connectionId, bool isRequester
});




}
/// @nodoc
class __$ConnectionStatusCopyWithImpl<$Res>
    implements _$ConnectionStatusCopyWith<$Res> {
  __$ConnectionStatusCopyWithImpl(this._self, this._then);

  final _ConnectionStatus _self;
  final $Res Function(_ConnectionStatus) _then;

/// Create a copy of ConnectionStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? connectionId = freezed,Object? isRequester = null,}) {
  return _then(_ConnectionStatus(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,connectionId: freezed == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String?,isRequester: null == isRequester ? _self.isRequester : isRequester // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ConnectedAthlete {

 String get connectionId; DateTime get connectedAt; AthleteProfile get user; bool get isOnline; DateTime? get lastSeenAt;
/// Create a copy of ConnectedAthlete
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedAthleteCopyWith<ConnectedAthlete> get copyWith => _$ConnectedAthleteCopyWithImpl<ConnectedAthlete>(this as ConnectedAthlete, _$identity);

  /// Serializes this ConnectedAthlete to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedAthlete&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionId,connectedAt,user,isOnline,lastSeenAt);

@override
String toString() {
  return 'ConnectedAthlete(connectionId: $connectionId, connectedAt: $connectedAt, user: $user, isOnline: $isOnline, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $ConnectedAthleteCopyWith<$Res>  {
  factory $ConnectedAthleteCopyWith(ConnectedAthlete value, $Res Function(ConnectedAthlete) _then) = _$ConnectedAthleteCopyWithImpl;
@useResult
$Res call({
 String connectionId, DateTime connectedAt, AthleteProfile user, bool isOnline, DateTime? lastSeenAt
});


$AthleteProfileCopyWith<$Res> get user;

}
/// @nodoc
class _$ConnectedAthleteCopyWithImpl<$Res>
    implements $ConnectedAthleteCopyWith<$Res> {
  _$ConnectedAthleteCopyWithImpl(this._self, this._then);

  final ConnectedAthlete _self;
  final $Res Function(ConnectedAthlete) _then;

/// Create a copy of ConnectedAthlete
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionId = null,Object? connectedAt = null,Object? user = null,Object? isOnline = null,Object? lastSeenAt = freezed,}) {
  return _then(_self.copyWith(
connectionId: null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String,connectedAt: null == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AthleteProfile,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ConnectedAthlete
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res> get user {
  
  return $AthleteProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectedAthlete].
extension ConnectedAthletePatterns on ConnectedAthlete {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectedAthlete value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectedAthlete() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectedAthlete value)  $default,){
final _that = this;
switch (_that) {
case _ConnectedAthlete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectedAthlete value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectedAthlete() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String connectionId,  DateTime connectedAt,  AthleteProfile user,  bool isOnline,  DateTime? lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectedAthlete() when $default != null:
return $default(_that.connectionId,_that.connectedAt,_that.user,_that.isOnline,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String connectionId,  DateTime connectedAt,  AthleteProfile user,  bool isOnline,  DateTime? lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _ConnectedAthlete():
return $default(_that.connectionId,_that.connectedAt,_that.user,_that.isOnline,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String connectionId,  DateTime connectedAt,  AthleteProfile user,  bool isOnline,  DateTime? lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _ConnectedAthlete() when $default != null:
return $default(_that.connectionId,_that.connectedAt,_that.user,_that.isOnline,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectedAthlete implements ConnectedAthlete {
  const _ConnectedAthlete({required this.connectionId, required this.connectedAt, required this.user, this.isOnline = false, this.lastSeenAt});
  factory _ConnectedAthlete.fromJson(Map<String, dynamic> json) => _$ConnectedAthleteFromJson(json);

@override final  String connectionId;
@override final  DateTime connectedAt;
@override final  AthleteProfile user;
@override@JsonKey() final  bool isOnline;
@override final  DateTime? lastSeenAt;

/// Create a copy of ConnectedAthlete
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedAthleteCopyWith<_ConnectedAthlete> get copyWith => __$ConnectedAthleteCopyWithImpl<_ConnectedAthlete>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectedAthleteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectedAthlete&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionId,connectedAt,user,isOnline,lastSeenAt);

@override
String toString() {
  return 'ConnectedAthlete(connectionId: $connectionId, connectedAt: $connectedAt, user: $user, isOnline: $isOnline, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$ConnectedAthleteCopyWith<$Res> implements $ConnectedAthleteCopyWith<$Res> {
  factory _$ConnectedAthleteCopyWith(_ConnectedAthlete value, $Res Function(_ConnectedAthlete) _then) = __$ConnectedAthleteCopyWithImpl;
@override @useResult
$Res call({
 String connectionId, DateTime connectedAt, AthleteProfile user, bool isOnline, DateTime? lastSeenAt
});


@override $AthleteProfileCopyWith<$Res> get user;

}
/// @nodoc
class __$ConnectedAthleteCopyWithImpl<$Res>
    implements _$ConnectedAthleteCopyWith<$Res> {
  __$ConnectedAthleteCopyWithImpl(this._self, this._then);

  final _ConnectedAthlete _self;
  final $Res Function(_ConnectedAthlete) _then;

/// Create a copy of ConnectedAthlete
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionId = null,Object? connectedAt = null,Object? user = null,Object? isOnline = null,Object? lastSeenAt = freezed,}) {
  return _then(_ConnectedAthlete(
connectionId: null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String,connectedAt: null == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AthleteProfile,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ConnectedAthlete
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res> get user {
  
  return $AthleteProfileCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ConnectedUser {

 String get connectionId; DateTime get connectedAt; ConnectionUser get user;
/// Create a copy of ConnectedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedUserCopyWith<ConnectedUser> get copyWith => _$ConnectedUserCopyWithImpl<ConnectedUser>(this as ConnectedUser, _$identity);

  /// Serializes this ConnectedUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedUser&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionId,connectedAt,user);

@override
String toString() {
  return 'ConnectedUser(connectionId: $connectionId, connectedAt: $connectedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class $ConnectedUserCopyWith<$Res>  {
  factory $ConnectedUserCopyWith(ConnectedUser value, $Res Function(ConnectedUser) _then) = _$ConnectedUserCopyWithImpl;
@useResult
$Res call({
 String connectionId, DateTime connectedAt, ConnectionUser user
});


$ConnectionUserCopyWith<$Res> get user;

}
/// @nodoc
class _$ConnectedUserCopyWithImpl<$Res>
    implements $ConnectedUserCopyWith<$Res> {
  _$ConnectedUserCopyWithImpl(this._self, this._then);

  final ConnectedUser _self;
  final $Res Function(ConnectedUser) _then;

/// Create a copy of ConnectedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionId = null,Object? connectedAt = null,Object? user = null,}) {
  return _then(_self.copyWith(
connectionId: null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String,connectedAt: null == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ConnectionUser,
  ));
}
/// Create a copy of ConnectedUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionUserCopyWith<$Res> get user {
  
  return $ConnectionUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectedUser].
extension ConnectedUserPatterns on ConnectedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectedUser value)  $default,){
final _that = this;
switch (_that) {
case _ConnectedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectedUser value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String connectionId,  DateTime connectedAt,  ConnectionUser user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectedUser() when $default != null:
return $default(_that.connectionId,_that.connectedAt,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String connectionId,  DateTime connectedAt,  ConnectionUser user)  $default,) {final _that = this;
switch (_that) {
case _ConnectedUser():
return $default(_that.connectionId,_that.connectedAt,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String connectionId,  DateTime connectedAt,  ConnectionUser user)?  $default,) {final _that = this;
switch (_that) {
case _ConnectedUser() when $default != null:
return $default(_that.connectionId,_that.connectedAt,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectedUser implements ConnectedUser {
  const _ConnectedUser({required this.connectionId, required this.connectedAt, required this.user});
  factory _ConnectedUser.fromJson(Map<String, dynamic> json) => _$ConnectedUserFromJson(json);

@override final  String connectionId;
@override final  DateTime connectedAt;
@override final  ConnectionUser user;

/// Create a copy of ConnectedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectedUserCopyWith<_ConnectedUser> get copyWith => __$ConnectedUserCopyWithImpl<_ConnectedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectedUser&&(identical(other.connectionId, connectionId) || other.connectionId == connectionId)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,connectionId,connectedAt,user);

@override
String toString() {
  return 'ConnectedUser(connectionId: $connectionId, connectedAt: $connectedAt, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ConnectedUserCopyWith<$Res> implements $ConnectedUserCopyWith<$Res> {
  factory _$ConnectedUserCopyWith(_ConnectedUser value, $Res Function(_ConnectedUser) _then) = __$ConnectedUserCopyWithImpl;
@override @useResult
$Res call({
 String connectionId, DateTime connectedAt, ConnectionUser user
});


@override $ConnectionUserCopyWith<$Res> get user;

}
/// @nodoc
class __$ConnectedUserCopyWithImpl<$Res>
    implements _$ConnectedUserCopyWith<$Res> {
  __$ConnectedUserCopyWithImpl(this._self, this._then);

  final _ConnectedUser _self;
  final $Res Function(_ConnectedUser) _then;

/// Create a copy of ConnectedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionId = null,Object? connectedAt = null,Object? user = null,}) {
  return _then(_ConnectedUser(
connectionId: null == connectionId ? _self.connectionId : connectionId // ignore: cast_nullable_to_non_nullable
as String,connectedAt: null == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ConnectionUser,
  ));
}

/// Create a copy of ConnectedUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionUserCopyWith<$Res> get user {
  
  return $ConnectionUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ConnectionUser {

@JsonKey(name: '_id') String get id; bool get isOnline; DateTime? get lastSeenAt; AthleteProfile get athleteProfile;
/// Create a copy of ConnectionUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionUserCopyWith<ConnectionUser> get copyWith => _$ConnectionUserCopyWithImpl<ConnectionUser>(this as ConnectionUser, _$identity);

  /// Serializes this ConnectionUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionUser&&(identical(other.id, id) || other.id == id)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isOnline,lastSeenAt,athleteProfile);

@override
String toString() {
  return 'ConnectionUser(id: $id, isOnline: $isOnline, lastSeenAt: $lastSeenAt, athleteProfile: $athleteProfile)';
}


}

/// @nodoc
abstract mixin class $ConnectionUserCopyWith<$Res>  {
  factory $ConnectionUserCopyWith(ConnectionUser value, $Res Function(ConnectionUser) _then) = _$ConnectionUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, bool isOnline, DateTime? lastSeenAt, AthleteProfile athleteProfile
});


$AthleteProfileCopyWith<$Res> get athleteProfile;

}
/// @nodoc
class _$ConnectionUserCopyWithImpl<$Res>
    implements $ConnectionUserCopyWith<$Res> {
  _$ConnectionUserCopyWithImpl(this._self, this._then);

  final ConnectionUser _self;
  final $Res Function(ConnectionUser) _then;

/// Create a copy of ConnectionUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? isOnline = null,Object? lastSeenAt = freezed,Object? athleteProfile = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,athleteProfile: null == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile,
  ));
}
/// Create a copy of ConnectionUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res> get athleteProfile {
  
  return $AthleteProfileCopyWith<$Res>(_self.athleteProfile, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionUser].
extension ConnectionUserPatterns on ConnectionUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionUser value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionUser value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  bool isOnline,  DateTime? lastSeenAt,  AthleteProfile athleteProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionUser() when $default != null:
return $default(_that.id,_that.isOnline,_that.lastSeenAt,_that.athleteProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  bool isOnline,  DateTime? lastSeenAt,  AthleteProfile athleteProfile)  $default,) {final _that = this;
switch (_that) {
case _ConnectionUser():
return $default(_that.id,_that.isOnline,_that.lastSeenAt,_that.athleteProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  bool isOnline,  DateTime? lastSeenAt,  AthleteProfile athleteProfile)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionUser() when $default != null:
return $default(_that.id,_that.isOnline,_that.lastSeenAt,_that.athleteProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionUser implements ConnectionUser {
  const _ConnectionUser({@JsonKey(name: '_id') required this.id, required this.isOnline, this.lastSeenAt, required this.athleteProfile});
  factory _ConnectionUser.fromJson(Map<String, dynamic> json) => _$ConnectionUserFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  bool isOnline;
@override final  DateTime? lastSeenAt;
@override final  AthleteProfile athleteProfile;

/// Create a copy of ConnectionUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionUserCopyWith<_ConnectionUser> get copyWith => __$ConnectionUserCopyWithImpl<_ConnectionUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionUser&&(identical(other.id, id) || other.id == id)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,isOnline,lastSeenAt,athleteProfile);

@override
String toString() {
  return 'ConnectionUser(id: $id, isOnline: $isOnline, lastSeenAt: $lastSeenAt, athleteProfile: $athleteProfile)';
}


}

/// @nodoc
abstract mixin class _$ConnectionUserCopyWith<$Res> implements $ConnectionUserCopyWith<$Res> {
  factory _$ConnectionUserCopyWith(_ConnectionUser value, $Res Function(_ConnectionUser) _then) = __$ConnectionUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, bool isOnline, DateTime? lastSeenAt, AthleteProfile athleteProfile
});


@override $AthleteProfileCopyWith<$Res> get athleteProfile;

}
/// @nodoc
class __$ConnectionUserCopyWithImpl<$Res>
    implements _$ConnectionUserCopyWith<$Res> {
  __$ConnectionUserCopyWithImpl(this._self, this._then);

  final _ConnectionUser _self;
  final $Res Function(_ConnectionUser) _then;

/// Create a copy of ConnectionUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isOnline = null,Object? lastSeenAt = freezed,Object? athleteProfile = null,}) {
  return _then(_ConnectionUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,athleteProfile: null == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile,
  ));
}

/// Create a copy of ConnectionUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res> get athleteProfile {
  
  return $AthleteProfileCopyWith<$Res>(_self.athleteProfile, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}
}


/// @nodoc
mixin _$ConnectionRequestsResponse {

 bool get success; String get message; ConnectionRequestsData? get data;
/// Create a copy of ConnectionRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionRequestsResponseCopyWith<ConnectionRequestsResponse> get copyWith => _$ConnectionRequestsResponseCopyWithImpl<ConnectionRequestsResponse>(this as ConnectionRequestsResponse, _$identity);

  /// Serializes this ConnectionRequestsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionRequestsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ConnectionRequestsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConnectionRequestsResponseCopyWith<$Res>  {
  factory $ConnectionRequestsResponseCopyWith(ConnectionRequestsResponse value, $Res Function(ConnectionRequestsResponse) _then) = _$ConnectionRequestsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, ConnectionRequestsData? data
});


$ConnectionRequestsDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ConnectionRequestsResponseCopyWithImpl<$Res>
    implements $ConnectionRequestsResponseCopyWith<$Res> {
  _$ConnectionRequestsResponseCopyWithImpl(this._self, this._then);

  final ConnectionRequestsResponse _self;
  final $Res Function(ConnectionRequestsResponse) _then;

/// Create a copy of ConnectionRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ConnectionRequestsData?,
  ));
}
/// Create a copy of ConnectionRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionRequestsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionRequestsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionRequestsResponse].
extension ConnectionRequestsResponsePatterns on ConnectionRequestsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionRequestsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionRequestsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionRequestsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionRequestsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionRequestsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionRequestsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  ConnectionRequestsData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionRequestsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  ConnectionRequestsData? data)  $default,) {final _that = this;
switch (_that) {
case _ConnectionRequestsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  ConnectionRequestsData? data)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionRequestsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionRequestsResponse implements ConnectionRequestsResponse {
  const _ConnectionRequestsResponse({this.success = false, this.message = '', this.data});
  factory _ConnectionRequestsResponse.fromJson(Map<String, dynamic> json) => _$ConnectionRequestsResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  ConnectionRequestsData? data;

/// Create a copy of ConnectionRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionRequestsResponseCopyWith<_ConnectionRequestsResponse> get copyWith => __$ConnectionRequestsResponseCopyWithImpl<_ConnectionRequestsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionRequestsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionRequestsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ConnectionRequestsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ConnectionRequestsResponseCopyWith<$Res> implements $ConnectionRequestsResponseCopyWith<$Res> {
  factory _$ConnectionRequestsResponseCopyWith(_ConnectionRequestsResponse value, $Res Function(_ConnectionRequestsResponse) _then) = __$ConnectionRequestsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, ConnectionRequestsData? data
});


@override $ConnectionRequestsDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ConnectionRequestsResponseCopyWithImpl<$Res>
    implements _$ConnectionRequestsResponseCopyWith<$Res> {
  __$ConnectionRequestsResponseCopyWithImpl(this._self, this._then);

  final _ConnectionRequestsResponse _self;
  final $Res Function(_ConnectionRequestsResponse) _then;

/// Create a copy of ConnectionRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_ConnectionRequestsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ConnectionRequestsData?,
  ));
}

/// Create a copy of ConnectionRequestsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionRequestsDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionRequestsDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ConnectionRequestsData {

 List<ConnectionRequest> get requests; int get count;
/// Create a copy of ConnectionRequestsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionRequestsDataCopyWith<ConnectionRequestsData> get copyWith => _$ConnectionRequestsDataCopyWithImpl<ConnectionRequestsData>(this as ConnectionRequestsData, _$identity);

  /// Serializes this ConnectionRequestsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionRequestsData&&const DeepCollectionEquality().equals(other.requests, requests)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(requests),count);

@override
String toString() {
  return 'ConnectionRequestsData(requests: $requests, count: $count)';
}


}

/// @nodoc
abstract mixin class $ConnectionRequestsDataCopyWith<$Res>  {
  factory $ConnectionRequestsDataCopyWith(ConnectionRequestsData value, $Res Function(ConnectionRequestsData) _then) = _$ConnectionRequestsDataCopyWithImpl;
@useResult
$Res call({
 List<ConnectionRequest> requests, int count
});




}
/// @nodoc
class _$ConnectionRequestsDataCopyWithImpl<$Res>
    implements $ConnectionRequestsDataCopyWith<$Res> {
  _$ConnectionRequestsDataCopyWithImpl(this._self, this._then);

  final ConnectionRequestsData _self;
  final $Res Function(ConnectionRequestsData) _then;

/// Create a copy of ConnectionRequestsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requests = null,Object? count = null,}) {
  return _then(_self.copyWith(
requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<ConnectionRequest>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionRequestsData].
extension ConnectionRequestsDataPatterns on ConnectionRequestsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionRequestsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionRequestsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionRequestsData value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionRequestsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionRequestsData value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionRequestsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ConnectionRequest> requests,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionRequestsData() when $default != null:
return $default(_that.requests,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ConnectionRequest> requests,  int count)  $default,) {final _that = this;
switch (_that) {
case _ConnectionRequestsData():
return $default(_that.requests,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ConnectionRequest> requests,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionRequestsData() when $default != null:
return $default(_that.requests,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionRequestsData implements ConnectionRequestsData {
  const _ConnectionRequestsData({final  List<ConnectionRequest> requests = const [], this.count = 0}): _requests = requests;
  factory _ConnectionRequestsData.fromJson(Map<String, dynamic> json) => _$ConnectionRequestsDataFromJson(json);

 final  List<ConnectionRequest> _requests;
@override@JsonKey() List<ConnectionRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

@override@JsonKey() final  int count;

/// Create a copy of ConnectionRequestsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionRequestsDataCopyWith<_ConnectionRequestsData> get copyWith => __$ConnectionRequestsDataCopyWithImpl<_ConnectionRequestsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionRequestsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionRequestsData&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),count);

@override
String toString() {
  return 'ConnectionRequestsData(requests: $requests, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ConnectionRequestsDataCopyWith<$Res> implements $ConnectionRequestsDataCopyWith<$Res> {
  factory _$ConnectionRequestsDataCopyWith(_ConnectionRequestsData value, $Res Function(_ConnectionRequestsData) _then) = __$ConnectionRequestsDataCopyWithImpl;
@override @useResult
$Res call({
 List<ConnectionRequest> requests, int count
});




}
/// @nodoc
class __$ConnectionRequestsDataCopyWithImpl<$Res>
    implements _$ConnectionRequestsDataCopyWith<$Res> {
  __$ConnectionRequestsDataCopyWithImpl(this._self, this._then);

  final _ConnectionRequestsData _self;
  final $Res Function(_ConnectionRequestsData) _then;

/// Create a copy of ConnectionRequestsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? count = null,}) {
  return _then(_ConnectionRequestsData(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ConnectionRequest>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ConnectionsListResponse {

 bool get success; String get message; ConnectionsListData? get data;
/// Create a copy of ConnectionsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsListResponseCopyWith<ConnectionsListResponse> get copyWith => _$ConnectionsListResponseCopyWithImpl<ConnectionsListResponse>(this as ConnectionsListResponse, _$identity);

  /// Serializes this ConnectionsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ConnectionsListResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConnectionsListResponseCopyWith<$Res>  {
  factory $ConnectionsListResponseCopyWith(ConnectionsListResponse value, $Res Function(ConnectionsListResponse) _then) = _$ConnectionsListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, ConnectionsListData? data
});


$ConnectionsListDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ConnectionsListResponseCopyWithImpl<$Res>
    implements $ConnectionsListResponseCopyWith<$Res> {
  _$ConnectionsListResponseCopyWithImpl(this._self, this._then);

  final ConnectionsListResponse _self;
  final $Res Function(ConnectionsListResponse) _then;

/// Create a copy of ConnectionsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ConnectionsListData?,
  ));
}
/// Create a copy of ConnectionsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionsListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionsListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionsListResponse].
extension ConnectionsListResponsePatterns on ConnectionsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionsListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionsListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionsListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  ConnectionsListData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionsListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  ConnectionsListData? data)  $default,) {final _that = this;
switch (_that) {
case _ConnectionsListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  ConnectionsListData? data)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionsListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionsListResponse implements ConnectionsListResponse {
  const _ConnectionsListResponse({this.success = false, this.message = '', this.data});
  factory _ConnectionsListResponse.fromJson(Map<String, dynamic> json) => _$ConnectionsListResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  ConnectionsListData? data;

/// Create a copy of ConnectionsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionsListResponseCopyWith<_ConnectionsListResponse> get copyWith => __$ConnectionsListResponseCopyWithImpl<_ConnectionsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionsListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ConnectionsListResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ConnectionsListResponseCopyWith<$Res> implements $ConnectionsListResponseCopyWith<$Res> {
  factory _$ConnectionsListResponseCopyWith(_ConnectionsListResponse value, $Res Function(_ConnectionsListResponse) _then) = __$ConnectionsListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, ConnectionsListData? data
});


@override $ConnectionsListDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ConnectionsListResponseCopyWithImpl<$Res>
    implements _$ConnectionsListResponseCopyWith<$Res> {
  __$ConnectionsListResponseCopyWithImpl(this._self, this._then);

  final _ConnectionsListResponse _self;
  final $Res Function(_ConnectionsListResponse) _then;

/// Create a copy of ConnectionsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_ConnectionsListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ConnectionsListData?,
  ));
}

/// Create a copy of ConnectionsListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionsListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionsListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ConnectionsListData {

 List<ConnectedAthlete> get connections; int get count;
/// Create a copy of ConnectionsListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionsListDataCopyWith<ConnectionsListData> get copyWith => _$ConnectionsListDataCopyWithImpl<ConnectionsListData>(this as ConnectionsListData, _$identity);

  /// Serializes this ConnectionsListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionsListData&&const DeepCollectionEquality().equals(other.connections, connections)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(connections),count);

@override
String toString() {
  return 'ConnectionsListData(connections: $connections, count: $count)';
}


}

/// @nodoc
abstract mixin class $ConnectionsListDataCopyWith<$Res>  {
  factory $ConnectionsListDataCopyWith(ConnectionsListData value, $Res Function(ConnectionsListData) _then) = _$ConnectionsListDataCopyWithImpl;
@useResult
$Res call({
 List<ConnectedAthlete> connections, int count
});




}
/// @nodoc
class _$ConnectionsListDataCopyWithImpl<$Res>
    implements $ConnectionsListDataCopyWith<$Res> {
  _$ConnectionsListDataCopyWithImpl(this._self, this._then);

  final ConnectionsListData _self;
  final $Res Function(ConnectionsListData) _then;

/// Create a copy of ConnectionsListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connections = null,Object? count = null,}) {
  return _then(_self.copyWith(
connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectedAthlete>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionsListData].
extension ConnectionsListDataPatterns on ConnectionsListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionsListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionsListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionsListData value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionsListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionsListData value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionsListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ConnectedAthlete> connections,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionsListData() when $default != null:
return $default(_that.connections,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ConnectedAthlete> connections,  int count)  $default,) {final _that = this;
switch (_that) {
case _ConnectionsListData():
return $default(_that.connections,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ConnectedAthlete> connections,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionsListData() when $default != null:
return $default(_that.connections,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionsListData implements ConnectionsListData {
  const _ConnectionsListData({final  List<ConnectedAthlete> connections = const [], this.count = 0}): _connections = connections;
  factory _ConnectionsListData.fromJson(Map<String, dynamic> json) => _$ConnectionsListDataFromJson(json);

 final  List<ConnectedAthlete> _connections;
@override@JsonKey() List<ConnectedAthlete> get connections {
  if (_connections is EqualUnmodifiableListView) return _connections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connections);
}

@override@JsonKey() final  int count;

/// Create a copy of ConnectionsListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionsListDataCopyWith<_ConnectionsListData> get copyWith => __$ConnectionsListDataCopyWithImpl<_ConnectionsListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionsListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionsListData&&const DeepCollectionEquality().equals(other._connections, _connections)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_connections),count);

@override
String toString() {
  return 'ConnectionsListData(connections: $connections, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ConnectionsListDataCopyWith<$Res> implements $ConnectionsListDataCopyWith<$Res> {
  factory _$ConnectionsListDataCopyWith(_ConnectionsListData value, $Res Function(_ConnectionsListData) _then) = __$ConnectionsListDataCopyWithImpl;
@override @useResult
$Res call({
 List<ConnectedAthlete> connections, int count
});




}
/// @nodoc
class __$ConnectionsListDataCopyWithImpl<$Res>
    implements _$ConnectionsListDataCopyWith<$Res> {
  __$ConnectionsListDataCopyWithImpl(this._self, this._then);

  final _ConnectionsListData _self;
  final $Res Function(_ConnectionsListData) _then;

/// Create a copy of ConnectionsListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connections = null,Object? count = null,}) {
  return _then(_ConnectionsListData(
connections: null == connections ? _self._connections : connections // ignore: cast_nullable_to_non_nullable
as List<ConnectedAthlete>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ConnectionStatusResponse {

 bool get success; ConnectionStatus? get data;
/// Create a copy of ConnectionStatusResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionStatusResponseCopyWith<ConnectionStatusResponse> get copyWith => _$ConnectionStatusResponseCopyWithImpl<ConnectionStatusResponse>(this as ConnectionStatusResponse, _$identity);

  /// Serializes this ConnectionStatusResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionStatusResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'ConnectionStatusResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConnectionStatusResponseCopyWith<$Res>  {
  factory $ConnectionStatusResponseCopyWith(ConnectionStatusResponse value, $Res Function(ConnectionStatusResponse) _then) = _$ConnectionStatusResponseCopyWithImpl;
@useResult
$Res call({
 bool success, ConnectionStatus? data
});


$ConnectionStatusCopyWith<$Res>? get data;

}
/// @nodoc
class _$ConnectionStatusResponseCopyWithImpl<$Res>
    implements $ConnectionStatusResponseCopyWith<$Res> {
  _$ConnectionStatusResponseCopyWithImpl(this._self, this._then);

  final ConnectionStatusResponse _self;
  final $Res Function(ConnectionStatusResponse) _then;

/// Create a copy of ConnectionStatusResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ConnectionStatus?,
  ));
}
/// Create a copy of ConnectionStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionStatusCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionStatusCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionStatusResponse].
extension ConnectionStatusResponsePatterns on ConnectionStatusResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionStatusResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionStatusResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionStatusResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionStatusResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionStatusResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionStatusResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  ConnectionStatus? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionStatusResponse() when $default != null:
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  ConnectionStatus? data)  $default,) {final _that = this;
switch (_that) {
case _ConnectionStatusResponse():
return $default(_that.success,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  ConnectionStatus? data)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionStatusResponse() when $default != null:
return $default(_that.success,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionStatusResponse implements ConnectionStatusResponse {
  const _ConnectionStatusResponse({this.success = false, this.data});
  factory _ConnectionStatusResponse.fromJson(Map<String, dynamic> json) => _$ConnectionStatusResponseFromJson(json);

@override@JsonKey() final  bool success;
@override final  ConnectionStatus? data;

/// Create a copy of ConnectionStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionStatusResponseCopyWith<_ConnectionStatusResponse> get copyWith => __$ConnectionStatusResponseCopyWithImpl<_ConnectionStatusResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionStatusResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionStatusResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,data);

@override
String toString() {
  return 'ConnectionStatusResponse(success: $success, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ConnectionStatusResponseCopyWith<$Res> implements $ConnectionStatusResponseCopyWith<$Res> {
  factory _$ConnectionStatusResponseCopyWith(_ConnectionStatusResponse value, $Res Function(_ConnectionStatusResponse) _then) = __$ConnectionStatusResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, ConnectionStatus? data
});


@override $ConnectionStatusCopyWith<$Res>? get data;

}
/// @nodoc
class __$ConnectionStatusResponseCopyWithImpl<$Res>
    implements _$ConnectionStatusResponseCopyWith<$Res> {
  __$ConnectionStatusResponseCopyWithImpl(this._self, this._then);

  final _ConnectionStatusResponse _self;
  final $Res Function(_ConnectionStatusResponse) _then;

/// Create a copy of ConnectionStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = freezed,}) {
  return _then(_ConnectionStatusResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ConnectionStatus?,
  ));
}

/// Create a copy of ConnectionStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionStatusCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionStatusCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ConnectionActionResponse {

 bool get success; String get message; Connection? get data;
/// Create a copy of ConnectionActionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionActionResponseCopyWith<ConnectionActionResponse> get copyWith => _$ConnectionActionResponseCopyWithImpl<ConnectionActionResponse>(this as ConnectionActionResponse, _$identity);

  /// Serializes this ConnectionActionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionActionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ConnectionActionResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ConnectionActionResponseCopyWith<$Res>  {
  factory $ConnectionActionResponseCopyWith(ConnectionActionResponse value, $Res Function(ConnectionActionResponse) _then) = _$ConnectionActionResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Connection? data
});


$ConnectionCopyWith<$Res>? get data;

}
/// @nodoc
class _$ConnectionActionResponseCopyWithImpl<$Res>
    implements $ConnectionActionResponseCopyWith<$Res> {
  _$ConnectionActionResponseCopyWithImpl(this._self, this._then);

  final ConnectionActionResponse _self;
  final $Res Function(ConnectionActionResponse) _then;

/// Create a copy of ConnectionActionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Connection?,
  ));
}
/// Create a copy of ConnectionActionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionActionResponse].
extension ConnectionActionResponsePatterns on ConnectionActionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionActionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionActionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionActionResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionActionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionActionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionActionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Connection? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionActionResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Connection? data)  $default,) {final _that = this;
switch (_that) {
case _ConnectionActionResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Connection? data)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionActionResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionActionResponse implements ConnectionActionResponse {
  const _ConnectionActionResponse({this.success = false, this.message = '', this.data});
  factory _ConnectionActionResponse.fromJson(Map<String, dynamic> json) => _$ConnectionActionResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  Connection? data;

/// Create a copy of ConnectionActionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionActionResponseCopyWith<_ConnectionActionResponse> get copyWith => __$ConnectionActionResponseCopyWithImpl<_ConnectionActionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionActionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionActionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ConnectionActionResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ConnectionActionResponseCopyWith<$Res> implements $ConnectionActionResponseCopyWith<$Res> {
  factory _$ConnectionActionResponseCopyWith(_ConnectionActionResponse value, $Res Function(_ConnectionActionResponse) _then) = __$ConnectionActionResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Connection? data
});


@override $ConnectionCopyWith<$Res>? get data;

}
/// @nodoc
class __$ConnectionActionResponseCopyWithImpl<$Res>
    implements _$ConnectionActionResponseCopyWith<$Res> {
  __$ConnectionActionResponseCopyWithImpl(this._self, this._then);

  final _ConnectionActionResponse _self;
  final $Res Function(_ConnectionActionResponse) _then;

/// Create a copy of ConnectionActionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_ConnectionActionResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Connection?,
  ));
}

/// Create a copy of ConnectionActionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ConnectionCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
