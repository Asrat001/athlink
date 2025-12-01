// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessagesResponse {

 bool get success; List<ChatMessage> get data; PaginationMeta get pagination;
/// Create a copy of MessagesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesResponseCopyWith<MessagesResponse> get copyWith => _$MessagesResponseCopyWithImpl<MessagesResponse>(this as MessagesResponse, _$identity);

  /// Serializes this MessagesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(data),pagination);

@override
String toString() {
  return 'MessagesResponse(success: $success, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class $MessagesResponseCopyWith<$Res>  {
  factory $MessagesResponseCopyWith(MessagesResponse value, $Res Function(MessagesResponse) _then) = _$MessagesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<ChatMessage> data, PaginationMeta pagination
});


$PaginationMetaCopyWith<$Res> get pagination;

}
/// @nodoc
class _$MessagesResponseCopyWithImpl<$Res>
    implements $MessagesResponseCopyWith<$Res> {
  _$MessagesResponseCopyWithImpl(this._self, this._then);

  final MessagesResponse _self;
  final $Res Function(MessagesResponse) _then;

/// Create a copy of MessagesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? data = null,Object? pagination = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}
/// Create a copy of MessagesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}


/// Adds pattern-matching-related methods to [MessagesResponse].
extension MessagesResponsePatterns on MessagesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesResponse value)  $default,){
final _that = this;
switch (_that) {
case _MessagesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<ChatMessage> data,  PaginationMeta pagination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesResponse() when $default != null:
return $default(_that.success,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<ChatMessage> data,  PaginationMeta pagination)  $default,) {final _that = this;
switch (_that) {
case _MessagesResponse():
return $default(_that.success,_that.data,_that.pagination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<ChatMessage> data,  PaginationMeta pagination)?  $default,) {final _that = this;
switch (_that) {
case _MessagesResponse() when $default != null:
return $default(_that.success,_that.data,_that.pagination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagesResponse implements MessagesResponse {
  const _MessagesResponse({required this.success, required final  List<ChatMessage> data, required this.pagination}): _data = data;
  factory _MessagesResponse.fromJson(Map<String, dynamic> json) => _$MessagesResponseFromJson(json);

@override final  bool success;
 final  List<ChatMessage> _data;
@override List<ChatMessage> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  PaginationMeta pagination;

/// Create a copy of MessagesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesResponseCopyWith<_MessagesResponse> get copyWith => __$MessagesResponseCopyWithImpl<_MessagesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.pagination, pagination) || other.pagination == pagination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_data),pagination);

@override
String toString() {
  return 'MessagesResponse(success: $success, data: $data, pagination: $pagination)';
}


}

/// @nodoc
abstract mixin class _$MessagesResponseCopyWith<$Res> implements $MessagesResponseCopyWith<$Res> {
  factory _$MessagesResponseCopyWith(_MessagesResponse value, $Res Function(_MessagesResponse) _then) = __$MessagesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<ChatMessage> data, PaginationMeta pagination
});


@override $PaginationMetaCopyWith<$Res> get pagination;

}
/// @nodoc
class __$MessagesResponseCopyWithImpl<$Res>
    implements _$MessagesResponseCopyWith<$Res> {
  __$MessagesResponseCopyWithImpl(this._self, this._then);

  final _MessagesResponse _self;
  final $Res Function(_MessagesResponse) _then;

/// Create a copy of MessagesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? data = null,Object? pagination = null,}) {
  return _then(_MessagesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,pagination: null == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta,
  ));
}

/// Create a copy of MessagesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res> get pagination {
  
  return $PaginationMetaCopyWith<$Res>(_self.pagination, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}
}

// dart format on
