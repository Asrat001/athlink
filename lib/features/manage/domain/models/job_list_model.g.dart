// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobListResponse _$JobListResponseFromJson(Map<String, dynamic> json) =>
    _JobListResponse(
      success: json['success'] as bool,
      jobPosts: (json['jobPosts'] as List<dynamic>)
          .map((e) => JobPostItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
    );

Map<String, dynamic> _$JobListResponseToJson(_JobListResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'jobPosts': instance.jobPosts,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
    };

_JobPostItem _$JobPostItemFromJson(Map<String, dynamic> json) => _JobPostItem(
  id: json['_id'] as String,
  timeline: Timeline.fromJson(json['timeline'] as Map<String, dynamic>),
  title: json['title'] as String,
  sportId: SportInfo.fromJson(json['sport_id'] as Map<String, dynamic>),
  location: json['location'] as String? ?? '',
  description: json['description'] as String? ?? '',
  requirements: json['requirements'] as String? ?? '',
  createdAt: DateTime.parse(json['createdAt'] as String),
  mediaUrls:
      (json['mediaUrls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  applicants:
      (json['applicants'] as List<dynamic>?)
          ?.map((e) => Athlete.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  applicantCount: (json['applicantCount'] as num?)?.toInt() ?? 0,
  price: json['price'] as String? ?? '',
);

Map<String, dynamic> _$JobPostItemToJson(_JobPostItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'timeline': instance.timeline,
      'title': instance.title,
      'sport_id': instance.sportId,
      'location': instance.location,
      'description': instance.description,
      'requirements': instance.requirements,
      'createdAt': instance.createdAt.toIso8601String(),
      'mediaUrls': instance.mediaUrls,
      'applicants': instance.applicants,
      'applicantCount': instance.applicantCount,
      'price': instance.price,
    };

_SportInfo _$SportInfoFromJson(Map<String, dynamic> json) => _SportInfo(
  id: json['_id'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$SportInfoToJson(_SportInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
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
