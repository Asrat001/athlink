import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';

abstract class AthletProfileRepository {
  Future<ApiResponse<ProfileModel?>> getAthleteProfile({
    required String athleteId,
  });

  Future<ApiResponse<ProfileModel>> updateAthleteProfile({
    required String athleteId,
    required Map<String, dynamic> data,
  });
}
