// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessage {

@JsonKey(name: '_id') String get id; String get conversationId; MessageSender get sender; String get content; String get type;// 'text', 'image', 'file', etc.
 List<ChatAttachment>? get media; String get status;// 'sent', 'delivered', 'read'
 DateTime get createdAt; DateTime get updatedAt;// UI-specific fields for special message types
 String? get proposalId; String? get proposalTitle; String? get proposalSubtitle; String? get proposalLogo; String? get meetLink; String? get meetThumbnail; String? get fileName; String? get fileSize; String? get fileType; String? get audioPath; Duration? get duration;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&(identical(other.proposalTitle, proposalTitle) || other.proposalTitle == proposalTitle)&&(identical(other.proposalSubtitle, proposalSubtitle) || other.proposalSubtitle == proposalSubtitle)&&(identical(other.proposalLogo, proposalLogo) || other.proposalLogo == proposalLogo)&&(identical(other.meetLink, meetLink) || other.meetLink == meetLink)&&(identical(other.meetThumbnail, meetThumbnail) || other.meetThumbnail == meetThumbnail)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,conversationId,sender,content,type,const DeepCollectionEquality().hash(media),status,createdAt,updatedAt,proposalId,proposalTitle,proposalSubtitle,proposalLogo,meetLink,meetThumbnail,fileName,fileSize,fileType,audioPath,duration]);

@override
String toString() {
  return 'ChatMessage(id: $id, conversationId: $conversationId, sender: $sender, content: $content, type: $type, media: $media, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, proposalId: $proposalId, proposalTitle: $proposalTitle, proposalSubtitle: $proposalSubtitle, proposalLogo: $proposalLogo, meetLink: $meetLink, meetThumbnail: $meetThumbnail, fileName: $fileName, fileSize: $fileSize, fileType: $fileType, audioPath: $audioPath, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String conversationId, MessageSender sender, String content, String type, List<ChatAttachment>? media, String status, DateTime createdAt, DateTime updatedAt, String? proposalId, String? proposalTitle, String? proposalSubtitle, String? proposalLogo, String? meetLink, String? meetThumbnail, String? fileName, String? fileSize, String? fileType, String? audioPath, Duration? duration
});


$MessageSenderCopyWith<$Res> get sender;

}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? sender = null,Object? content = null,Object? type = null,Object? media = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? proposalId = freezed,Object? proposalTitle = freezed,Object? proposalSubtitle = freezed,Object? proposalLogo = freezed,Object? meetLink = freezed,Object? meetThumbnail = freezed,Object? fileName = freezed,Object? fileSize = freezed,Object? fileType = freezed,Object? audioPath = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSender,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<ChatAttachment>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,proposalId: freezed == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String?,proposalTitle: freezed == proposalTitle ? _self.proposalTitle : proposalTitle // ignore: cast_nullable_to_non_nullable
as String?,proposalSubtitle: freezed == proposalSubtitle ? _self.proposalSubtitle : proposalSubtitle // ignore: cast_nullable_to_non_nullable
as String?,proposalLogo: freezed == proposalLogo ? _self.proposalLogo : proposalLogo // ignore: cast_nullable_to_non_nullable
as String?,meetLink: freezed == meetLink ? _self.meetLink : meetLink // ignore: cast_nullable_to_non_nullable
as String?,meetThumbnail: freezed == meetThumbnail ? _self.meetThumbnail : meetThumbnail // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as String?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageSenderCopyWith<$Res> get sender {
  
  return $MessageSenderCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String conversationId,  MessageSender sender,  String content,  String type,  List<ChatAttachment>? media,  String status,  DateTime createdAt,  DateTime updatedAt,  String? proposalId,  String? proposalTitle,  String? proposalSubtitle,  String? proposalLogo,  String? meetLink,  String? meetThumbnail,  String? fileName,  String? fileSize,  String? fileType,  String? audioPath,  Duration? duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.conversationId,_that.sender,_that.content,_that.type,_that.media,_that.status,_that.createdAt,_that.updatedAt,_that.proposalId,_that.proposalTitle,_that.proposalSubtitle,_that.proposalLogo,_that.meetLink,_that.meetThumbnail,_that.fileName,_that.fileSize,_that.fileType,_that.audioPath,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String conversationId,  MessageSender sender,  String content,  String type,  List<ChatAttachment>? media,  String status,  DateTime createdAt,  DateTime updatedAt,  String? proposalId,  String? proposalTitle,  String? proposalSubtitle,  String? proposalLogo,  String? meetLink,  String? meetThumbnail,  String? fileName,  String? fileSize,  String? fileType,  String? audioPath,  Duration? duration)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.conversationId,_that.sender,_that.content,_that.type,_that.media,_that.status,_that.createdAt,_that.updatedAt,_that.proposalId,_that.proposalTitle,_that.proposalSubtitle,_that.proposalLogo,_that.meetLink,_that.meetThumbnail,_that.fileName,_that.fileSize,_that.fileType,_that.audioPath,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String conversationId,  MessageSender sender,  String content,  String type,  List<ChatAttachment>? media,  String status,  DateTime createdAt,  DateTime updatedAt,  String? proposalId,  String? proposalTitle,  String? proposalSubtitle,  String? proposalLogo,  String? meetLink,  String? meetThumbnail,  String? fileName,  String? fileSize,  String? fileType,  String? audioPath,  Duration? duration)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.conversationId,_that.sender,_that.content,_that.type,_that.media,_that.status,_that.createdAt,_that.updatedAt,_that.proposalId,_that.proposalTitle,_that.proposalSubtitle,_that.proposalLogo,_that.meetLink,_that.meetThumbnail,_that.fileName,_that.fileSize,_that.fileType,_that.audioPath,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage extends ChatMessage {
  const _ChatMessage({@JsonKey(name: '_id') required this.id, required this.conversationId, required this.sender, required this.content, required this.type, final  List<ChatAttachment>? media, this.status = 'sent', required this.createdAt, required this.updatedAt, this.proposalId, this.proposalTitle, this.proposalSubtitle, this.proposalLogo, this.meetLink, this.meetThumbnail, this.fileName, this.fileSize, this.fileType, this.audioPath, this.duration}): _media = media,super._();
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String conversationId;
@override final  MessageSender sender;
@override final  String content;
@override final  String type;
// 'text', 'image', 'file', etc.
 final  List<ChatAttachment>? _media;
// 'text', 'image', 'file', etc.
@override List<ChatAttachment>? get media {
  final value = _media;
  if (value == null) return null;
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  String status;
// 'sent', 'delivered', 'read'
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// UI-specific fields for special message types
@override final  String? proposalId;
@override final  String? proposalTitle;
@override final  String? proposalSubtitle;
@override final  String? proposalLogo;
@override final  String? meetLink;
@override final  String? meetThumbnail;
@override final  String? fileName;
@override final  String? fileSize;
@override final  String? fileType;
@override final  String? audioPath;
@override final  Duration? duration;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.sender, sender) || other.sender == sender)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.proposalId, proposalId) || other.proposalId == proposalId)&&(identical(other.proposalTitle, proposalTitle) || other.proposalTitle == proposalTitle)&&(identical(other.proposalSubtitle, proposalSubtitle) || other.proposalSubtitle == proposalSubtitle)&&(identical(other.proposalLogo, proposalLogo) || other.proposalLogo == proposalLogo)&&(identical(other.meetLink, meetLink) || other.meetLink == meetLink)&&(identical(other.meetThumbnail, meetThumbnail) || other.meetThumbnail == meetThumbnail)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,conversationId,sender,content,type,const DeepCollectionEquality().hash(_media),status,createdAt,updatedAt,proposalId,proposalTitle,proposalSubtitle,proposalLogo,meetLink,meetThumbnail,fileName,fileSize,fileType,audioPath,duration]);

@override
String toString() {
  return 'ChatMessage(id: $id, conversationId: $conversationId, sender: $sender, content: $content, type: $type, media: $media, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, proposalId: $proposalId, proposalTitle: $proposalTitle, proposalSubtitle: $proposalSubtitle, proposalLogo: $proposalLogo, meetLink: $meetLink, meetThumbnail: $meetThumbnail, fileName: $fileName, fileSize: $fileSize, fileType: $fileType, audioPath: $audioPath, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String conversationId, MessageSender sender, String content, String type, List<ChatAttachment>? media, String status, DateTime createdAt, DateTime updatedAt, String? proposalId, String? proposalTitle, String? proposalSubtitle, String? proposalLogo, String? meetLink, String? meetThumbnail, String? fileName, String? fileSize, String? fileType, String? audioPath, Duration? duration
});


@override $MessageSenderCopyWith<$Res> get sender;

}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? sender = null,Object? content = null,Object? type = null,Object? media = freezed,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? proposalId = freezed,Object? proposalTitle = freezed,Object? proposalSubtitle = freezed,Object? proposalLogo = freezed,Object? meetLink = freezed,Object? meetThumbnail = freezed,Object? fileName = freezed,Object? fileSize = freezed,Object? fileType = freezed,Object? audioPath = freezed,Object? duration = freezed,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,sender: null == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as MessageSender,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,media: freezed == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<ChatAttachment>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,proposalId: freezed == proposalId ? _self.proposalId : proposalId // ignore: cast_nullable_to_non_nullable
as String?,proposalTitle: freezed == proposalTitle ? _self.proposalTitle : proposalTitle // ignore: cast_nullable_to_non_nullable
as String?,proposalSubtitle: freezed == proposalSubtitle ? _self.proposalSubtitle : proposalSubtitle // ignore: cast_nullable_to_non_nullable
as String?,proposalLogo: freezed == proposalLogo ? _self.proposalLogo : proposalLogo // ignore: cast_nullable_to_non_nullable
as String?,meetLink: freezed == meetLink ? _self.meetLink : meetLink // ignore: cast_nullable_to_non_nullable
as String?,meetThumbnail: freezed == meetThumbnail ? _self.meetThumbnail : meetThumbnail // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,fileSize: freezed == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as String?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,audioPath: freezed == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageSenderCopyWith<$Res> get sender {
  
  return $MessageSenderCopyWith<$Res>(_self.sender, (value) {
    return _then(_self.copyWith(sender: value));
  });
}
}

// dart format on
