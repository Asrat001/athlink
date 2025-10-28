import 'package:athlink/features/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';

class WatchlistRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  WatchlistRemoteDataSource(this._httpClient);

  Future<WatchlistResponse> getWatchlist() async {
    return await safeApiCall(
      path: "/sponsors/watchlist",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsors/watchlist");
      },
      fromData: (data) => WatchlistResponse.fromJson(data),
    );
  }

  Future<AddWatchlistResponse> addToWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    return await safeApiCall(
      path: "/sponsors/watchlist",
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).post(
          "/sponsors/watchlist",
          data: {
            "athleteId": athleteId,
            if (notes != null) "notes": notes,
          },
        );
      },
      fromData: (data) => AddWatchlistResponse.fromJson(data),
    );
  }
}
