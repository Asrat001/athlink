// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sport _$SportFromJson(Map<String, dynamic> json) => _Sport(
  id: json['_id'] as String,
  name: json['name'] as String,
  isVisible: json['isVisible'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  sportCategoryId: json['sportCategory'] as String,
);

Map<String, dynamic> _$SportToJson(_Sport instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'isVisible': instance.isVisible,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'sportCategory': instance.sportCategoryId,
};
