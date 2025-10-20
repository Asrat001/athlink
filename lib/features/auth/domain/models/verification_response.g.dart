// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerificationResponse _$VerificationResponseFromJson(
  Map<String, dynamic> json,
) => _VerificationResponse(
  message: json['message'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$VerificationResponseToJson(
  _VerificationResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'user': instance.user,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};
