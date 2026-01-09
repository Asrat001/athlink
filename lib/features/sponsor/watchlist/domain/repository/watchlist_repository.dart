import 'package:athlink/features/sponsor/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class WatchlistRepository {
  Future<ApiResponse<WatchlistResponse>> getWatchlist();

  Future<ApiResponse<AddWatchlistResponse>> addToWatchlist({
    required String athleteId,
    String? notes,
  });

  Future<ApiResponse<UpdateWatchlistNotesResponse>> updateWatchlistNotes({
    required String athleteId,
    required String notes,
  });

  Future<ApiResponse<DeleteWatchlistResponse>> deleteAthleteFromWatchlist({
    required String athleteId,
  });
}
