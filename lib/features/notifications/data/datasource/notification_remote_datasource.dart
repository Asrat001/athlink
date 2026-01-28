import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/features/notifications/domain/models/fcm_token_response.dart';

class NotificationRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  NotificationRemoteDataSource(this._httpClient);

  Future<ApiResponse<FcmTokenResponse>> updateFcmToken({
    required String token,
    required String device,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/notifications/fcm-token",
              data: {"token": token, "device": device},
            );
      },
      fromData: (data) => FcmTokenResponse.fromJson(data),
    );
  }
}
