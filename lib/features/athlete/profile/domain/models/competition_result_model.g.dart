// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompetitionResultModel _$CompetitionResultModelFromJson(
  Map<String, dynamic> json,
) => _CompetitionResultModel(
  id: _idReader(json, '_id') as String,
  athleteId: json['athlete'] as String,
  competitionName: json['competitionName'] as String,
  date: json['date'] as String,
  position: (json['position'] as num).toInt(),
  totalCompetitors: (json['totalCompetitors'] as num).toInt(),
  division: json['division'] as String,
  media:
      (json['media'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  competitionSummary: json['competitionSummary'] as String,
  resultLink: json['resultLink'] as String?,
  location: json['location'] as String?,
);

Map<String, dynamic> _$CompetitionResultModelToJson(
  _CompetitionResultModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'athlete': instance.athleteId,
  'competitionName': instance.competitionName,
  'date': instance.date,
  'position': instance.position,
  'totalCompetitors': instance.totalCompetitors,
  'division': instance.division,
  'media': instance.media,
  'competitionSummary': instance.competitionSummary,
  'resultLink': instance.resultLink,
  'location': instance.location,
};
