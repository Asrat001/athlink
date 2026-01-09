import 'package:athlink/features/sponsor/watchlist/data/datasource/watchlist_remote_datasource.dart';
import 'package:athlink/features/sponsor/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/features/sponsor/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistRemoteDataSource _remoteDataSource;

  WatchlistRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<WatchlistResponse>> getWatchlist() async {
    return await _remoteDataSource.getWatchlist();
  }

  @override
  Future<ApiResponse<AddWatchlistResponse>> addToWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    return await _remoteDataSource.addToWatchlist(
      athleteId: athleteId,
      notes: notes,
    );
  }

  @override
  Future<ApiResponse<UpdateWatchlistNotesResponse>> updateWatchlistNotes({
    required String athleteId,
    required String notes,
  }) async {
    return await _remoteDataSource.updateWatchlistNotes(
      athleteId: athleteId,
      notes: notes,
    );
  }

  @override
  Future<ApiResponse<DeleteWatchlistResponse>> deleteAthleteFromWatchlist({
    required String athleteId,
  }) async {
    return await _remoteDataSource.deleteAthleteFromWatchlist(
      athleteId: athleteId,
    );
  }
}
