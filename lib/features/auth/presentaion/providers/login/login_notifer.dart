import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/features/auth/presentaion/providers/login/state/login_state.dart';
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
            AppHelpers.showSuccessToast(context, "Login Successful");
            context.go(Routes.dashBoardRouteName);
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
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _authenticationRepository.googleSignIn();
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
            AppHelpers.showSuccessToast(context, "Login Successful");
            Future.delayed(const Duration(milliseconds: 1000), () {
              if (data.user.isNewUser) {
                context.go(Routes.selectSportScreen);
              } else {
                context.go(Routes.dashBoardRouteName);
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
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showErrorFlash(
          context,
          "You are currently offline ,Please check your internet connection",
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
