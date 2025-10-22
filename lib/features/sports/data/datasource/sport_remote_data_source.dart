
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';
import '../../domain/models/sport_model.dart';
import '../../domain/models/sport_selection_model.dart';

class SportsRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;
  SportsRemoteDataSource(this._httpClient);

  Future<List<Sport>> getSports() async {
    return await safeApiCall(
      path: "/sports",
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/sports");
      },
      fromData: (data) {
        if (data is List) {
          return data.map<Sport>((sport) => Sport.fromJson(sport)).toList();
        } else if (data is Map<String, dynamic> && data.containsKey('sports')) {
          final sportsList = data['sports'] as List;
          return sportsList
              .map<Sport>((sport) => Sport.fromJson(sport))
              .toList();
        }
        return [];
      },
    );
  }

  Future<SportSelectionResponse> selectSports({
    required List<String> sportIds,
  }) async {
    return await safeApiCall(
      path: "/auth/sport",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/auth/sport", data: {'sportId': sportIds});
      },
      fromData: (data) => SportSelectionResponse.fromJson(data),
    );
  }
}