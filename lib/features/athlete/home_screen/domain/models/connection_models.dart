import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_models.freezed.dart';
part 'connection_models.g.dart';

@freezed
abstract class ConnectionData with _$ConnectionData {
  const factory ConnectionData({
    @JsonKey(name: '_id') required String id,
    required String requester,
    required String recipient,
    required String status,
    required String requestedAt,
  }) = _ConnectionData;

  factory ConnectionData.fromJson(Map<String, dynamic> json) =>
      _$ConnectionDataFromJson(json);
}

@freezed
abstract class ConnectionResponse with _$ConnectionResponse {
  const factory ConnectionResponse({
    @Default(false) bool success,
    @Default('') String message,
    ConnectionData? connection,
  }) = _ConnectionResponse;

  factory ConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectionResponseFromJson(json);
}
