// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) =>
    _CampaignModel(
      id: json['_id'] as String?,
      title: json['title'] == null
          ? null
          : CampaignTitleModel.fromJson(json['title'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CampaignModelToJson(_CampaignModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt,
    };

_CampaignTitleModel _$CampaignTitleModelFromJson(Map<String, dynamic> json) =>
    _CampaignTitleModel(
      text: json['text'] as String?,
      isActive: json['isActive'] as bool?,
      fundedPercentage: (json['fundedPercentage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CampaignTitleModelToJson(_CampaignTitleModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isActive': instance.isActive,
      'fundedPercentage': instance.fundedPercentage,
    };
