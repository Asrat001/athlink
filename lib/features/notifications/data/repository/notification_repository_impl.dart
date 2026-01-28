import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/notifications/data/datasource/notification_remote_datasource.dart';
import 'package:athlink/features/notifications/domain/models/fcm_token_response.dart';
import 'package:athlink/features/notifications/domain/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<FcmTokenResponse>> updateFcmToken({
    required String token,
    required String device,
  }) async {
    return await _remoteDataSource.updateFcmToken(token: token, device: device);
  }
}
