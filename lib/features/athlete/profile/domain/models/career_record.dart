import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_record.freezed.dart';
part 'career_record.g.dart';

@freezed
abstract class CareerJourneyModel with _$CareerJourneyModel {
  const factory CareerJourneyModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'athlete') required String athleteId,
    String? logo,
    required String position,
    required String teamName,
    required String year,
    required String achievements,
    required String description,
  }) = _CareerJourneyModel;

  factory CareerJourneyModel.fromJson(Map<String, dynamic> json) =>
      _$CareerJourneyModelFromJson(json);
}
