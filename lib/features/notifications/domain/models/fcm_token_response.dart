import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_response.freezed.dart';
part 'fcm_token_response.g.dart';

@freezed
abstract class FcmTokenResponse with _$FcmTokenResponse {
  const factory FcmTokenResponse({
    required bool success,
    required String message,
  }) = _FcmTokenResponse;

  factory FcmTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenResponseFromJson(json);
}
