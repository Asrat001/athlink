import 'dart:developer';

import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/features/auth/presentation/providers/login/state/login_state.dart';
import 'package:athlink/features/notifications/domain/repository/notification_repository.dart';
import 'package:athlink/core/services/notification_service.dart';

import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../di.dart';
import '../../../../../routes/route_names.dart';
import '../../../../../core/services/internet_connection_service.dart';
import '../../../../../shared/utils/app_helpers.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final IAuthenticationRepository _authenticationRepository;

  LoginNotifier(this._authenticationRepository) : super(LoginState());

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final storageService = sl<LocalStorageService>();
      final response = await _authenticationRepository
          .signInWithEmailAndPassword(email: email, password: password);
      response.when(
        success: (data) async {
          await storageService.setAccessToken(data.accessToken);
          await storageService.setRefreshToken(data.refreshToken);
          await storageService.setUserData(data.user);
          state = state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
          );
          if (context.mounted) {
            // Update FCM Token
            try {
              final notificationRepo = sl<NotificationRepository>();
              final token = await NotificationService.instance.getFcmToken();
              if (token != null) {
                await notificationRepo.updateFcmToken(
                  token: token,
                  device: AppHelpers.getDeviceType(),
                );
              }
            } catch (e) {
              log("Failed to update FCM token on login: $e");
            }

            AppHelpers.showSuccessToast(context, "Login Successful");
            if (data.user.role == 'athlete') {
              context.go(Routes.athleteDashBoardRouteName);
            } else {
              context.go(Routes.dashBoardRouteName);
            }
          }
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            isError: true,
            isSuccess: false,
          );
          if (context.mounted) {
            AppHelpers.showErrorFlash(
              context,
              NetworkExceptions.getErrorMessage(error),
            );
          }
        },
      );
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (true) {
      state = state.copyWith(isLoading: true);
      final response = await _authenticationRepository.googleSignIn();
      log(response.toString());
      final storageService = sl<LocalStorageService>();
      response.when(
        success: (data) async {
          state = state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
          );

          await storageService.setAccessToken(data.accessToken);
          await storageService.setRefreshToken(data.refreshToken);
          await storageService.setUserData(data.user);
          state = state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
          );
          if (context.mounted) {
            // Update FCM Token
            try {
              final notificationRepo = sl<NotificationRepository>();
              final token = await NotificationService.instance.getFcmToken();
              if (token != null) {
                await notificationRepo.updateFcmToken(
                  token: token,
                  device: AppHelpers.getDeviceType(),
                );
              }
            } catch (e) {
              log("Failed to update FCM token on google login: $e");
            }

            AppHelpers.showSuccessToast(context, "Login Successful");
            Future.delayed(const Duration(milliseconds: 1000), () {
              if (data.user.isNewUser ||
                  data.user.role == "" ||
                  data.user.role == null) {
                context.push(Routes.accountTypeSelectionRouteName, extra: true);
              } else {
                if (data.user.role == 'athlete') {
                  context.go(Routes.athleteDashBoardRouteName);
                } else {
                  context.go(Routes.dashBoardRouteName);
                }
              }
            });
          }
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            isError: true,
            isSuccess: false,
          );
          if (context.mounted) {
            AppHelpers.showErrorFlash(
              context,
              NetworkExceptions.getErrorMessage(error),
            );
          }
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showErrorFlash(
          context,
          "No internet connection. Please check your network settings.",
        );
      }
    }
  }

  Future<void> appleSignIn(BuildContext context) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      log("LoginNotifier: Starting Apple Sign-In...");
      final response = await _authenticationRepository.appleSignIn();
      log("LoginNotifier: Apple Sign-In Response: $response");
      final storageService = sl<LocalStorageService>();
      response.when(
        success: (data) async {
          state = state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
          );

          await storageService.setAccessToken(data.accessToken);
          await storageService.setRefreshToken(data.refreshToken);
          await storageService.setUserData(data.user);
          state = state.copyWith(
            isLoading: false,
            isError: false,
            isSuccess: true,
          );
          if (context.mounted) {
            // Update FCM Token
            try {
              final notificationRepo = sl<NotificationRepository>();
              final token = await NotificationService.instance.getFcmToken();
              if (token != null) {
                await notificationRepo.updateFcmToken(
                  token: token,
                  device: AppHelpers.getDeviceType(),
                );
              }
            } catch (e) {
              log("Failed to update FCM token on apple login: $e");
            }

            AppHelpers.showSuccessToast(context, "Login Successful");
            Future.delayed(const Duration(milliseconds: 1000), () {
              if (data.user.isNewUser ||
                  data.user.role == "" ||
                  data.user.role == null) {
                context.push(Routes.accountTypeSelectionRouteName, extra: true);
              } else {
                if (data.user.role == 'athlete') {
                  context.go(Routes.athleteDashBoardRouteName);
                } else {
                  context.go(Routes.dashBoardRouteName);
                }
              }
            });
          }
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            isError: true,
            isSuccess: false,
          );
          if (context.mounted) {
            AppHelpers.showErrorFlash(
              context,
              NetworkExceptions.getErrorMessage(error),
            );
          }
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showErrorFlash(
          context,
          "No internet connection. Please check your network settings.",
        );
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    final response = await _authenticationRepository.signOut();
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isError: false,
          isSuccess: true,
        );
        if (context.mounted) {
          AppHelpers.showSuccessToast(context, "Logout Successful");
          context.go(Routes.loginRouteName);
        }
      },
      failure: (error) {},
    );
  }

  void reset() {
    state = LoginState();
  }
}
