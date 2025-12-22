// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  id: json['_id'] as String,
  conversationId: json['conversationId'] as String,
  sender: MessageSender.fromJson(json['sender'] as Map<String, dynamic>),
  content: json['content'] as String,
  type: json['type'] as String,
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => ChatAttachment.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as String? ?? 'sent',
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  proposalId: json['proposalId'] as String?,
  proposalTitle: json['proposalTitle'] as String?,
  proposalSubtitle: json['proposalSubtitle'] as String?,
  proposalLogo: json['proposalLogo'] as String?,
  meetLink: json['meetLink'] as String?,
  meetThumbnail: json['meetThumbnail'] as String?,
  fileName: json['fileName'] as String?,
  fileSize: json['fileSize'] as String?,
  fileType: json['fileType'] as String?,
  audioPath: json['audioPath'] as String?,
  duration: json['duration'] == null
      ? null
      : Duration(microseconds: (json['duration'] as num).toInt()),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'conversationId': instance.conversationId,
      'sender': instance.sender,
      'content': instance.content,
      'type': instance.type,
      'media': instance.media,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'proposalId': instance.proposalId,
      'proposalTitle': instance.proposalTitle,
      'proposalSubtitle': instance.proposalSubtitle,
      'proposalLogo': instance.proposalLogo,
      'meetLink': instance.meetLink,
      'meetThumbnail': instance.meetThumbnail,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'fileType': instance.fileType,
      'audioPath': instance.audioPath,
      'duration': instance.duration?.inMicroseconds,
    };
