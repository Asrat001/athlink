import 'package:athlink/features/athlete/home_screen/domain/models/connection.dart';
import 'package:athlink/features/athlete/home_screen/domain/models/connection_models.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class AthleteFeedRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  AthleteFeedRemoteDataSource(this._httpClient);

  // Feed
  Future<ApiResponse<FeedResponse>> getAthleteFeed() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/athletes/feed");
      },
      fromData: (data) => FeedResponse.fromJson(data),
    );
  }

  // Connection requests
  Future<ApiResponse<ConnectionResponse>> sendConnectionRequest(
    String athleteId,
  ) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/connections/send/$athleteId");
      },
      fromData: (data) => ConnectionResponse.fromJson(data),
    );
  }

  Future<ApiResponse<List<FriendRequest>>> getReceivedRequests() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/connections/requests/received");
      },
      fromData: (data) {
            final friendRequests = List<FriendRequest>.from(
          data["data"]["requests"].map((x) => FriendRequest.fromJson(x)),
        );
        return friendRequests;
      },
    );
  }

  Future<ApiResponse<List<SendFriendRequest>>> getSentRequests() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/connections/requests/sent");
      },
      fromData: (data) {
         final friendRequests = List<SendFriendRequest>.from(
          data["data"]["requests"].map((x) => SendFriendRequest.fromJson(x)),
        );
        return friendRequests;
      },
    );
  }

  // Connection actions
  Future<ApiResponse<Connection>> acceptRequest(String connectionId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/connections/accept/$connectionId");
      },
      fromData: (data) {
        final response = ConnectionActionResponse.fromJson(data);
        return response.data!;
      },
    );
  }

  Future<ApiResponse<Connection>> rejectRequest(String connectionId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/connections/reject/$connectionId");
      },
      fromData: (data) {
        final response = ConnectionActionResponse.fromJson(data);
        return response.data!;
      },
    );
  }

  Future<ApiResponse<bool>> cancelRequest(String connectionId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/connections/cancel/$connectionId");
      },
      fromData: (data) {
        return data['success'] as bool? ?? false;
      },
    );
  }

  Future<ApiResponse<bool>> removeConnection(String connectionId) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/connections/$connectionId");
      },
      fromData: (data) {
        return data['success'] as bool? ?? false;
      },
    );
  }

  // Connection queries
  Future<ApiResponse<List<ConnectedUser>>> getConnections() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/connections");
      },
      fromData: (data) {
        final connectedUsers = List<ConnectedUser>.from(
          data["data"]["connections"].map((x) => ConnectedUser.fromJson(x)),
        );
        return connectedUsers;
      },
    );
  }

  Future<ApiResponse<ConnectionStatus>> getConnectionStatus(
    String athleteId,
  ) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/connections/status/$athleteId");
      },
      fromData: (data) {
        final response = ConnectionStatusResponse.fromJson(data);
        return response.data!;
      },
    );
  }
}
