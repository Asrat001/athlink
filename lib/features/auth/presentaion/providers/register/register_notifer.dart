import 'package:athlink/features/auth/presentaion/providers/register/state/register_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../di.dart';
import '../../../../../core/handlers/network_exceptions.dart';
import '../../../../../core/services/internet_connection_service.dart';
import '../../../../../core/services/local_storage_service.dart';
import '../../../../../shared/utils/app_helpers.dart';
import '../../../domain/repository/authentication_repository.dart';

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  final IAuthenticationRepository _authenticationRepository;
  RegisterStateNotifier(this._authenticationRepository)
    : super(RegisterState());

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _authenticationRepository
          .signUpWithEmailAndPassword(
            email: email,
            password: password,
            name: name,
          );
      response.when(
        success: (data) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: null,
            isSuccess: true,
            isSocialSignIn: false,
            isNewUser: true,
          );
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            isSuccess: false,
            errorMessage: error.toString(),
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
          "You are currently offline ,Please check your internet connection",
        );
      }
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
          await storageService.setAccessToken(data.accessToken);
          await storageService.setRefreshToken(data.refreshToken);
          await storageService.setUserData(data.user);
          state = state.copyWith(
            isLoading: false,
            errorMessage: null,
            isSuccess: true,
            isSocialSignIn: true,
            isNewUser: data.user.isNewUser,
          );
          if (context.mounted) {
            AppHelpers.showSuccessToast(context, "Login Successful");
          }
        },
        failure: (error) {
          state = state.copyWith(
            isLoading: false,
            errorMessage: NetworkExceptions.getErrorMessage(error),
            isSuccess: false,
          );
          if (context.mounted) {
            AppHelpers.showErrorFlash(
              context,
              "Login Failed ${NetworkExceptions.getErrorMessage(error)}",
            );
          }
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

  void resetState() {
    state = RegisterState();
  }
}
