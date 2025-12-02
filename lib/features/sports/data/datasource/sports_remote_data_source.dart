// features/sports/data/datasource/sports_remote_data_source.dart
import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:athlink/features/sports/domain/models/sport_selection_model.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class SportsRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;
  SportsRemoteDataSource(this._httpClient);

  Future<ApiResponse<List<Sport>>> getSports() async {
    return await safeApiCall(
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

  Future<ApiResponse<SportSelectionResponse>> selectSports({
    required List<String> sportIds,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/auth/sport", data: {'sportId': sportIds});
      },
      fromData: (data) => SportSelectionResponse.fromJson(data),
    );
  }
}
