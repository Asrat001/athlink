import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    required bool success,
    required ProfileUser user,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class ProfileUser with _$ProfileUser {
  const factory ProfileUser({
    @JsonKey(name: "_id") required String id,
    required String email,
    required String role,
    required String authProvider,
    required bool isEmailVerified,
    required List<ProfileSport> sport,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(name: "__v") required int version,
    String? googleId,
    SponsorProfile? sponsorProfile,
    @Default([]) List<dynamic> sponsoredBy,
  }) = _ProfileUser;

  factory ProfileUser.fromJson(Map<String, dynamic> json) =>
      _$ProfileUserFromJson(json);
}

@freezed
abstract class ProfileSport with _$ProfileSport {
  const factory ProfileSport({
    @JsonKey(name: "_id") required String id,
    required String name,
    required SportCategory categoryId,
    required String icon,
  }) = _ProfileSport;

  factory ProfileSport.fromJson(Map<String, dynamic> json) =>
      _$ProfileSportFromJson(json);
}

@freezed
abstract class SportCategory with _$SportCategory {
  const factory SportCategory({
    @JsonKey(name: "_id") required String id,
    required String name,
  }) = _SportCategory;

  factory SportCategory.fromJson(Map<String, dynamic> json) =>
      _$SportCategoryFromJson(json);
}

@freezed
abstract class SponsorProfile with _$SponsorProfile {
  const factory SponsorProfile({
    required Stats stats,
    required String address,
    required String bannerImageUrl,
    required String description,
    required String name,
    required String profileImageUrl,
    @Default([]) List<JobPost> jobPosts,
  }) = _SponsorProfile;

  factory SponsorProfile.fromJson(Map<String, dynamic> json) =>
      _$SponsorProfileFromJson(json);
}

@freezed
abstract class Stats with _$Stats {
  const factory Stats({
    @Default(0) int athletesSponsored,
    @Default(0) int globalPartners,
    @Default(0) int sponsorshipCampaigns,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

@freezed
abstract class JobPost with _$JobPost {
  const factory JobPost({
    @JsonKey(name: "_id") required String id,
    required Timeline timeline,
    required String title,
    @JsonKey(name: "sport_id") required String category,
    required String location,
    required String description,
    required String requirements,
    required DateTime createdAt,
    @Default([]) List<String> mediaUrls,
  }) = _JobPost;

  factory JobPost.fromJson(Map<String, dynamic> json) =>
      _$JobPostFromJson(json);
}

@freezed
abstract class Timeline with _$Timeline {
  const factory Timeline({DateTime? startDate, DateTime? endDate}) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}

@freezed
abstract class UpdateSponsorProfileResponse
    with _$UpdateSponsorProfileResponse {
  const factory UpdateSponsorProfileResponse({
    required bool success,
    required String message,
    required UpdatedSponsorProfile sponsorProfile,
  }) = _UpdateSponsorProfileResponse;

  factory UpdateSponsorProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSponsorProfileResponseFromJson(json);
}

@freezed
abstract class UpdatedSponsorProfile with _$UpdatedSponsorProfile {
  const factory UpdatedSponsorProfile({
    required String name,
    required String description,
    required String address,
    required String profileImageUrl,
    required String bannerImageUrl,
  }) = _UpdatedSponsorProfile;

  factory UpdatedSponsorProfile.fromJson(Map<String, dynamic> json) =>
      _$UpdatedSponsorProfileFromJson(json);
}
