import 'package:freezed_annotation/freezed_annotation.dart';
import 'login_model.dart'; // This imports both LoginResponse and User

part 'verification_response.freezed.dart';
part 'verification_response.g.dart';

@freezed
abstract class VerificationResponse with _$VerificationResponse {
  const factory VerificationResponse({
    required String message,
    required User user, // Now you can use User
    required String accessToken,
    required String refreshToken,
  }) = _VerificationResponse;

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);
}
