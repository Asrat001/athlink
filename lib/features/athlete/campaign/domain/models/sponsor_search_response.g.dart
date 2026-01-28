// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorSearchResponse _$SponsorSearchResponseFromJson(
  Map<String, dynamic> json,
) => _SponsorSearchResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: SponsorSearchData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SponsorSearchResponseToJson(
  _SponsorSearchResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_SponsorSearchData _$SponsorSearchDataFromJson(Map<String, dynamic> json) =>
    _SponsorSearchData(
      sponsors: (json['sponsors'] as List<dynamic>)
          .map((e) => SponsorSearchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$SponsorSearchDataToJson(_SponsorSearchData instance) =>
    <String, dynamic>{'sponsors': instance.sponsors, 'count': instance.count};

_SponsorSearchModel _$SponsorSearchModelFromJson(Map<String, dynamic> json) =>
    _SponsorSearchModel(
      id: json['_id'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      sponsorProfile: SponsorProfileModel.fromJson(
        json['sponsorProfile'] as Map<String, dynamic>,
      ),
      sport: (json['sport'] as List<dynamic>)
          .map((e) => SponsorSportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOnline: json['isOnline'] as bool,
      lastSeenAt: json['lastSeenAt'] as String?,
    );

Map<String, dynamic> _$SponsorSearchModelToJson(_SponsorSearchModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'sponsorProfile': instance.sponsorProfile,
      'sport': instance.sport,
      'isOnline': instance.isOnline,
      'lastSeenAt': instance.lastSeenAt,
    };

_SponsorProfileModel _$SponsorProfileModelFromJson(Map<String, dynamic> json) =>
    _SponsorProfileModel(
      name: json['name'] as String,
      address: json['address'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SponsorProfileModelToJson(
  _SponsorProfileModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'profileImageUrl': instance.profileImageUrl,
  'description': instance.description,
};

_SponsorSportModel _$SponsorSportModelFromJson(Map<String, dynamic> json) =>
    _SponsorSportModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$SponsorSportModelToJson(_SponsorSportModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
