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

  Future<UpdateWatchlistNotesResponse> updateWatchlistNotes({
    required String athleteId,
    required String notes,
  }) async {
    return await safeApiCall(
      path: "/sponsors/watchlist/$athleteId",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/sponsors/watchlist/$athleteId", data: {"notes": notes});
      },
      fromData: (data) => UpdateWatchlistNotesResponse.fromJson(data),
    );
  }

  Future<DeleteWatchlistResponse> deleteAthleteFromWatchlist({
    required String athleteId,
  }) async {
    return await safeApiCall(
      path: "/sponsors/watchlist/$athleteId",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/sponsors/watchlist/$athleteId");
      },
      fromData: (data) => DeleteWatchlistResponse.fromJson(data),
    );
  }
}
