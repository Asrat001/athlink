import 'package:athlink/features/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class WatchlistRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  WatchlistRemoteDataSource(this._httpClient);

  Future<ApiResponse<WatchlistResponse>> getWatchlist() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsors/watchlist");
      },
      fromData: (data) => WatchlistResponse.fromJson(data),
    );
  }

  Future<ApiResponse<AddWatchlistResponse>> addToWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/sponsors/watchlist",
              data: {"athleteId": athleteId, if (notes != null) "notes": notes},
            );
      },
      fromData: (data) => AddWatchlistResponse.fromJson(data),
    );
  }

  Future<ApiResponse<UpdateWatchlistNotesResponse>> updateWatchlistNotes({
    required String athleteId,
    required String notes,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/sponsors/watchlist/$athleteId", data: {"notes": notes});
      },
      fromData: (data) => UpdateWatchlistNotesResponse.fromJson(data),
    );
  }

  Future<ApiResponse<DeleteWatchlistResponse>> deleteAthleteFromWatchlist({
    required String athleteId,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/sponsors/watchlist/$athleteId");
      },
      fromData: (data) => DeleteWatchlistResponse.fromJson(data),
    );
  }
}
