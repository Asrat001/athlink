import 'dart:io';

import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/notifications/domain/models/fcm_token_response.dart';
import 'package:athlink/features/notifications/domain/repository/notification_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for the notification repository
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return sl<NotificationRepository>();
});

// Provider for updating FCM token
final updateFcmTokenProvider =
    FutureProvider.family<ApiResponse<FcmTokenResponse>, FcmTokenParams>((
      ref,
      params,
    ) async {
      final repository = ref.read(notificationRepositoryProvider);
      return await repository.updateFcmToken(
        token: params.token,
        device: params.device,
      );
    });

// Helper class to pass parameters to the provider
class FcmTokenParams {
  final String token;
  final String device;

  FcmTokenParams({required this.token, required this.device});
}

// Helper function to get device type
String getDeviceType() {
  if (Platform.isAndroid) {
    return 'android';
  } else if (Platform.isIOS) {
    return 'ios';
  } else {
    return 'web';
  }
}
