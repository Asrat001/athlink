// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CampaignDetailModel _$CampaignDetailModelFromJson(Map<String, dynamic> json) =>
    _CampaignDetailModel(
      id: json['_id'] as String?,
      owner: json['owner'] as String?,
      title: json['title'] == null
          ? null
          : CampaignTitleModel.fromJson(json['title'] as Map<String, dynamic>),
      financialGoal: json['financialGoal'] == null
          ? null
          : FinancialGoal.fromJson(
              json['financialGoal'] as Map<String, dynamic>,
            ),
      costBreakdown: (json['costBreakdown'] as List<dynamic>?)
          ?.map((e) => CostBreakdownItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      goals: (json['goals'] as List<dynamic>?)
          ?.map((e) => GoalItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferredSponsors: (json['preferredSponsors'] as List<dynamic>?)
          ?.map((e) => PreferredSponsor.fromJson(e as Map<String, dynamic>))
          .toList(),
      sponsorshipPreferences: json['sponsorshipPreferences'] == null
          ? null
          : SponsorshipPreferences.fromJson(
              json['sponsorshipPreferences'] as Map<String, dynamic>,
            ),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CampaignDetailModelToJson(
  _CampaignDetailModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'owner': instance.owner,
  'title': instance.title,
  'financialGoal': instance.financialGoal,
  'costBreakdown': instance.costBreakdown,
  'goals': instance.goals,
  'preferredSponsors': instance.preferredSponsors,
  'sponsorshipPreferences': instance.sponsorshipPreferences,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

_FinancialGoal _$FinancialGoalFromJson(Map<String, dynamic> json) =>
    _FinancialGoal(
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      deadline: json['deadline'] as String?,
    );

Map<String, dynamic> _$FinancialGoalToJson(_FinancialGoal instance) =>
    <String, dynamic>{
      'totalAmount': instance.totalAmount,
      'deadline': instance.deadline,
    };

_CostBreakdownItem _$CostBreakdownItemFromJson(Map<String, dynamic> json) =>
    _CostBreakdownItem(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CostBreakdownItemToJson(_CostBreakdownItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
    };

_GoalItem _$GoalItemFromJson(Map<String, dynamic> json) => _GoalItem(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  targetDate: json['targetDate'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$GoalItemToJson(_GoalItem instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'targetDate': instance.targetDate,
  'status': instance.status,
};

_PreferredSponsor _$PreferredSponsorFromJson(Map<String, dynamic> json) =>
    _PreferredSponsor(
      id: json['_id'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      name: json['name'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      sponsorProfile: json['sponsorProfile'] == null
          ? null
          : SponsorProfileModel.fromJson(
              json['sponsorProfile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PreferredSponsorToJson(_PreferredSponsor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'sponsorProfile': instance.sponsorProfile,
    };

_SponsorshipPreferences _$SponsorshipPreferencesFromJson(
  Map<String, dynamic> json,
) => _SponsorshipPreferences(
  socialMedia: json['socialMedia'] as bool?,
  eventAppearance: json['eventAppearance'] as bool?,
  contentCreation: json['contentCreation'] as bool?,
  productEndorsement: json['productEndorsement'] as bool?,
  speech: json['speech'] as bool?,
  workshop: json['workshop'] as bool?,
  other: json['other'] == null
      ? null
      : SponsorshipOtherPreference.fromJson(
          json['other'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SponsorshipPreferencesToJson(
  _SponsorshipPreferences instance,
) => <String, dynamic>{
  'socialMedia': instance.socialMedia,
  'eventAppearance': instance.eventAppearance,
  'contentCreation': instance.contentCreation,
  'productEndorsement': instance.productEndorsement,
  'speech': instance.speech,
  'workshop': instance.workshop,
  'other': instance.other,
};

_SponsorshipOtherPreference _$SponsorshipOtherPreferenceFromJson(
  Map<String, dynamic> json,
) => _SponsorshipOtherPreference(
  enabled: json['enabled'] as bool?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$SponsorshipOtherPreferenceToJson(
  _SponsorshipOtherPreference instance,
) => <String, dynamic>{
  'enabled': instance.enabled,
  'description': instance.description,
};
