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
    // Check authentication status first
    final storageService = sl<LocalStorageService>();
    final userData = storageService.getUserData();
    final accessToken = await storageService.getAccessToken();

    // Delayed to ensure animations complete
    await Future.delayed(const Duration(milliseconds: 500));

    if (context.mounted) {
      if (userData != null && accessToken != null) {
        // User is authenticated, go to main screens
        context.go(Routes.dashBoardRouteName);
      } else {
        // User is guest or not authenticated, allow guest access to main screens may be i i liked
        context.go(Routes.loginRouteName);
      }
    }
  }
}
