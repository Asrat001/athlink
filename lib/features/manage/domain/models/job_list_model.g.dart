// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplication _$JobApplicationFromJson(Map<String, dynamic> json) =>
    _JobApplication(
      id: json['_id'] as String,
      athlete: Athlete.fromJson(json['athlete'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobApplicationToJson(_JobApplication instance) =>
    <String, dynamic>{'_id': instance.id, 'athlete': instance.athlete};

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
  applications:
      (json['applications'] as List<dynamic>?)
          ?.map((e) => JobApplication.fromJson(e as Map<String, dynamic>))
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
      'applications': instance.applications,
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

_AcceptApplicantData _$AcceptApplicantDataFromJson(Map<String, dynamic> json) =>
    _AcceptApplicantData(
      athleteId: json['athleteId'] as String,
      jobId: json['jobId'] as String,
      applicationId: json['applicationId'] as String,
      sponsorshipSource: json['sponsorshipSource'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AcceptApplicantDataToJson(
  _AcceptApplicantData instance,
) => <String, dynamic>{
  'athleteId': instance.athleteId,
  'jobId': instance.jobId,
  'applicationId': instance.applicationId,
  'sponsorshipSource': instance.sponsorshipSource,
  'status': instance.status,
};

_AcceptApplicantResponse _$AcceptApplicantResponseFromJson(
  Map<String, dynamic> json,
) => _AcceptApplicantResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: AcceptApplicantData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AcceptApplicantResponseToJson(
  _AcceptApplicantResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_SponsoredAthleteJobPost _$SponsoredAthleteJobPostFromJson(
  Map<String, dynamic> json,
) => _SponsoredAthleteJobPost(
  id: json['_id'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$SponsoredAthleteJobPostToJson(
  _SponsoredAthleteJobPost instance,
) => <String, dynamic>{'_id': instance.id, 'title': instance.title};

_SponsoredAthleteItem _$SponsoredAthleteItemFromJson(
  Map<String, dynamic> json,
) => _SponsoredAthleteItem(
  athlete: Athlete.fromJson(json['athlete'] as Map<String, dynamic>),
  jobPost: SponsoredAthleteJobPost.fromJson(
    json['jobPost'] as Map<String, dynamic>,
  ),
  applicationId: json['applicationId'] as String,
  acceptedAt: DateTime.parse(json['acceptedAt'] as String),
);

Map<String, dynamic> _$SponsoredAthleteItemToJson(
  _SponsoredAthleteItem instance,
) => <String, dynamic>{
  'athlete': instance.athlete,
  'jobPost': instance.jobPost,
  'applicationId': instance.applicationId,
  'acceptedAt': instance.acceptedAt.toIso8601String(),
};

_SponsoredAthletesData _$SponsoredAthletesDataFromJson(
  Map<String, dynamic> json,
) => _SponsoredAthletesData(
  athletes: (json['athletes'] as List<dynamic>)
      .map((e) => SponsoredAthleteItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$SponsoredAthletesDataToJson(
  _SponsoredAthletesData instance,
) => <String, dynamic>{'athletes': instance.athletes, 'count': instance.count};

_SponsoredAthletesResponse _$SponsoredAthletesResponseFromJson(
  Map<String, dynamic> json,
) => _SponsoredAthletesResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: SponsoredAthletesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SponsoredAthletesResponseToJson(
  _SponsoredAthletesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
