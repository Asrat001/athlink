import 'dart:developer';
import 'package:athlink/features/notifications/domain/repository/notification_repository.dart';
import 'package:athlink/core/services/notification_service.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/features/splash/presentation/providers/state/splash_state.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../di.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(const SplashState());

  Future<void> getUserStatus(BuildContext context) async {
    final storageService = sl<LocalStorageService>();
    final userData = storageService.getUserData();
    final accessToken = await storageService.getAccessToken();

    await Future.delayed(const Duration(milliseconds: 500));

    if (context.mounted) {
      if (userData != null && accessToken != null) {
        // Update FCM Token
        try {
          final notificationRepo = sl<NotificationRepository>();
          final token = await NotificationService.instance.getFcmToken();
          if (token != null) {
            // Fire and forget, don't await strictly if it blocks navigation,
            // but since we are in splash, maybe better to await or just let it run.
            // We'll await to ensure it's at least attempted before moving on,
            // or we can run it unawaited. Given it's a network call, unawaited might be better for splash speed,
            // but `updateFcmToken` is usually fast. Let's unawaited it to not block splash too long
            // OR keep it simple. Let's just call it.
            notificationRepo.updateFcmToken(
              token: token,
              device: AppHelpers.getDeviceType(),
            );
          }
        } catch (e) {
          log("Failed to update FCM token on splash: $e");
        }

        if (userData.role != "" &&
            userData.isNewUser &&
            userData.role != null) {
          context.go(Routes.selectSportScreen);
        } else if (userData.isNewUser == true ||
            userData.role == "" ||
            userData.role == null) {
          context.go(Routes.accountTypeSelectionRouteName, extra: true);
        } else if (userData.role == 'athlete') {
          context.go(Routes.athleteDashBoardRouteName);
        } else {
          context.go(Routes.dashBoardRouteName);
        }
      } else {
        context.go(Routes.loginRouteName);
      }
    }
  }
}
