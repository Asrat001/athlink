import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../handlers/api_response.dart';
import '../handlers/network_exceptions.dart';
import 'internet_connection_service.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final AppConnectivity _appConnectivity;
  bool _isGoogleSignInInitialized = false;

  GoogleAuthService(this._appConnectivity) {
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    String clientId;

    // if (kDebugMode) {
    //   clientId = dotenv.env['GOOGLE_DEBUG_CLIENT_ID']!;
    // }
    if (Platform.isIOS) {
      clientId = dotenv.env['GOOGLE_IOS_CLIENT_ID']!;
    } else {
      clientId = dotenv.env['GOOGLE_ANDROID_CLIENT_ID']!;
    }

    final serverClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID']!;

    try {
      await _googleSignIn.initialize(
        clientId: clientId,
        serverClientId: serverClientId,
      );
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<ApiResponse<GoogleSignInAccount>> signInWithGoogle() async {
    final connectivity = await _appConnectivity.connectivity();
    if (!connectivity) {
      return const ApiResponse.failure(
        error: NetworkExceptions.noInternetConnection(),
      );
    }

    await _ensureGoogleSignInInitialized();
    try {
      await _googleSignIn.signOut();
      print("Google Sign-In initialized successfully");
      try {
        final GoogleSignInAccount? account = await _googleSignIn.authenticate();
        if (account == null) {
          return const ApiResponse.failure(
            error: NetworkExceptions.defaultError("Sign in canceled"),
          );
        }
        print("Google Sign-In success: ${account.displayName}");
        return ApiResponse.success(data: account);
      } on PlatformException catch (e) {
        print("Google Sign-In failed with PlatformException: ${e.code}");
        if (e.code == 'sign_in_canceled') {
          return const ApiResponse.failure(
            error: NetworkExceptions.defaultError("Sign in canceled"),
          );
        }
        return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
      } catch (e) {
        print("Google Sign-In failed: $e");
        return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
      }
    } on GoogleSignInException catch (e) {
      print("Google Sign-In failed: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    } catch (error) {
      print("Google Sign-In failed: $error");
      return ApiResponse.failure(
        error: NetworkExceptions.getDioException(error),
      );
    }
  }

  Future<GoogleSignInAuthentication> getAuthTokens(
    GoogleSignInAccount account,
  ) async {
    return await account.authentication;
  }
}
