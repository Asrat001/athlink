import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_model.freezed.dart';
part 'campaign_model.g.dart';

@freezed
abstract class CampaignModel with _$CampaignModel {
  const factory CampaignModel({
    @JsonKey(name: '_id') String? id,
    CampaignTitleModel? title,
    String? createdAt,
  }) = _CampaignModel;

  factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);
}

@freezed
abstract class CampaignTitleModel with _$CampaignTitleModel {
  const factory CampaignTitleModel({
    String? text,
    bool? isActive,
    double? fundedPercentage,
  }) = _CampaignTitleModel;

  factory CampaignTitleModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignTitleModelFromJson(json);
}
