// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['_id'] as String,
      participant: Participant.fromJson(
        json['participant'] as Map<String, dynamic>,
      ),
      unreadCount: (json['unreadCount'] as num).toInt(),
      lastMessage: json['lastMessage'] == null
          ? null
          : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'participant': instance.participant,
      'unreadCount': instance.unreadCount,
      'lastMessage': instance.lastMessage,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_Participant _$ParticipantFromJson(Map<String, dynamic> json) => _Participant(
  id: json['_id'] as String,
  name: json['name'] as String,
  profileImage: json['profileImage'] as String? ?? "",
  email: json['email'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$ParticipantToJson(_Participant instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'role': instance.role,
    };

_LastMessage _$LastMessageFromJson(Map<String, dynamic> json) => _LastMessage(
  id: json['_id'] as String?,
  content: json['content'] as String,
  type: json['type'] as String,
  mediaUrl: json['mediaUrl'] as String?,
  sender: json['sender'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$LastMessageToJson(_LastMessage instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'type': instance.type,
      'mediaUrl': instance.mediaUrl,
      'sender': instance.sender,
      'createdAt': instance.createdAt.toIso8601String(),
    };
