import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_models.freezed.dart';
part 'feed_models.g.dart';

// Feed API response models

@freezed
abstract class SportCategory with _$SportCategory {
  const factory SportCategory({
    @JsonKey(name: '_id') String? id,
    String? name,
  }) = _SportCategory;

  factory SportCategory.fromJson(Map<String, dynamic> json) =>
      _$SportCategoryFromJson(json);
}

@freezed
abstract class Sport with _$Sport {
  const factory Sport({
    @JsonKey(name: '_id') String? id,
    String? name,
    SportCategory? categoryId,
    String? icon,
  }) = _Sport;

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);
}

@freezed
abstract class SponsorStats with _$SponsorStats {
  const factory SponsorStats({
    @Default(0) int sponsorshipCampaigns,
    @Default(0) int athletesSponsored,
    @Default(0) int globalPartners,
  }) = _SponsorStats;

  factory SponsorStats.fromJson(Map<String, dynamic> json) =>
      _$SponsorStatsFromJson(json);
}

@freezed
abstract class SponsorProfile with _$SponsorProfile {
  const factory SponsorProfile({
    SponsorStats? stats,
    String? name,
    String? profileImageUrl,
    String? bannerImageUrl,
    @Default([]) List<dynamic> jobPosts,
    @Default({}) Map<String, String> socialLinks,
  }) = _SponsorProfile;

  factory SponsorProfile.fromJson(Map<String, dynamic> json) =>
      _$SponsorProfileFromJson(json);
}

@freezed
abstract class Sponsor with _$Sponsor {
  const factory Sponsor({
    @JsonKey(name: '_id') String? id,
    String? email,
    String? name,
    SponsorProfile? sponsorProfile,
    @Default([]) List<Sport> sport,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);
}

@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    String? name,
    String? rank,
    String? difficulty,
    int? score,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

@freezed
abstract class AthleteProfile with _$AthleteProfile {
  const factory AthleteProfile({
    String? name,
    String? profileImageUrl,
    int? age,
    String? position,
    String? location,
    String? level,
    double? rating,
    String? countryFlag,
    @Default(0) int sponsorshipDone,
    @Default("") String highestSocialMediaPresence,
    @Default("") String club,
    @Default([]) List<Achievement> achievements,
  }) = _AthleteProfile;

  factory AthleteProfile.fromJson(Map<String, dynamic> json) =>
      _$AthleteProfileFromJson(json);
}

@freezed
abstract class Athlete with _$Athlete {
  const factory Athlete({
    @JsonKey(name: '_id') String? id,
    String? email,
    String? name,
    AthleteProfile? athleteProfile,
    @Default([]) List<Sport> sport,
  }) = _Athlete;

  factory Athlete.fromJson(Map<String, dynamic> json) =>
      _$AthleteFromJson(json);
}

@freezed
abstract class FeedData with _$FeedData {
  const factory FeedData({
    @Default([]) List<Athlete> athletes,
    @Default([]) List<Sponsor> sponsors,
    @Default(0) int totalAthletes,
    @Default(0) int totalSponsors,
  }) = _FeedData;

  factory FeedData.fromJson(Map<String, dynamic> json) =>
      _$FeedDataFromJson(json);
}

@freezed
abstract class FeedResponse with _$FeedResponse {
  const factory FeedResponse({
    @Default(false) bool success,
    @Default('') String message,
    FeedData? data,
  }) = _FeedResponse;

  factory FeedResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedResponseFromJson(json);
}
