// features/auth/presentation/providers/otp_verification/otp_verification_provider.dart
import 'dart:async';

import 'package:athlink/features/auth/presentaion/providers/otp_verification/state/otp_verification_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class OtpVerificationNotifier extends StateNotifier<OtpVerificationState> {
  final IAuthenticationRepository _authenticationRepository;
  Timer? _resendTimer;

  // Navigation callback
  Function(String, String, String)? _onNavigateCallback;

  OtpVerificationNotifier(this._authenticationRepository)
    : super(OtpVerificationState.initial());

  void setEmailAndPurpose({required String email, required String purpose}) {
    state = state.copyWith(email: email, purpose: purpose);
  }

  // Set navigation callback from UI
  void setNavigationCallback(Function(String, String, String) onNavigate) {
    _onNavigateCallback = onNavigate;
  }

  Future<void> verifyOtp({
    required String otp,
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

    final response = await _authenticationRepository.verifyOtp(otp: otp);
    final storageService = sl<LocalStorageService>();
    response.when(
      success: (data) async {
        await storageService.setAccessToken(data.accessToken);
        await storageService.setRefreshToken(data.refreshToken);
        await storageService.setUserData(data.user);
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
        );

        if (context.mounted) {
          AppHelpers.showSuccessToast(context, "OTP verified successfully");
        }

        // Trigger navigation callback after delay
        Future.delayed(const Duration(milliseconds: 1500), () {
          _onNavigateCallback?.call(state.email!, state.purpose!, otp);
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
    _resendTimer?.cancel();
    _onNavigateCallback = null;
    state = OtpVerificationState.initial();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    super.dispose();
  }
}
