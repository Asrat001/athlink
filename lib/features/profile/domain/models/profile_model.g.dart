// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      success: json['success'] as bool,
      user: ProfileUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{'success': instance.success, 'user': instance.user};

_ProfileUser _$ProfileUserFromJson(Map<String, dynamic> json) => _ProfileUser(
  id: json['_id'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  authProvider: json['authProvider'] as String,
  isEmailVerified: json['isEmailVerified'] as bool,
  sport: (json['sport'] as List<dynamic>)
      .map((e) => ProfileSport.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  version: (json['__v'] as num).toInt(),
  googleId: json['googleId'] as String?,
  sponsorProfile: json['sponsorProfile'] == null
      ? null
      : SponsorProfile.fromJson(json['sponsorProfile'] as Map<String, dynamic>),
  sponsoredBy: json['sponsoredBy'] as List<dynamic>? ?? const [],
);

Map<String, dynamic> _$ProfileUserToJson(_ProfileUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'authProvider': instance.authProvider,
      'isEmailVerified': instance.isEmailVerified,
      'sport': instance.sport,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.version,
      'googleId': instance.googleId,
      'sponsorProfile': instance.sponsorProfile,
      'sponsoredBy': instance.sponsoredBy,
    };

_ProfileSport _$ProfileSportFromJson(Map<String, dynamic> json) =>
    _ProfileSport(
      id: json['_id'] as String,
      name: json['name'] as String,
      categoryId: SportCategory.fromJson(
        json['categoryId'] as Map<String, dynamic>,
      ),
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$ProfileSportToJson(_ProfileSport instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'categoryId': instance.categoryId,
      'icon': instance.icon,
    };

_SportCategory _$SportCategoryFromJson(Map<String, dynamic> json) =>
    _SportCategory(id: json['_id'] as String, name: json['name'] as String);

Map<String, dynamic> _$SportCategoryToJson(_SportCategory instance) =>
    <String, dynamic>{'_id': instance.id, 'name': instance.name};

_SponsorProfile _$SponsorProfileFromJson(Map<String, dynamic> json) =>
    _SponsorProfile(
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      address: json['address'] as String,
      bannerImageUrl: json['bannerImageUrl'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      jobPosts:
          (json['jobPosts'] as List<dynamic>?)
              ?.map((e) => JobPost.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SponsorProfileToJson(_SponsorProfile instance) =>
    <String, dynamic>{
      'stats': instance.stats,
      'address': instance.address,
      'bannerImageUrl': instance.bannerImageUrl,
      'description': instance.description,
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
      'jobPosts': instance.jobPosts,
    };

_Stats _$StatsFromJson(Map<String, dynamic> json) => _Stats(
  athletesSponsored: (json['athletesSponsored'] as num?)?.toInt() ?? 0,
  globalPartners: (json['globalPartners'] as num?)?.toInt() ?? 0,
  sponsorshipCampaigns: (json['sponsorshipCampaigns'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$StatsToJson(_Stats instance) => <String, dynamic>{
  'athletesSponsored': instance.athletesSponsored,
  'globalPartners': instance.globalPartners,
  'sponsorshipCampaigns': instance.sponsorshipCampaigns,
};

_JobPost _$JobPostFromJson(Map<String, dynamic> json) => _JobPost(
  id: json['_id'] as String,
  timeline: Timeline.fromJson(json['timeline'] as Map<String, dynamic>),
  title: json['title'] as String,
  category: json['sport_id'] as String,
  location: json['location'] as String,
  description: json['description'] as String,
  requirements: json['requirements'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  mediaUrls:
      (json['mediaUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$JobPostToJson(_JobPost instance) => <String, dynamic>{
  '_id': instance.id,
  'timeline': instance.timeline,
  'title': instance.title,
  'sport_id': instance.category,
  'location': instance.location,
  'description': instance.description,
  'requirements': instance.requirements,
  'createdAt': instance.createdAt.toIso8601String(),
  'mediaUrls': instance.mediaUrls,
};

_Timeline _$TimelineFromJson(Map<String, dynamic> json) => _Timeline(
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
);

Map<String, dynamic> _$TimelineToJson(_Timeline instance) => <String, dynamic>{
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
};

_UpdateSponsorProfileResponse _$UpdateSponsorProfileResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateSponsorProfileResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  sponsorProfile: UpdatedSponsorProfile.fromJson(
    json['sponsorProfile'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UpdateSponsorProfileResponseToJson(
  _UpdateSponsorProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'sponsorProfile': instance.sponsorProfile,
};

_UpdatedSponsorProfile _$UpdatedSponsorProfileFromJson(
  Map<String, dynamic> json,
) => _UpdatedSponsorProfile(
  name: json['name'] as String,
  description: json['description'] as String,
  address: json['address'] as String,
  profileImageUrl: json['profileImageUrl'] as String,
  bannerImageUrl: json['bannerImageUrl'] as String,
);

Map<String, dynamic> _$UpdatedSponsorProfileToJson(
  _UpdatedSponsorProfile instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'profileImageUrl': instance.profileImageUrl,
  'bannerImageUrl': instance.bannerImageUrl,
};
