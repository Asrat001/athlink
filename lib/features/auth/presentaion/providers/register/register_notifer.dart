import 'package:athlink/features/auth/presentaion/providers/register/state/register_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../di.dart';
import '../../../../../shared/handlers/network_exceptions.dart';
import '../../../../../shared/services/internet_connection_service.dart';
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
    if (!connected) {
      if (context.mounted) {
        AppHelpers.showErrorFlash(
          context,
          "You are currently offline, Please check your internet connection",
        );
      }
      return;
    }

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    final response = await _authenticationRepository.signUpWithEmailAndPassword(
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
  }

  void resetState() {
    state = RegisterState();
  }
}
