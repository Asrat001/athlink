import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_post_request.freezed.dart';
part 'job_post_request.g.dart';

@freezed
abstract class JobPostRequest with _$JobPostRequest {
  const factory JobPostRequest({
    required String title,
    @JsonKey(name: 'sport_id') String? sportId,
    String? location,
    String? description,
    String? timelineStart,
    String? timelineEnd,
    String? requirements,
    List<String>? media,
    String? budget,
  }) = _JobPostRequest;

  factory JobPostRequest.fromJson(Map<String, dynamic> json) =>
      _$JobPostRequestFromJson(json);
}

@freezed
abstract class CreateJobPostResponse with _$CreateJobPostResponse {
  const factory CreateJobPostResponse({
    required bool success,
    required String message,
    Map<String, dynamic>? jobPost,
  }) = _CreateJobPostResponse;

  factory CreateJobPostResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateJobPostResponseFromJson(json);
}

@freezed
abstract class UpdateJobPostRequest with _$UpdateJobPostRequest {
  const factory UpdateJobPostRequest({
    String? title,
    @JsonKey(name: 'sport_id') String? sportId,
    String? location,
    String? description,
    String? timelineStart,
    String? timelineEnd,
    String? requirements,
    List<String>? media,
    String? budget,
  }) = _UpdateJobPostRequest;

  factory UpdateJobPostRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobPostRequestFromJson(json);
}

@freezed
abstract class UpdateJobPostResponse with _$UpdateJobPostResponse {
  const factory UpdateJobPostResponse({
    required bool success,
    required String message,
    Map<String, dynamic>? jobPost,
  }) = _UpdateJobPostResponse;

  factory UpdateJobPostResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobPostResponseFromJson(json);
}

@freezed
abstract class DeleteJobPostResponse with _$DeleteJobPostResponse {
  const factory DeleteJobPostResponse({
    required bool success,
    required String message,
  }) = _DeleteJobPostResponse;

  factory DeleteJobPostResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteJobPostResponseFromJson(json);
}
