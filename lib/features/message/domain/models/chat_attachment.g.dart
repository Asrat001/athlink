// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatAttachment _$ChatAttachmentFromJson(Map<String, dynamic> json) =>
    _ChatAttachment(
      type: json['type'] as String,
      url: json['url'] as String,
      size: (json['size'] as num?)?.toInt(),
      filename: json['filename'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      originalSize: (json['originalSize'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      compressionRatio: json['compressionRatio'] as String?,
    );

Map<String, dynamic> _$ChatAttachmentToJson(_ChatAttachment instance) =>
    <String, dynamic>{
      'type': instance.type,
      'url': instance.url,
      'size': instance.size,
      'filename': instance.filename,
      'width': instance.width,
      'height': instance.height,
      'originalSize': instance.originalSize,
      'duration': instance.duration,
      'compressionRatio': instance.compressionRatio,
    };
