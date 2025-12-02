import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../handlers/api_response.dart';
import '../handlers/network_exceptions.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  GoogleAuthService() {
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
    await _ensureGoogleSignInInitialized();
    try {
      await _googleSignIn.signOut();
      print("Google Sign-In initialized successfully");
      try {
        final GoogleSignInAccount account = await _googleSignIn.authenticate(
          scopeHint: ['email'], // Specify required scopes
        );
        print(
          "Google Sign-In initialized successfully: ${account.displayName}",
        );
        return ApiResponse.success(data: account);
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
