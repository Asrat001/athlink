// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionData {

@JsonKey(name: '_id') String get id; String get requester; String get recipient; String get status; String get requestedAt;
/// Create a copy of ConnectionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionDataCopyWith<ConnectionData> get copyWith => _$ConnectionDataCopyWithImpl<ConnectionData>(this as ConnectionData, _$identity);

  /// Serializes this ConnectionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionData&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt);

@override
String toString() {
  return 'ConnectionData(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class $ConnectionDataCopyWith<$Res>  {
  factory $ConnectionDataCopyWith(ConnectionData value, $Res Function(ConnectionData) _then) = _$ConnectionDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String requester, String recipient, String status, String requestedAt
});




}
/// @nodoc
class _$ConnectionDataCopyWithImpl<$Res>
    implements $ConnectionDataCopyWith<$Res> {
  _$ConnectionDataCopyWithImpl(this._self, this._then);

  final ConnectionData _self;
  final $Res Function(ConnectionData) _then;

/// Create a copy of ConnectionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requester = null,Object? recipient = null,Object? status = null,Object? requestedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionData].
extension ConnectionDataPatterns on ConnectionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionData value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionData value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String requester,  String recipient,  String status,  String requestedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionData() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String requester,  String recipient,  String status,  String requestedAt)  $default,) {final _that = this;
switch (_that) {
case _ConnectionData():
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String requester,  String recipient,  String status,  String requestedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionData() when $default != null:
return $default(_that.id,_that.requester,_that.recipient,_that.status,_that.requestedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionData implements ConnectionData {
  const _ConnectionData({@JsonKey(name: '_id') required this.id, required this.requester, required this.recipient, required this.status, required this.requestedAt});
  factory _ConnectionData.fromJson(Map<String, dynamic> json) => _$ConnectionDataFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String requester;
@override final  String recipient;
@override final  String status;
@override final  String requestedAt;

/// Create a copy of ConnectionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionDataCopyWith<_ConnectionData> get copyWith => __$ConnectionDataCopyWithImpl<_ConnectionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionData&&(identical(other.id, id) || other.id == id)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.recipient, recipient) || other.recipient == recipient)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requester,recipient,status,requestedAt);

@override
String toString() {
  return 'ConnectionData(id: $id, requester: $requester, recipient: $recipient, status: $status, requestedAt: $requestedAt)';
}


}

/// @nodoc
abstract mixin class _$ConnectionDataCopyWith<$Res> implements $ConnectionDataCopyWith<$Res> {
  factory _$ConnectionDataCopyWith(_ConnectionData value, $Res Function(_ConnectionData) _then) = __$ConnectionDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String requester, String recipient, String status, String requestedAt
});




}
/// @nodoc
class __$ConnectionDataCopyWithImpl<$Res>
    implements _$ConnectionDataCopyWith<$Res> {
  __$ConnectionDataCopyWithImpl(this._self, this._then);

  final _ConnectionData _self;
  final $Res Function(_ConnectionData) _then;

/// Create a copy of ConnectionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requester = null,Object? recipient = null,Object? status = null,Object? requestedAt = null,}) {
  return _then(_ConnectionData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as String,recipient: null == recipient ? _self.recipient : recipient // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ConnectionResponse {

 bool get success; String get message; ConnectionData? get connection;
/// Create a copy of ConnectionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionResponseCopyWith<ConnectionResponse> get copyWith => _$ConnectionResponseCopyWithImpl<ConnectionResponse>(this as ConnectionResponse, _$identity);

  /// Serializes this ConnectionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.connection, connection) || other.connection == connection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,connection);

@override
String toString() {
  return 'ConnectionResponse(success: $success, message: $message, connection: $connection)';
}


}

/// @nodoc
abstract mixin class $ConnectionResponseCopyWith<$Res>  {
  factory $ConnectionResponseCopyWith(ConnectionResponse value, $Res Function(ConnectionResponse) _then) = _$ConnectionResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, ConnectionData? connection
});


$ConnectionDataCopyWith<$Res>? get connection;

}
/// @nodoc
class _$ConnectionResponseCopyWithImpl<$Res>
    implements $ConnectionResponseCopyWith<$Res> {
  _$ConnectionResponseCopyWithImpl(this._self, this._then);

  final ConnectionResponse _self;
  final $Res Function(ConnectionResponse) _then;

/// Create a copy of ConnectionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? connection = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,connection: freezed == connection ? _self.connection : connection // ignore: cast_nullable_to_non_nullable
as ConnectionData?,
  ));
}
/// Create a copy of ConnectionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionDataCopyWith<$Res>? get connection {
    if (_self.connection == null) {
    return null;
  }

  return $ConnectionDataCopyWith<$Res>(_self.connection!, (value) {
    return _then(_self.copyWith(connection: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConnectionResponse].
extension ConnectionResponsePatterns on ConnectionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionResponse value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  ConnectionData? connection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionResponse() when $default != null:
return $default(_that.success,_that.message,_that.connection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  ConnectionData? connection)  $default,) {final _that = this;
switch (_that) {
case _ConnectionResponse():
return $default(_that.success,_that.message,_that.connection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  ConnectionData? connection)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionResponse() when $default != null:
return $default(_that.success,_that.message,_that.connection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionResponse implements ConnectionResponse {
  const _ConnectionResponse({this.success = false, this.message = '', this.connection});
  factory _ConnectionResponse.fromJson(Map<String, dynamic> json) => _$ConnectionResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  ConnectionData? connection;

/// Create a copy of ConnectionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionResponseCopyWith<_ConnectionResponse> get copyWith => __$ConnectionResponseCopyWithImpl<_ConnectionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.connection, connection) || other.connection == connection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,connection);

@override
String toString() {
  return 'ConnectionResponse(success: $success, message: $message, connection: $connection)';
}


}

/// @nodoc
abstract mixin class _$ConnectionResponseCopyWith<$Res> implements $ConnectionResponseCopyWith<$Res> {
  factory _$ConnectionResponseCopyWith(_ConnectionResponse value, $Res Function(_ConnectionResponse) _then) = __$ConnectionResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, ConnectionData? connection
});


@override $ConnectionDataCopyWith<$Res>? get connection;

}
/// @nodoc
class __$ConnectionResponseCopyWithImpl<$Res>
    implements _$ConnectionResponseCopyWith<$Res> {
  __$ConnectionResponseCopyWithImpl(this._self, this._then);

  final _ConnectionResponse _self;
  final $Res Function(_ConnectionResponse) _then;

/// Create a copy of ConnectionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? connection = freezed,}) {
  return _then(_ConnectionResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,connection: freezed == connection ? _self.connection : connection // ignore: cast_nullable_to_non_nullable
as ConnectionData?,
  ));
}

/// Create a copy of ConnectionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConnectionDataCopyWith<$Res>? get connection {
    if (_self.connection == null) {
    return null;
  }

  return $ConnectionDataCopyWith<$Res>(_self.connection!, (value) {
    return _then(_self.copyWith(connection: value));
  });
}
}

// dart format on
