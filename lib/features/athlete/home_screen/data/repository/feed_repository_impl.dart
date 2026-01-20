import 'package:athlink/features/athlete/home_screen/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection_models.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/api_response.dart';

class AthleteFeedRepositoryImpl implements AthleteFeedRepository {
  final AthleteFeedRemoteDataSource _remoteDataSource;

  AthleteFeedRepositoryImpl(this._remoteDataSource);

  // Feed
  @override
  Future<ApiResponse<FeedResponse>> getAthleteFeed() async {
    return await _remoteDataSource.getAthleteFeed();
  }

  // Connection requests
  @override
  Future<ApiResponse<ConnectionResponse>> sendConnectionRequest(
    String athleteId,
  ) async {
    return await _remoteDataSource.sendConnectionRequest(athleteId);
  }

  @override
  Future<ApiResponse<List<FriendRequest>>> getReceivedRequests() async {
    return await _remoteDataSource.getReceivedRequests();
  }

  @override
  Future<ApiResponse<List<SendFriendRequest>>> getSentRequests() async {
    return await _remoteDataSource.getSentRequests();
  }

  // Connection actions
  @override
  Future<ApiResponse<Connection>> acceptRequest(String connectionId) async {
    return await _remoteDataSource.acceptRequest(connectionId);
  }

  @override
  Future<ApiResponse<Connection>> rejectRequest(String connectionId) async {
    return await _remoteDataSource.rejectRequest(connectionId);
  }

  @override
  Future<ApiResponse<bool>> cancelRequest(String connectionId) async {
    return await _remoteDataSource.cancelRequest(connectionId);
  }

  @override
  Future<ApiResponse<bool>> removeConnection(String connectionId) async {
    return await _remoteDataSource.removeConnection(connectionId);
  }

  // Connection queries
  @override
  Future<ApiResponse<List<ConnectedUser>>> getConnections() async {
    return await _remoteDataSource.getConnections();
  }

  @override
  Future<ApiResponse<ConnectionStatus>> getConnectionStatus(
    String athleteId,
  ) async {
    return await _remoteDataSource.getConnectionStatus(athleteId);
  }
}
