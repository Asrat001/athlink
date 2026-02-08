import 'dart:io';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/models/paginated_response.dart';
import 'package:athlink/features/athlete/profile/data/datasource/athlete_profile_remote_data_source.dart';
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record.dart';
import 'package:athlink/features/athlete/profile/domain/models/competition_result_model.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';

class AthleteProfileRepositoryImpl implements AthletProfileRepository {
  final AthleteProfileRemoteDataSource _remoteDataSource;

  AthleteProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<ProfileModel?>> getAthleteProfile({
    required String athleteId,
  }) async {
    return await _remoteDataSource.getAthleteProfile(athleteId: athleteId);
  }

  @override
  Future<ApiResponse<ProfileModel>> updateAthleteProfile({
    required String athleteId,
    required Map<String, dynamic> data,
    File? profileImage,
    File? coverImage,
  }) async {
    return await _remoteDataSource.updateAthleteProfile(
      athleteId: athleteId,
      data: data,
      profileImage: profileImage,
      coverImage: coverImage,
    );
  }

  @override
  Future<ApiResponse<PaginatedResponse<CareerJourneyModel>>>
  getAthleteCareerJourney({
    required String athleteId,
    int page = 1,
    int limit = 10,
  }) async {
    return await _remoteDataSource.getAthleteCareerJourney(
      athleteId: athleteId,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<ApiResponse<CareerJourneyModel>> createCareerJourney({
    required String athleteId,
    required Map<String, dynamic> careerJourney,
    File? logo,
  }) async {
    return await _remoteDataSource.createCareerJourney(
      athleteId: athleteId,
      careerJourney: careerJourney,
      logo: logo,
    );
  }

  @override
  Future<ApiResponse<CareerJourneyModel>> updateCareerJourney({
    required String athleteId,
    required String careerJourneyId,
    required Map<String, dynamic> careerJourney,
    File? logo,
  }) async {
    return await _remoteDataSource.updateCareerJourney(
      athleteId: athleteId,
      careerJourneyId: careerJourneyId,
      careerJourney: careerJourney,
      logo: logo,
    );
  }

  @override
  Future<ApiResponse<PaginatedResponse<CompetitionResultModel>>>
  getAthleteCompetitionResults({
    required String athleteId,
    int page = 1,
    int limit = 10,
  }) async {
    return await _remoteDataSource.getAthleteCompetitionResults(
      athleteId: athleteId,
      page: page,
      limit: limit,
    );
  }

  @override
  Future<ApiResponse<CompetitionResultModel>> createCompetitionResult({
    required String athleteId,
    required Map<String, dynamic> competitionResult,
    List<File>? media,
  }) async {
    return await _remoteDataSource.createCompetitionResult(
      athleteId: athleteId,
      competitionResult: competitionResult,
      media: media,
    );
  }

  @override
  Future<ApiResponse<CompetitionResultModel>> updateCompetitionResult({
    required String athleteId,
    required String resultId,
    required Map<String, dynamic> competitionResult,
    List<File>? media,
  }) async {
    return await _remoteDataSource.updateCompetitionResult(
      athleteId: athleteId,
      resultId: resultId,
      competitionResult: competitionResult,
      media: media,
    );
  }

  @override
  Future<ApiResponse<bool>> deleteCompetitionResult({
    required String athleteId,
    required String resultId,
  }) async {
    return await _remoteDataSource.deleteCompetitionResult(
      athleteId: athleteId,
      resultId: resultId,
    );
  }

  @override
  Future<ApiResponse<bool>> deleteCareerJourney({
    required String athleteId,
    required String careerJourneyId,
  }) async {
    return await _remoteDataSource.deleteCareerJourney(
      athleteId: athleteId,
      careerJourneyId: careerJourneyId,
    );
  }
}
