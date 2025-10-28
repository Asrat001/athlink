import 'dart:developer';
import 'package:athlink/features/watchlist/data/datasource/watchlist_remote_datasource.dart';
import 'package:athlink/features/watchlist/domain/models/watchlist_models.dart';
import 'package:athlink/features/watchlist/domain/repository/watchlist_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistRemoteDataSource _remoteDataSource;

  WatchlistRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<WatchlistResponse>> getWatchlist() async {
    try {
      final response = await _remoteDataSource.getWatchlist();
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get watchlist error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<AddWatchlistResponse>> addToWatchlist({
    required String athleteId,
    String? notes,
  }) async {
    try {
      final response = await _remoteDataSource.addToWatchlist(
        athleteId: athleteId,
        notes: notes,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Add to watchlist error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
