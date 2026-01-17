import 'dart:io';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/models/paginated_response.dart';
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:athlink/features/athlete/profile/domain/models/career_record.dart';
import 'package:athlink/features/athlete/profile/domain/models/competition_result_model.dart';

abstract class AthletProfileRepository {
  Future<ApiResponse<ProfileModel?>> getAthleteProfile({
    required String athleteId,
  });

  Future<ApiResponse<ProfileModel>> updateAthleteProfile({
    required String athleteId,
    required Map<String, dynamic> data,
    File? profileImage,
    File? coverImage,
  });

  // Career Journey methods
  Future<ApiResponse<PaginatedResponse<CareerJourneyModel>>>
  getAthleteCareerJourney({
    required String athleteId,
    int page = 1,
    int limit = 10,
  });

  Future<ApiResponse<CareerJourneyModel>> createCareerJourney({
    required String athleteId,
    required Map<String, dynamic> careerJourney,
    File? logo,
  });

  Future<ApiResponse<CareerJourneyModel>> updateCareerJourney({
    required String athleteId,
    required String careerJourneyId,
    required Map<String, dynamic> careerJourney,
    File? logo,
  });

  // Competition Results methods
  Future<ApiResponse<PaginatedResponse<CompetitionResultModel>>>
  getAthleteCompetitionResults({
    required String athleteId,
    int page = 1,
    int limit = 10,
  });

  Future<ApiResponse<CompetitionResultModel>> createCompetitionResult({
    required String athleteId,
    required Map<String, dynamic> competitionResult,
    List<File>? media,
  });

  Future<ApiResponse<CompetitionResultModel>> updateCompetitionResult({
    required String athleteId,
    required String resultId,
    required Map<String, dynamic> competitionResult,
    List<File>? media,
  });
}
