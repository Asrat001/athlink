// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    _SendMessageRequest(
      conversationId: json['conversationId'] as String,
      receiverId: json['receiverId'] as String,
      type: json['type'] as String,
      content: json['content'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      fileName: json['fileName'] as String?,
      fileSize: json['fileSize'] as String?,
      fileType: json['fileType'] as String?,
      duration: json['duration'] == null
          ? null
          : Duration(microseconds: (json['duration'] as num).toInt()),
      proposalId: json['proposalId'] as String?,
      meetLink: json['meetLink'] as String?,
    );

Map<String, dynamic> _$SendMessageRequestToJson(_SendMessageRequest instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'receiverId': instance.receiverId,
      'type': instance.type,
      'content': instance.content,
      'mediaUrl': instance.mediaUrl,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'fileType': instance.fileType,
      'duration': instance.duration?.inMicroseconds,
      'proposalId': instance.proposalId,
      'meetLink': instance.meetLink,
    };
