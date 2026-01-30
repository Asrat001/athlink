// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      name: json['name'] as String?,
      country: json['country'] as String?,
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      profilePhoto: json['profilePhoto'] as String?,
      coverPhoto: json['coverPhoto'] as String?,
      sport: (json['sport'] as List<dynamic>?)
          ?.map((e) => Sport.fromJson(e as Map<String, dynamic>))
          .toList(),
      latestActiveCampaign: json['latestActiveCampaign'] == null
          ? null
          : CampaignDetailModel.fromJson(
              json['latestActiveCampaign'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'location': instance.location,
      'bio': instance.bio,
      'profilePhoto': instance.profilePhoto,
      'coverPhoto': instance.coverPhoto,
      'sport': instance.sport,
      'latestActiveCampaign': instance.latestActiveCampaign,
    };
