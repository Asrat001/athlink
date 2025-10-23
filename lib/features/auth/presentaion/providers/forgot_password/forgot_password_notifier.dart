import 'package:athlink/features/auth/presentaion/providers/forgot_password/state/forgot_password_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';
import 'package:go_router/go_router.dart';
import '../../../../../di.dart';
import '../../../../../routes/route_names.dart';
import '../../../../../shared/services/internet_connection_service.dart';

class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  final IAuthenticationRepository _authenticationRepository;

  ForgotPasswordNotifier(this._authenticationRepository)
    : super(ForgotPasswordState.initial());

  Future<void> sendOtp({
    required String email,
    required BuildContext context,
  }) async {
    final connected = await sl<AppConnectivity>().connectivity();
    if (!connected) {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    } else {
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
            AppHelpers.showSuccessToast(context, "Password reset Otp sent");
          }
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (context.mounted) {
              context.push(
                Routes.verifyOtpRouteName,
                extra: {'email': email, 'purpose': "password_reset"},
              );
            }
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
  }

  void resetState() {
    state = ForgotPasswordState.initial();
  }
}
