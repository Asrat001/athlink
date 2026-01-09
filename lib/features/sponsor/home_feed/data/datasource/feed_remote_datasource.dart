import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class FeedRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  FeedRemoteDataSource(this._httpClient);

  Future<ApiResponse<FeedResponse>> getFeed() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsors/feed");
      },
      fromData: (data) => FeedResponse.fromJson(data),
    );
  }
}
