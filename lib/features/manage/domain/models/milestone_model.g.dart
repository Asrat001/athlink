// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateMilestoneRequest _$CreateMilestoneRequestFromJson(
  Map<String, dynamic> json,
) => _CreateMilestoneRequest(
  title: json['title'] as String,
  description: json['description'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
  fundAmount: (json['fundAmount'] as num).toDouble(),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateMilestoneRequestToJson(
  _CreateMilestoneRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'fundAmount': instance.fundAmount,
  'notes': instance.notes,
};

_MilestoneTimeline _$MilestoneTimelineFromJson(Map<String, dynamic> json) =>
    _MilestoneTimeline(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$MilestoneTimelineToJson(_MilestoneTimeline instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };

_MilestoneSponsor _$MilestoneSponsorFromJson(Map<String, dynamic> json) =>
    _MilestoneSponsor(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      sponsorProfile: json['sponsorProfile'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MilestoneSponsorToJson(_MilestoneSponsor instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'sponsorProfile': instance.sponsorProfile,
    };

_MilestoneAthlete _$MilestoneAthleteFromJson(Map<String, dynamic> json) =>
    _MilestoneAthlete(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      athleteProfile: json['athleteProfile'] as Map<String, dynamic>?,
      sport:
          (json['sport'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MilestoneAthleteToJson(_MilestoneAthlete instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'athleteProfile': instance.athleteProfile,
      'sport': instance.sport,
    };

_Milestone _$MilestoneFromJson(Map<String, dynamic> json) => _Milestone(
  id: json['_id'] as String,
  sponsor: MilestoneSponsor.fromJson(json['sponsor'] as Map<String, dynamic>),
  athlete: MilestoneAthlete.fromJson(json['athlete'] as Map<String, dynamic>),
  jobPost: json['jobPost'] as String,
  application: json['application'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  timeline: MilestoneTimeline.fromJson(
    json['timeline'] as Map<String, dynamic>,
  ),
  fundAmount: (json['fundAmount'] as num).toDouble(),
  status: json['status'] as String,
  paymentStatus: json['paymentStatus'] as String,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MilestoneToJson(_Milestone instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sponsor': instance.sponsor,
      'athlete': instance.athlete,
      'jobPost': instance.jobPost,
      'application': instance.application,
      'title': instance.title,
      'description': instance.description,
      'timeline': instance.timeline,
      'fundAmount': instance.fundAmount,
      'status': instance.status,
      'paymentStatus': instance.paymentStatus,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_CreateMilestoneResponse _$CreateMilestoneResponseFromJson(
  Map<String, dynamic> json,
) => _CreateMilestoneResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  milestone: Milestone.fromJson(json['milestone'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreateMilestoneResponseToJson(
  _CreateMilestoneResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'milestone': instance.milestone,
};

_MilestonesData _$MilestonesDataFromJson(Map<String, dynamic> json) =>
    _MilestonesData(
      milestones: (json['milestones'] as List<dynamic>)
          .map((e) => Milestone.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$MilestonesDataToJson(_MilestonesData instance) =>
    <String, dynamic>{
      'milestones': instance.milestones,
      'count': instance.count,
    };

_GetMilestonesResponse _$GetMilestonesResponseFromJson(
  Map<String, dynamic> json,
) => _GetMilestonesResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: MilestonesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMilestonesResponseToJson(
  _GetMilestonesResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_GetMilestoneByIdResponse _$GetMilestoneByIdResponseFromJson(
  Map<String, dynamic> json,
) => _GetMilestoneByIdResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  milestone: Milestone.fromJson(json['milestone'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMilestoneByIdResponseToJson(
  _GetMilestoneByIdResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'milestone': instance.milestone,
};

_UpdateMilestoneStatusRequest _$UpdateMilestoneStatusRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateMilestoneStatusRequest(status: json['status'] as String);

Map<String, dynamic> _$UpdateMilestoneStatusRequestToJson(
  _UpdateMilestoneStatusRequest instance,
) => <String, dynamic>{'status': instance.status};

_UpdateMilestoneStatusResponse _$UpdateMilestoneStatusResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateMilestoneStatusResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  milestone: Milestone.fromJson(json['milestone'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateMilestoneStatusResponseToJson(
  _UpdateMilestoneStatusResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'milestone': instance.milestone,
};
