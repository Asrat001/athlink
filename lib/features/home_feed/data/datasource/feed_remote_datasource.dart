import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';

class FeedRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  FeedRemoteDataSource(this._httpClient);

  Future<FeedResponse> getFeed() async {
    return await safeApiCall(
      path: "/sponsors/feed",
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/sponsors/feed");
      },
      fromData: (data) => FeedResponse.fromJson(data),
    );
  }
}
