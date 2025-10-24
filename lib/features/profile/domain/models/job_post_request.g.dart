// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobPostRequest _$JobPostRequestFromJson(Map<String, dynamic> json) =>
    _JobPostRequest(
      title: json['title'] as String,
      sportId: json['sport_id'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      timelineStart: json['timelineStart'] as String?,
      timelineEnd: json['timelineEnd'] as String?,
      requirements: json['requirements'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobPostRequestToJson(_JobPostRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'sport_id': instance.sportId,
      'location': instance.location,
      'description': instance.description,
      'timelineStart': instance.timelineStart,
      'timelineEnd': instance.timelineEnd,
      'requirements': instance.requirements,
      'media': instance.media,
    };

_CreateJobPostResponse _$CreateJobPostResponseFromJson(
  Map<String, dynamic> json,
) => _CreateJobPostResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  jobPost: json['jobPost'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateJobPostResponseToJson(
  _CreateJobPostResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'jobPost': instance.jobPost,
};
