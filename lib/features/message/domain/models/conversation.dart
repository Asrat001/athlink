import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    @JsonKey(name: '_id') required String id,
    required Participant participant,
    required int unreadCount,
    LastMessage? lastMessage,
    DateTime? updatedAt,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}

@freezed
abstract class Participant with _$Participant {
  const factory Participant({
    @JsonKey(name: '_id') required String id,
    required String name,
    @Default("") String profileImage,
    required String email,
    required String role,

  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

@freezed
abstract class LastMessage with _$LastMessage {
  const factory LastMessage({
    @JsonKey(name: '_id') String? id,
    required String content,
    required String type,
    String? mediaUrl,
    required String sender,
    required DateTime createdAt,
   
  }) = _LastMessage;

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);
}
