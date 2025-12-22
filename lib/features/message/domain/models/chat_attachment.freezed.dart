// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_attachment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatAttachment {

 String get type; String get url; int? get size; String? get filename; int? get width; int? get height; int? get originalSize; int? get duration; String? get compressionRatio;
/// Create a copy of ChatAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatAttachmentCopyWith<ChatAttachment> get copyWith => _$ChatAttachmentCopyWithImpl<ChatAttachment>(this as ChatAttachment, _$identity);

  /// Serializes this ChatAttachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAttachment&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.size, size) || other.size == size)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.originalSize, originalSize) || other.originalSize == originalSize)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.compressionRatio, compressionRatio) || other.compressionRatio == compressionRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,url,size,filename,width,height,originalSize,duration,compressionRatio);

@override
String toString() {
  return 'ChatAttachment(type: $type, url: $url, size: $size, filename: $filename, width: $width, height: $height, originalSize: $originalSize, duration: $duration, compressionRatio: $compressionRatio)';
}


}

/// @nodoc
abstract mixin class $ChatAttachmentCopyWith<$Res>  {
  factory $ChatAttachmentCopyWith(ChatAttachment value, $Res Function(ChatAttachment) _then) = _$ChatAttachmentCopyWithImpl;
@useResult
$Res call({
 String type, String url, int? size, String? filename, int? width, int? height, int? originalSize, int? duration, String? compressionRatio
});




}
/// @nodoc
class _$ChatAttachmentCopyWithImpl<$Res>
    implements $ChatAttachmentCopyWith<$Res> {
  _$ChatAttachmentCopyWithImpl(this._self, this._then);

  final ChatAttachment _self;
  final $Res Function(ChatAttachment) _then;

/// Create a copy of ChatAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? url = null,Object? size = freezed,Object? filename = freezed,Object? width = freezed,Object? height = freezed,Object? originalSize = freezed,Object? duration = freezed,Object? compressionRatio = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,originalSize: freezed == originalSize ? _self.originalSize : originalSize // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,compressionRatio: freezed == compressionRatio ? _self.compressionRatio : compressionRatio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatAttachment].
extension ChatAttachmentPatterns on ChatAttachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatAttachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatAttachment value)  $default,){
final _that = this;
switch (_that) {
case _ChatAttachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _ChatAttachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String url,  int? size,  String? filename,  int? width,  int? height,  int? originalSize,  int? duration,  String? compressionRatio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatAttachment() when $default != null:
return $default(_that.type,_that.url,_that.size,_that.filename,_that.width,_that.height,_that.originalSize,_that.duration,_that.compressionRatio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String url,  int? size,  String? filename,  int? width,  int? height,  int? originalSize,  int? duration,  String? compressionRatio)  $default,) {final _that = this;
switch (_that) {
case _ChatAttachment():
return $default(_that.type,_that.url,_that.size,_that.filename,_that.width,_that.height,_that.originalSize,_that.duration,_that.compressionRatio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String url,  int? size,  String? filename,  int? width,  int? height,  int? originalSize,  int? duration,  String? compressionRatio)?  $default,) {final _that = this;
switch (_that) {
case _ChatAttachment() when $default != null:
return $default(_that.type,_that.url,_that.size,_that.filename,_that.width,_that.height,_that.originalSize,_that.duration,_that.compressionRatio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatAttachment implements ChatAttachment {
  const _ChatAttachment({required this.type, required this.url, required this.size, this.filename, this.width, this.height, this.originalSize, this.duration, this.compressionRatio});
  factory _ChatAttachment.fromJson(Map<String, dynamic> json) => _$ChatAttachmentFromJson(json);

@override final  String type;
@override final  String url;
@override final  int? size;
@override final  String? filename;
@override final  int? width;
@override final  int? height;
@override final  int? originalSize;
@override final  int? duration;
@override final  String? compressionRatio;

/// Create a copy of ChatAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatAttachmentCopyWith<_ChatAttachment> get copyWith => __$ChatAttachmentCopyWithImpl<_ChatAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatAttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatAttachment&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.size, size) || other.size == size)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.originalSize, originalSize) || other.originalSize == originalSize)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.compressionRatio, compressionRatio) || other.compressionRatio == compressionRatio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,url,size,filename,width,height,originalSize,duration,compressionRatio);

@override
String toString() {
  return 'ChatAttachment(type: $type, url: $url, size: $size, filename: $filename, width: $width, height: $height, originalSize: $originalSize, duration: $duration, compressionRatio: $compressionRatio)';
}


}

/// @nodoc
abstract mixin class _$ChatAttachmentCopyWith<$Res> implements $ChatAttachmentCopyWith<$Res> {
  factory _$ChatAttachmentCopyWith(_ChatAttachment value, $Res Function(_ChatAttachment) _then) = __$ChatAttachmentCopyWithImpl;
@override @useResult
$Res call({
 String type, String url, int? size, String? filename, int? width, int? height, int? originalSize, int? duration, String? compressionRatio
});




}
/// @nodoc
class __$ChatAttachmentCopyWithImpl<$Res>
    implements _$ChatAttachmentCopyWith<$Res> {
  __$ChatAttachmentCopyWithImpl(this._self, this._then);

  final _ChatAttachment _self;
  final $Res Function(_ChatAttachment) _then;

/// Create a copy of ChatAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? url = null,Object? size = freezed,Object? filename = freezed,Object? width = freezed,Object? height = freezed,Object? originalSize = freezed,Object? duration = freezed,Object? compressionRatio = freezed,}) {
  return _then(_ChatAttachment(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int?,originalSize: freezed == originalSize ? _self.originalSize : originalSize // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,compressionRatio: freezed == compressionRatio ? _self.compressionRatio : compressionRatio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
