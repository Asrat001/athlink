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
