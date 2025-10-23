// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistrationResponse _$RegistrationResponseFromJson(
  Map<String, dynamic> json,
) => _RegistrationResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegistrationResponseToJson(
  _RegistrationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'user': instance.user,
};

_User _$UserFromJson(Map<String, dynamic> json) =>
    _User(id: json['_id'] as String, email: json['email'] as String);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  '_id': instance.id,
  'email': instance.email,
};
