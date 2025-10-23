import 'package:athlink/features/auth/presentaion/providers/rest_password/state/reset_password_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/shared/services/internet_connection_service.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  final IAuthenticationRepository _authenticationRepository;

  ResetPasswordNotifier(this._authenticationRepository)
    : super(ResetPasswordState.initial());

  Future<void> resetPassword({
    required String password,
    required String otp,
    required BuildContext context,
  }) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (!connected) {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
      return;
    }

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    final response = await _authenticationRepository.resetPassword(
      password: password,
      otp: otp,
    );

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
        );
        if (context.mounted) {
          AppHelpers.showSuccessToast(context, "Password reset successful");
        }
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
  }

  void resetState() {
    state = ResetPasswordState.initial();
  }
}
