import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';

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
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/athletes/$athleteId", data: data);
      },
      fromData: (data) {
        return ProfileModel.fromJson(data["data"]);
      },
    );
  }
}
