import 'package:athlink/features/athlete/home_screen/domain/models/connection_models.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class AthleteFeedRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  AthleteFeedRemoteDataSource(this._httpClient);

  Future<ApiResponse<FeedResponse>> getAthleteFeed() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/athletes/feed");
      },
      fromData: (data) => FeedResponse.fromJson(data),
    );
  }

  Future<ApiResponse<ConnectionResponse>> sendConnectionRequest(
    String athleteId,
  ) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/connections/send/$athleteId");
      },
      fromData: (data) => ConnectionResponse.fromJson(data),
    );
  }
}
