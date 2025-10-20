// features/auth/presentation/providers/forgot_password/forgot_password_provider.dart
import 'package:athlink/features/auth/presentaion/providers/forgot_password/state/forgot_password_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final IAuthenticationRepository _authenticationRepository;

  // Navigation callback
  Function(String, String)? _onNavigateCallback;

  ForgotPasswordNotifier(this._authenticationRepository)
    : super(ForgotPasswordState.initial());

  // Set navigation callback from UI
  void setNavigationCallback(Function(String, String) onNavigate) {
    _onNavigateCallback = onNavigate;
  }

  Future<void> sendOtp({
    required String email,
    required BuildContext context,
  }) async {
    // final connected = await sl<AppConnectivity>().connectivity();
    // if (!connected) {
    //   if (context.mounted) {
    //     AppHelpers.showErrorFlash(
    //       context,
    //       "You are currently offline, Please check your internet connection",
    //     );
    //   }
    //   return;
    // }

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    final response = await _authenticationRepository.forgotPassword(
      email: email,
    );

    response.when(
      success: (message) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
          email: email,
        );

        if (context.mounted) {
          AppHelpers.showSuccessToast(context, message);
        }

        // Trigger navigation callback after delay
        Future.delayed(const Duration(milliseconds: 1500), () {
          _onNavigateCallback?.call(email, 'password_reset');
        });
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
    _onNavigateCallback = null;
    state = ForgotPasswordState.initial();
  }
}
