import 'dart:developer';

import 'package:athlink/features/auth/presentation/providers/register/state/register_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../di.dart';
import '../../../../../core/handlers/network_exceptions.dart';
import '../../../../../core/services/internet_connection_service.dart';
import '../../../../../core/services/local_storage_service.dart';
import '../../../../../routes/route_names.dart';
import '../../../../../shared/utils/app_helpers.dart';
import '../../../../../shared/extensions/account_type.dart';
import '../../../domain/repository/authentication_repository.dart';

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  final IAuthenticationRepository _authenticationRepository;

  RegisterStateNotifier(this._authenticationRepository)
    : super(const RegisterState());

  void setAccountType(AccountType accountType) {
    state = state.copyWith(selectedAccountType: accountType);
  }

  AccountType? get currentAccountType => state.selectedAccountType;

  Future<void> register({
    required String email,
    required String password,
    // required String name,
    required BuildContext context,
  }) async {
    log(state.selectedAccountType.toString());
    if (state.selectedAccountType == null) {
      AppHelpers.showErrorFlash(context, "Please select an account type");

      return;
    }

    final connected = await sl<AppConnectivity>().connectivity();
    if (true) {
      state = state.copyWith(isLoading: true);

      final response = await _authenticationRepository
          .signUpWithEmailAndPassword(
            email: email,
            password: password,
            // name: name,
            accountType: state.selectedAccountType!.value,
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
            errorMessage: NetworkExceptions.getErrorMessage(error),
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

  Future<void> googleSignIn(BuildContext context) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (true) {
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
            user: data.user,
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
          "No internet connection. Please check your network settings.",
        );
      }
    }
  }

  Future<void> appleSignIn(BuildContext context) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _authenticationRepository.appleSignIn();
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
            user: data.user,
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
          "No internet connection. Please check your network settings.",
        );
      }
    }
  }

  void resetState() {
    state = state.copyWith(
      isLoading: false,
      errorMessage: null,
      isSuccess: false,
      isSocialSignIn: false,
      isNewUser: true,
    );
  }

  Future<void> updateRoleAndNavigate(
    BuildContext context,
    AccountType selectedType,
  ) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final response = await _authenticationRepository.changeRole(
        role: selectedType.value,
      );
      state = state.copyWith(isLoading: false);
      response.when(
        success: (data) async {
          final storageService = sl<LocalStorageService>();
          await storageService.setUserData(data);
          if (context.mounted) {
            context.push(Routes.selectSportScreen);
          }
        },
        failure: (error) {
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
}
