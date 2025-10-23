import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required User user,
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    @JsonKey(name: "_id")
    required String id,
    @JsonKey(defaultValue: "")
    required String name,
    required String email,
    required String role,
    @JsonKey(defaultValue: false, name: "is_new_user")
    required bool isNewUser
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
