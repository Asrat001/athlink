// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_message_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendMessageRequest {

 String get conversationId; String get receiverId; String get type;// 'text', 'image', 'file', etc.
 String? get content; String? get mediaUrl; String? get fileName; String? get fileSize; String? get fileType; Duration? get duration; String? get proposalId; String? get meetLink;
/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageRequestCopyWith<SendMessageRequest> get copyWith => _$SendMessageRequestCopyWithImpl<SendMessageRequest>(this as SendMessageRequest, _$identity);

  /// Serializes this SendMessageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageRequest&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&(identical(other.meetLink, meetLink) || other.meetLink == meetLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,receiverId,type,content,mediaUrl,fileName,fileSize,fileType,duration,proposalId,meetLink);

@override
String toString() {
  return 'SendMessageRequest(conversationId: $conversationId, receiverId: $receiverId, type: $type, content: $content, mediaUrl: $mediaUrl, fileName: $fileName, fileSize: $fileSize, fileType: $fileType, duration: $duration, proposalId: $proposalId, meetLink: $meetLink)';
}


}

/// @nodoc
abstract mixin class $SendMessageRequestCopyWith<$Res>  {
  factory $SendMessageRequestCopyWith(SendMessageRequest value, $Res Function(SendMessageRequest) _then) = _$SendMessageRequestCopyWithImpl;
@useResult
$Res call({
 String conversationId, String receiverId, String type, String? content, String? mediaUrl, String? fileName, String? fileSize, String? fileType, Duration? duration, String? proposalId, String? meetLink
});




}
/// @nodoc
class _$SendMessageRequestCopyWithImpl<$Res>
    implements $SendMessageRequestCopyWith<$Res> {
  _$SendMessageRequestCopyWithImpl(this._self, this._then);

  final SendMessageRequest _self;
  final $Res Function(SendMessageRequest) _then;

/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? receiverId = null,Object? type = null,Object? content = freezed,Object? mediaUrl = freezed,Object? fileName = freezed,Object? fileSize = freezed,Object? fileType = freezed,Object? duration = freezed,Object? proposalId = freezed,Object? meetLink = freezed,}) {
  return _then(_self.copyWith(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as String?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,proposalId: freezed == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String?,meetLink: freezed == meetLink ? _self.meetLink : meetLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMessageRequest].
extension SendMessageRequestPatterns on SendMessageRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageRequest value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId,  String receiverId,  String type,  String? content,  String? mediaUrl,  String? fileName,  String? fileSize,  String? fileType,  Duration? duration,  String? proposalId,  String? meetLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
return $default(_that.conversationId,_that.receiverId,_that.type,_that.content,_that.mediaUrl,_that.fileName,_that.fileSize,_that.fileType,_that.duration,_that.proposalId,_that.meetLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId,  String receiverId,  String type,  String? content,  String? mediaUrl,  String? fileName,  String? fileSize,  String? fileType,  Duration? duration,  String? proposalId,  String? meetLink)  $default,) {final _that = this;
switch (_that) {
case _SendMessageRequest():
return $default(_that.conversationId,_that.receiverId,_that.type,_that.content,_that.mediaUrl,_that.fileName,_that.fileSize,_that.fileType,_that.duration,_that.proposalId,_that.meetLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId,  String receiverId,  String type,  String? content,  String? mediaUrl,  String? fileName,  String? fileSize,  String? fileType,  Duration? duration,  String? proposalId,  String? meetLink)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
return $default(_that.conversationId,_that.receiverId,_that.type,_that.content,_that.mediaUrl,_that.fileName,_that.fileSize,_that.fileType,_that.duration,_that.proposalId,_that.meetLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageRequest implements SendMessageRequest {
  const _SendMessageRequest({required this.conversationId, required this.receiverId, required this.type, this.content, this.mediaUrl, this.fileName, this.fileSize, this.fileType, this.duration, this.proposalId, this.meetLink});
  factory _SendMessageRequest.fromJson(Map<String, dynamic> json) => _$SendMessageRequestFromJson(json);

@override final  String conversationId;
@override final  String receiverId;
@override final  String type;
// 'text', 'image', 'file', etc.
@override final  String? content;
@override final  String? mediaUrl;
@override final  String? fileName;
@override final  String? fileSize;
@override final  String? fileType;
@override final  Duration? duration;
@override final  String? proposalId;
@override final  String? meetLink;

/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageRequestCopyWith<_SendMessageRequest> get copyWith => __$SendMessageRequestCopyWithImpl<_SendMessageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageRequest&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&(identical(other.meetLink, meetLink) || other.meetLink == meetLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,receiverId,type,content,mediaUrl,fileName,fileSize,fileType,duration,proposalId,meetLink);

@override
String toString() {
  return 'SendMessageRequest(conversationId: $conversationId, receiverId: $receiverId, type: $type, content: $content, mediaUrl: $mediaUrl, fileName: $fileName, fileSize: $fileSize, fileType: $fileType, duration: $duration, proposalId: $proposalId, meetLink: $meetLink)';
}


}

/// @nodoc
abstract mixin class _$SendMessageRequestCopyWith<$Res> implements $SendMessageRequestCopyWith<$Res> {
  factory _$SendMessageRequestCopyWith(_SendMessageRequest value, $Res Function(_SendMessageRequest) _then) = __$SendMessageRequestCopyWithImpl;
@override @useResult
$Res call({
 String conversationId, String receiverId, String type, String? content, String? mediaUrl, String? fileName, String? fileSize, String? fileType, Duration? duration, String? proposalId, String? meetLink
});




}
/// @nodoc
class __$SendMessageRequestCopyWithImpl<$Res>
    implements _$SendMessageRequestCopyWith<$Res> {
  __$SendMessageRequestCopyWithImpl(this._self, this._then);

  final _SendMessageRequest _self;
  final $Res Function(_SendMessageRequest) _then;

/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? receiverId = null,Object? type = null,Object? content = freezed,Object? mediaUrl = freezed,Object? fileName = freezed,Object? fileSize = freezed,Object? fileType = freezed,Object? duration = freezed,Object? proposalId = freezed,Object? meetLink = freezed,}) {
  return _then(_SendMessageRequest(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as String?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,proposalId: freezed == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String?,meetLink: freezed == meetLink ? _self.meetLink : meetLink // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
