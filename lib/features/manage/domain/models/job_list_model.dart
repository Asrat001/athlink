import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_list_model.freezed.dart';
part 'job_list_model.g.dart';

@freezed
abstract class JobApplication with _$JobApplication {
  const factory JobApplication({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "athlete") required Athlete athlete,
  }) = _JobApplication;

  factory JobApplication.fromJson(Map<String, dynamic> json) =>
      _$JobApplicationFromJson(json);
}

@freezed
abstract class JobListResponse with _$JobListResponse {
  const factory JobListResponse({
    required bool success,
    required List<JobPostItem> jobPosts,
    String? companyName,
    String? companyLogo,
  }) = _JobListResponse;

  factory JobListResponse.fromJson(Map<String, dynamic> json) =>
      _$JobListResponseFromJson(json);
}

@freezed
abstract class JobPostItem with _$JobPostItem {
  const factory JobPostItem({
    @JsonKey(name: "_id") required String id,
    required Timeline timeline,
    required String title,
    @JsonKey(name: "sport_id") required SportInfo sportId,
    @Default('') String location,
    @Default('') String description,
    @Default('') String requirements,
    required DateTime createdAt,
    @Default([]) List<String> mediaUrls,
    @Default([]) List<JobApplication> applications,
    @Default(0) int applicantCount,
    @Default('') String price,
  }) = _JobPostItem;

  factory JobPostItem.fromJson(Map<String, dynamic> json) =>
      _$JobPostItemFromJson(json);
}

@freezed
abstract class SportInfo with _$SportInfo {
  const factory SportInfo({
    @JsonKey(name: "_id") required String id,
    required String name,
    String? icon,
  }) = _SportInfo;

  factory SportInfo.fromJson(Map<String, dynamic> json) =>
      _$SportInfoFromJson(json);
}

@freezed
abstract class Timeline with _$Timeline {
  const factory Timeline({DateTime? startDate, DateTime? endDate}) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}

@freezed
abstract class AcceptApplicantData with _$AcceptApplicantData {
  const factory AcceptApplicantData({
    required String athleteId,
    required String jobId,
    required String applicationId,
    required String sponsorshipSource,
    required String status,
  }) = _AcceptApplicantData;

  factory AcceptApplicantData.fromJson(Map<String, dynamic> json) =>
      _$AcceptApplicantDataFromJson(json);
}

@freezed
abstract class AcceptApplicantResponse with _$AcceptApplicantResponse {
  const factory AcceptApplicantResponse({
    required bool success,
    required String message,
    required AcceptApplicantData data,
  }) = _AcceptApplicantResponse;

  factory AcceptApplicantResponse.fromJson(Map<String, dynamic> json) =>
      _$AcceptApplicantResponseFromJson(json);
}

@freezed
abstract class SponsoredAthleteJobPost with _$SponsoredAthleteJobPost {
  const factory SponsoredAthleteJobPost({
    @JsonKey(name: "_id") required String id,
    required String title,
  }) = _SponsoredAthleteJobPost;

  factory SponsoredAthleteJobPost.fromJson(Map<String, dynamic> json) =>
      _$SponsoredAthleteJobPostFromJson(json);
}

@freezed
abstract class SponsoredAthleteItem with _$SponsoredAthleteItem {
  const factory SponsoredAthleteItem({
    required Athlete athlete,
    required SponsoredAthleteJobPost jobPost,
    required String applicationId,
    required DateTime acceptedAt,
  }) = _SponsoredAthleteItem;

  factory SponsoredAthleteItem.fromJson(Map<String, dynamic> json) =>
      _$SponsoredAthleteItemFromJson(json);
}

@freezed
abstract class SponsoredAthletesData with _$SponsoredAthletesData {
  const factory SponsoredAthletesData({
    required List<SponsoredAthleteItem> athletes,
    required int count,
  }) = _SponsoredAthletesData;

  factory SponsoredAthletesData.fromJson(Map<String, dynamic> json) =>
      _$SponsoredAthletesDataFromJson(json);
}

@freezed
abstract class SponsoredAthletesResponse with _$SponsoredAthletesResponse {
  const factory SponsoredAthletesResponse({
    required bool success,
    required String message,
    required SponsoredAthletesData data,
  }) = _SponsoredAthletesResponse;

  factory SponsoredAthletesResponse.fromJson(Map<String, dynamic> json) =>
      _$SponsoredAthletesResponseFromJson(json);
}
