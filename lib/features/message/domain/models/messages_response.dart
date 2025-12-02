import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/features/message/domain/models/pagination_meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_response.freezed.dart';
part 'messages_response.g.dart';

@freezed
abstract class MessagesResponse with _$MessagesResponse {
  const factory MessagesResponse({
    required bool success,
    required List<ChatMessage> data,
    required PaginationMeta pagination,
  }) = _MessagesResponse;

  factory MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseFromJson(json);
}
