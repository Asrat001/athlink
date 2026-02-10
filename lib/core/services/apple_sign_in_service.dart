import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/core/services/internet_connection_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:athlink/shared/utils/logger.dart';

class AppleAuthService {
  final AppConnectivity _appConnectivity;

  AppleAuthService(this._appConnectivity);

  Future<ApiResponse<AuthorizationCredentialAppleID>> signInWithApple() async {
    final connectivity = await _appConnectivity.connectivity();
    if (!connectivity) {
      return const ApiResponse.failure(
        error: NetworkExceptions.noInternetConnection(),
      );
    }

    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final credentialData = {
        'userIdentifier': credential.userIdentifier,
        'givenName': credential.givenName,
        'familyName': credential.familyName,
        'email': credential.email,
        'identityToken': credential.identityToken,
        'authorizationCode': credential.authorizationCode,
        'state': credential.state,
      };

      logger(credentialData);

      return ApiResponse.success(data: credential);
    } catch (error) {
      print("Apple Sign-In Error: $error");
      print("Apple Sign-In Error Type: ${error.runtimeType}");
      // Check if error is related to cancellation
      if (error is SignInWithAppleAuthorizationException &&
          error.code == AuthorizationErrorCode.canceled) {
        return const ApiResponse.failure(
          error: NetworkExceptions.defaultError("Sign in canceled"),
        );
      }

      return ApiResponse.failure(
        error: NetworkExceptions.getDioException(error),
      );
    }
  }
}
