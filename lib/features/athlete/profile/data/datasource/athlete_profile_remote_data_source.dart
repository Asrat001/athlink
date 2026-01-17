import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record.dart';
import 'package:athlink/features/athlete/profile/domain/models/competition_result_model.dart';
import 'package:athlink/core/models/paginated_response.dart';

class AthleteProfileRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  AthleteProfileRemoteDataSource(this._httpClient);

  Future<ApiResponse<ProfileModel?>> getAthleteProfile({
    required String athleteId,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/athletes/$athleteId");
      },
      fromData: (data) {
        final profileData = data["data"];
        if (profileData != null &&
            profileData is Map<String, dynamic> &&
            profileData.isNotEmpty) {
          return ProfileModel.fromJson(profileData);
        }
        return null;
      },
    );
  }

  Future<ApiResponse<ProfileModel>> updateAthleteProfile({
    required String athleteId,
    required Map<String, dynamic> data,
    File? profileImage,
    File? coverImage,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        dynamic requestData;

        if (profileImage != null || coverImage != null) {
          Map<String, dynamic> map = {...data};

          if (profileImage != null) {
            map['profilePhoto'] = await MultipartFile.fromFile(
              profileImage.path,
              filename: profileImage.path.split('/').last,
            );
          }

          if (coverImage != null) {
            map['coverPhoto'] = await MultipartFile.fromFile(
              coverImage.path,
              filename: coverImage.path.split('/').last,
            );
          }

          requestData = FormData.fromMap(map);
        } else {
          requestData = data;
        }

        return await _httpClient
            .client(requireAuth: true)
            .put("/athletes/$athleteId", data: requestData);
      },
      fromData: (data) {
        return ProfileModel.fromJson(data["data"]);
      },
    );
  }

  Future<ApiResponse<PaginatedResponse<CareerJourneyModel>>>
  getAthleteCareerJourney({
    required String athleteId,
    int page = 1,
    int limit = 10,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get(
              "/athletes/$athleteId/career",
              queryParameters: {"page": page, "limit": limit},
            );
      },
      fromData: (data) {
        return PaginatedResponse.fromJson(
          data,
          (json) => CareerJourneyModel.fromJson(json as Map<String, dynamic>),
        );
      },
    );
  }

  Future<ApiResponse<CareerJourneyModel>> createCareerJourney({
    required String athleteId,
    required Map<String, dynamic> careerJourney,
    File? logo,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        dynamic requestData = careerJourney;

        if (logo != null) {
          requestData = FormData.fromMap({
            ...careerJourney,
            'logo': await MultipartFile.fromFile(logo.path),
          });
        }

        return await _httpClient
            .client(requireAuth: true)
            .post("/athletes/$athleteId/career", data: requestData);
      },
      fromData: (data) {
        return CareerJourneyModel.fromJson(data["data"]);
      },
    );
  }

  Future<ApiResponse<CareerJourneyModel>> updateCareerJourney({
    required String athleteId,
    required String careerJourneyId,
    required Map<String, dynamic> careerJourney,
    File? logo,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        dynamic requestData = careerJourney;

        if (logo != null) {
          requestData = FormData.fromMap({
            ...careerJourney,
            'logo': await MultipartFile.fromFile(logo.path),
          });
        }

        return await _httpClient
            .client(requireAuth: true)
            .put(
              "/athletes/$athleteId/career/$careerJourneyId",
              data: requestData,
            );
      },
      fromData: (data) {
        return CareerJourneyModel.fromJson(data["data"]);
      },
    );
  }

  Future<ApiResponse<PaginatedResponse<CompetitionResultModel>>>
  getAthleteCompetitionResults({
    required String athleteId,
    int page = 1,
    int limit = 10,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get(
              "/athletes/$athleteId/results",
              queryParameters: {"page": page, "limit": limit},
            );
      },
      fromData: (data) {
        return PaginatedResponse.fromJson(
          data,
          (json) =>
              CompetitionResultModel.fromJson(json as Map<String, dynamic>),
        );
      },
    );
  }

  Future<ApiResponse<CompetitionResultModel>> createCompetitionResult({
    required String athleteId,
    required Map<String, dynamic> competitionResult,
    List<File>? media,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        dynamic requestData = competitionResult;

        if (media != null && media.isNotEmpty) {
          final mediaFiles = <MultipartFile>[];
          for (var file in media) {
            mediaFiles.add(await MultipartFile.fromFile(file.path));
          }
          requestData = FormData.fromMap({
            ...competitionResult,
            'media': mediaFiles,
          });
        }

        return await _httpClient
            .client(requireAuth: true)
            .post("/athletes/$athleteId/results", data: requestData);
      },
      fromData: (data) {
        return CompetitionResultModel.fromJson(data["data"]);
      },
    );
  }

  Future<ApiResponse<CompetitionResultModel>> updateCompetitionResult({
    required String athleteId,
    required String resultId,
    required Map<String, dynamic> competitionResult,
    List<File>? media,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        dynamic requestData = competitionResult;

        if (media != null && media.isNotEmpty) {
          final mediaFiles = <MultipartFile>[];
          for (var file in media) {
            mediaFiles.add(await MultipartFile.fromFile(file.path));
          }
          requestData = FormData.fromMap({
            ...competitionResult,
            'media': mediaFiles,
          });
        }

        return await _httpClient
            .client(requireAuth: true)
            .put("/athletes/$athleteId/results/$resultId", data: requestData);
      },
      fromData: (data) {
        return CompetitionResultModel.fromJson(data["data"]);
      },
    );
  }
}
