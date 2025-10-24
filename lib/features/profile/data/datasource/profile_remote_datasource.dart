import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';

class ProfileRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  ProfileRemoteDataSource(this._httpClient);

  Future<ProfileResponse> getProfile() async {
    return await safeApiCall(
      path: "/auth/profile",
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/auth/profile");
      },
      fromData: (data) => ProfileResponse.fromJson(data),
    );
  }
}
