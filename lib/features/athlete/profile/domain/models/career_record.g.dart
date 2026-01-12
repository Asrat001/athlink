// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerJourneyModel _$CareerJourneyModelFromJson(Map<String, dynamic> json) =>
    _CareerJourneyModel(
      id: json['_id'] as String,
      athleteId: json['athlete'] as String,
      logo: json['logo'] as String?,
      position: json['position'] as String,
      teamName: json['teamName'] as String,
      year: json['year'] as String,
      achievements: json['achievements'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CareerJourneyModelToJson(_CareerJourneyModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'athlete': instance.athleteId,
      'logo': instance.logo,
      'position': instance.position,
      'teamName': instance.teamName,
      'year': instance.year,
      'achievements': instance.achievements,
      'description': instance.description,
    };
