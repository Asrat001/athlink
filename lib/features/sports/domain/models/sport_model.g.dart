// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sport _$SportFromJson(Map<String, dynamic> json) => _Sport(
  id: json['_id'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String?,
  isVisible: json['isVisible'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  sportCategoryId: json['sportCategory'] as String,
  sportCategory: json['categoryId'] == null
      ? null
      : SportCategory.fromJson(json['categoryId'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SportToJson(_Sport instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
  'isVisible': instance.isVisible,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'sportCategory': instance.sportCategoryId,
  'categoryId': instance.sportCategory,
};

_SportCategory _$SportCategoryFromJson(Map<String, dynamic> json) =>
    _SportCategory(id: json['_id'] as String, name: json['name'] as String);

Map<String, dynamic> _$SportCategoryToJson(_SportCategory instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};
