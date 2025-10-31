import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_list_model.freezed.dart';
part 'job_list_model.g.dart';

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
    @Default([]) List<dynamic> applicants,
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
