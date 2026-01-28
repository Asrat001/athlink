import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/notifications/domain/models/fcm_token_response.dart';

abstract class NotificationRepository {
  Future<ApiResponse<FcmTokenResponse>> updateFcmToken({
    required String token,
    required String device,
  });
}
