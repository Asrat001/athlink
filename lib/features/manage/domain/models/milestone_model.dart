import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone_model.freezed.dart';
part 'milestone_model.g.dart';

@freezed
abstract class CreateMilestoneRequest with _$CreateMilestoneRequest {
  const factory CreateMilestoneRequest({
    required String title,
    required String description,
    required String startDate,
    required String endDate,
    required double fundAmount,
    String? notes,
  }) = _CreateMilestoneRequest;

  factory CreateMilestoneRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMilestoneRequestFromJson(json);
}

@freezed
abstract class MilestoneTimeline with _$MilestoneTimeline {
  const factory MilestoneTimeline({
    required DateTime startDate,
    required DateTime endDate,
  }) = _MilestoneTimeline;

  factory MilestoneTimeline.fromJson(Map<String, dynamic> json) =>
      _$MilestoneTimelineFromJson(json);
}

@freezed
abstract class MilestoneSponsor with _$MilestoneSponsor {
  const factory MilestoneSponsor({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String email,
    Map<String, dynamic>? sponsorProfile,
  }) = _MilestoneSponsor;

  factory MilestoneSponsor.fromJson(Map<String, dynamic> json) =>
      _$MilestoneSponsorFromJson(json);
}

@freezed
abstract class MilestoneAthlete with _$MilestoneAthlete {
  const factory MilestoneAthlete({
    @JsonKey(name: '_id') required String id,
    required String name,
    required String email,
    Map<String, dynamic>? athleteProfile,
    @Default([]) List<Map<String, dynamic>> sport,
  }) = _MilestoneAthlete;

  factory MilestoneAthlete.fromJson(Map<String, dynamic> json) =>
      _$MilestoneAthleteFromJson(json);
}

@freezed
abstract class Milestone with _$Milestone {
  const factory Milestone({
    @JsonKey(name: '_id') required String id,
    required MilestoneSponsor sponsor,
    required MilestoneAthlete athlete,
    required String jobPost,
    required String application,
    required String title,
    required String description,
    required MilestoneTimeline timeline,
    required double fundAmount,
    required String status,
    required String paymentStatus,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Milestone;

  factory Milestone.fromJson(Map<String, dynamic> json) =>
      _$MilestoneFromJson(json);
}

@freezed
abstract class CreateMilestoneResponse with _$CreateMilestoneResponse {
  const factory CreateMilestoneResponse({
    required bool success,
    required String message,
    required Milestone milestone,
  }) = _CreateMilestoneResponse;

  factory CreateMilestoneResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMilestoneResponseFromJson(json);
}

@freezed
abstract class MilestonesData with _$MilestonesData {
  const factory MilestonesData({
    required List<Milestone> milestones,
    required int count,
  }) = _MilestonesData;

  factory MilestonesData.fromJson(Map<String, dynamic> json) =>
      _$MilestonesDataFromJson(json);
}

@freezed
abstract class GetMilestonesResponse with _$GetMilestonesResponse {
  const factory GetMilestonesResponse({
    required bool success,
    required String message,
    required MilestonesData data,
  }) = _GetMilestonesResponse;

  factory GetMilestonesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMilestonesResponseFromJson(json);
}

@freezed
abstract class GetMilestoneByIdResponse with _$GetMilestoneByIdResponse {
  const factory GetMilestoneByIdResponse({
    required bool success,
    required String message,
    required Milestone milestone,
  }) = _GetMilestoneByIdResponse;

  factory GetMilestoneByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMilestoneByIdResponseFromJson(json);
}

@freezed
abstract class UpdateMilestoneStatusRequest
    with _$UpdateMilestoneStatusRequest {
  const factory UpdateMilestoneStatusRequest({
    required String status,
  }) = _UpdateMilestoneStatusRequest;

  factory UpdateMilestoneStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMilestoneStatusRequestFromJson(json);
}

@freezed
abstract class UpdateMilestoneStatusResponse
    with _$UpdateMilestoneStatusResponse {
  const factory UpdateMilestoneStatusResponse({
    required bool success,
    required String message,
    required Milestone milestone,
  }) = _UpdateMilestoneStatusResponse;

  factory UpdateMilestoneStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateMilestoneStatusResponseFromJson(json);
}
