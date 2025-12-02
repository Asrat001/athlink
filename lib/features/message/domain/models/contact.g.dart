// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  id: json['id'] as String,
  name: json['name'] as String,
  logo: json['logo'] as String,
  type: $enumDecode(_$ContactTypeEnumMap, json['type']),
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  isOnline: json['isOnline'] as bool? ?? false,
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'logo': instance.logo,
  'type': _$ContactTypeEnumMap[instance.type]!,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'isOnline': instance.isOnline,
};

const _$ContactTypeEnumMap = {
  ContactType.athlete: 'athlete',
  ContactType.sponsor: 'sponsor',
};
