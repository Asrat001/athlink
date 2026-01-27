import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_detail_model.freezed.dart';
part 'campaign_detail_model.g.dart';

@freezed
abstract class CampaignDetailModel with _$CampaignDetailModel {
  const factory CampaignDetailModel({
    @JsonKey(name: '_id') String? id,
    String? owner,
    CampaignTitleModel? title,
    FinancialGoal? financialGoal,
    List<CostBreakdownItem>? costBreakdown,
    List<GoalItem>? goals,
    List<PreferredSponsor>? preferredSponsors,
    SponsorshipPreferences? sponsorshipPreferences,
    String? createdAt,
    String? updatedAt,
  }) = _CampaignDetailModel;

  factory CampaignDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignDetailModelFromJson(json);
}

@freezed
abstract class FinancialGoal with _$FinancialGoal {
  const factory FinancialGoal({double? totalAmount, String? deadline}) =
      _FinancialGoal;

  factory FinancialGoal.fromJson(Map<String, dynamic> json) =>
      _$FinancialGoalFromJson(json);
}

@freezed
abstract class CostBreakdownItem with _$CostBreakdownItem {
  const factory CostBreakdownItem({
    @JsonKey(name: '_id') String? id,
    String? title,
    double? amount,
  }) = _CostBreakdownItem;

  factory CostBreakdownItem.fromJson(Map<String, dynamic> json) =>
      _$CostBreakdownItemFromJson(json);
}

@freezed
abstract class GoalItem with _$GoalItem {
  const factory GoalItem({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? targetDate,
    String? status,
  }) = _GoalItem;

  factory GoalItem.fromJson(Map<String, dynamic> json) =>
      _$GoalItemFromJson(json);
}

@freezed
abstract class PreferredSponsor with _$PreferredSponsor {
  const factory PreferredSponsor({
    @JsonKey(name: '_id') String? id,
    String? email,
    String? role,
  }) = _PreferredSponsor;

  factory PreferredSponsor.fromJson(Map<String, dynamic> json) =>
      _$PreferredSponsorFromJson(json);
}

@freezed
abstract class SponsorshipPreferences with _$SponsorshipPreferences {
  const factory SponsorshipPreferences({
    bool? socialMedia,
    bool? eventAppearance,
    bool? contentCreation,
    bool? productEndorsement,
    bool? speech,
    bool? workshop,
    SponsorshipOtherPreference? other,
  }) = _SponsorshipPreferences;

  factory SponsorshipPreferences.fromJson(Map<String, dynamic> json) =>
      _$SponsorshipPreferencesFromJson(json);
}

@freezed
abstract class SponsorshipOtherPreference with _$SponsorshipOtherPreference {
  const factory SponsorshipOtherPreference({
    bool? enabled,
    String? description,
  }) = _SponsorshipOtherPreference;

  factory SponsorshipOtherPreference.fromJson(Map<String, dynamic> json) =>
      _$SponsorshipOtherPreferenceFromJson(json);
}
