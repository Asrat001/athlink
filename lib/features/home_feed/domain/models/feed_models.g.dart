// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SportCategory _$SportCategoryFromJson(Map<String, dynamic> json) =>
    _SportCategory(id: json['_id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$SportCategoryToJson(_SportCategory instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};

_Sport _$SportFromJson(Map<String, dynamic> json) => _Sport(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  categoryId: json['categoryId'] == null
      ? null
      : SportCategory.fromJson(json['categoryId'] as Map<String, dynamic>),
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$SportToJson(_Sport instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'categoryId': instance.categoryId,
  'icon': instance.icon,
};

_SponsorStats _$SponsorStatsFromJson(Map<String, dynamic> json) =>
    _SponsorStats(
      sponsorshipCampaigns:
          (json['sponsorshipCampaigns'] as num?)?.toInt() ?? 0,
      athletesSponsored: (json['athletesSponsored'] as num?)?.toInt() ?? 0,
      globalPartners: (json['globalPartners'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SponsorStatsToJson(_SponsorStats instance) =>
    <String, dynamic>{
      'sponsorshipCampaigns': instance.sponsorshipCampaigns,
      'athletesSponsored': instance.athletesSponsored,
      'globalPartners': instance.globalPartners,
    };

_SponsorProfile _$SponsorProfileFromJson(Map<String, dynamic> json) =>
    _SponsorProfile(
      stats: json['stats'] == null
          ? null
          : SponsorStats.fromJson(json['stats'] as Map<String, dynamic>),
      jobPosts: json['jobPosts'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$SponsorProfileToJson(_SponsorProfile instance) =>
    <String, dynamic>{'stats': instance.stats, 'jobPosts': instance.jobPosts};

_Sponsor _$SponsorFromJson(Map<String, dynamic> json) => _Sponsor(
  id: json['_id'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  sponsorProfile: json['sponsorProfile'] == null
      ? null
      : SponsorProfile.fromJson(json['sponsorProfile'] as Map<String, dynamic>),
  sport:
      (json['sport'] as List<dynamic>?)
          ?.map((e) => Sport.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$SponsorToJson(_Sponsor instance) => <String, dynamic>{
  '_id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'sponsorProfile': instance.sponsorProfile,
  'sport': instance.sport,
};

_AthleteProfile _$AthleteProfileFromJson(Map<String, dynamic> json) =>
    _AthleteProfile(
      name: json['name'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      age: (json['age'] as num?)?.toInt(),
      position: json['position'] as String?,
      level: json['level'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AthleteProfileToJson(_AthleteProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'age': instance.age,
      'position': instance.position,
      'level': instance.level,
      'rating': instance.rating,
    };

_Athlete _$AthleteFromJson(Map<String, dynamic> json) => _Athlete(
  id: json['_id'] as String?,
  email: json['email'] as String?,
  name: json['name'] as String?,
  athleteProfile: json['athleteProfile'] == null
      ? null
      : AthleteProfile.fromJson(json['athleteProfile'] as Map<String, dynamic>),
  sport:
      (json['sport'] as List<dynamic>?)
          ?.map((e) => Sport.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AthleteToJson(_Athlete instance) => <String, dynamic>{
  '_id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'athleteProfile': instance.athleteProfile,
  'sport': instance.sport,
};

_FeedData _$FeedDataFromJson(Map<String, dynamic> json) => _FeedData(
  athletes:
      (json['athletes'] as List<dynamic>?)
          ?.map((e) => Athlete.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  sponsors:
      (json['sponsors'] as List<dynamic>?)
          ?.map((e) => Sponsor.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalAthletes: (json['totalAthletes'] as num?)?.toInt() ?? 0,
  totalSponsors: (json['totalSponsors'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FeedDataToJson(_FeedData instance) => <String, dynamic>{
  'athletes': instance.athletes,
  'sponsors': instance.sponsors,
  'totalAthletes': instance.totalAthletes,
  'totalSponsors': instance.totalSponsors,
};

_FeedResponse _$FeedResponseFromJson(Map<String, dynamic> json) =>
    _FeedResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : FeedData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedResponseToJson(_FeedResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
