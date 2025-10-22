
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_response.freezed.dart';
part 'registration_response.g.dart';

@freezed
abstract class RegistrationResponse with _$RegistrationResponse {
  const factory RegistrationResponse({
    required bool success,
    required String message,
    required User user,
  }) = _RegistrationResponse;

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: '_id') required String id,
    required String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
