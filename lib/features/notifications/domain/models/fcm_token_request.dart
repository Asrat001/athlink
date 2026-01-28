import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_request.freezed.dart';
part 'fcm_token_request.g.dart';

@freezed
abstract class FcmTokenRequest with _$FcmTokenRequest {
  const factory FcmTokenRequest({
    required String token,
    required String device,
  }) = _FcmTokenRequest;

  factory FcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenRequestFromJson(json);
}
