import 'package:freezed_annotation/freezed_annotation.dart';

part 'competition_result_model.freezed.dart';
part 'competition_result_model.g.dart';

@freezed
abstract class CompetitionResultModel with _$CompetitionResultModel {
  const factory CompetitionResultModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'athlete') required String athleteId,
    required String competitionName,
    required String date,
    required int position,
    required int totalCompetitors,
    required String division,
    @Default([]) List<String> media,
    required String competitionSummary,
    String? resultLink,
    String? location,
  }) = _CompetitionResultModel;

  factory CompetitionResultModel.fromJson(Map<String, dynamic> json) =>
      _$CompetitionResultModelFromJson(json);
}
