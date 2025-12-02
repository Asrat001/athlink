import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_sender.freezed.dart';
part 'message_sender.g.dart';

@freezed
abstract class MessageSender with _$MessageSender {
  const factory MessageSender({
    @JsonKey(name: '_id') required String id,
    @Default('') String name,
    required String email,
    required String role,
    @Default('') String profileImage,
  }) = _MessageSender;

  factory MessageSender.fromJson(Map<String, dynamic> json) =>
      _$MessageSenderFromJson(json);
}
