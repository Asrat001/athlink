import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection_models.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class AthleteFeedRepository {
  // Feed
  Future<ApiResponse<FeedResponse>> getAthleteFeed();

  // Connection requests
  Future<ApiResponse<ConnectionResponse>> sendConnectionRequest(
    String athleteId,
  );
  Future<ApiResponse<List<FriendRequest>>> getReceivedRequests();
  Future<ApiResponse<List<SendFriendRequest>>> getSentRequests();

  // Connection actions
  Future<ApiResponse<Connection>> acceptRequest(String connectionId);
  Future<ApiResponse<Connection>> rejectRequest(String connectionId);
  Future<ApiResponse<bool>> cancelRequest(String connectionId);
  Future<ApiResponse<bool>> removeConnection(String connectionId);

  // Connection queries
  Future<ApiResponse<List<ConnectedUser>>> getConnections();
  Future<ApiResponse<ConnectionStatus>> getConnectionStatus(String athleteId);
}
