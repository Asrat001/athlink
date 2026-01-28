import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor_search_response.freezed.dart';
part 'sponsor_search_response.g.dart';

@freezed
abstract class SponsorSearchResponse with _$SponsorSearchResponse {
  const factory SponsorSearchResponse({
    required bool success,
    required String message,
    required SponsorSearchData data,
  }) = _SponsorSearchResponse;

  factory SponsorSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SponsorSearchResponseFromJson(json);
}

@freezed
abstract class SponsorSearchData with _$SponsorSearchData {
  const factory SponsorSearchData({
    required List<SponsorSearchModel> sponsors,
    required int count,
  }) = _SponsorSearchData;

  factory SponsorSearchData.fromJson(Map<String, dynamic> json) =>
      _$SponsorSearchDataFromJson(json);
}

@freezed
abstract class SponsorSearchModel with _$SponsorSearchModel {
  const factory SponsorSearchModel({
    @JsonKey(name: '_id') required String id,
    required String email,
    required String role,
    required SponsorProfileModel sponsorProfile,
    required List<SponsorSportModel> sport,
    required bool isOnline,
    String? lastSeenAt,
  }) = _SponsorSearchModel;

  factory SponsorSearchModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorSearchModelFromJson(json);
}

@freezed
abstract class SponsorProfileModel with _$SponsorProfileModel {
  const factory SponsorProfileModel({
    required String name,
    String? address,
    String? profileImageUrl,
    String? description,
  }) = _SponsorProfileModel;

  factory SponsorProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorProfileModelFromJson(json);
}

@freezed
abstract class SponsorSportModel with _$SponsorSportModel {
  const factory SponsorSportModel({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? icon,
  }) = _SponsorSportModel;

  factory SponsorSportModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorSportModelFromJson(json);
}
