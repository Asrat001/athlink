import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_attachment.freezed.dart';
part 'chat_attachment.g.dart';

@freezed
abstract class ChatAttachment with _$ChatAttachment {
  const factory ChatAttachment({
    required String type,
    required String url,
    required int? size,
    String? filename,
    int? width,
    int? height,
    int? originalSize,
    int? duration,
    String? compressionRatio,
  }) = _ChatAttachment;

  factory ChatAttachment.fromJson(Map<String, dynamic> json) =>
      _$ChatAttachmentFromJson(json);
}
