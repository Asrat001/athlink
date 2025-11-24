import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../handlers/api_response.dart';
import '../handlers/network_exceptions.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  GoogleAuthService() {
    _initializeGoogleSignIn();
  }

  Future<void> _initializeGoogleSignIn() async {
    String clientId =
        "127420764973-e5f1vjser07abg4h95l9r6l8facaqvkm.apps.googleusercontent.com";
    if (kDebugMode) {
      clientId =
          "127420764973-gkeotfv9v25lodnikmreccva1fulel0l.apps.googleusercontent.com";
    }
    try {
      await _googleSignIn.initialize(
        // Specify required scopes
        clientId: clientId,
        serverClientId:
            "127420764973-h5cbl6qnsjt2gkcsn31njm44a7tj079c.apps.googleusercontent.com",
      );
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  /// Always check Google sign in initialization before use
  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  Future<ApiResponse<GoogleSignInAccount>> signInWithGoogle() async {
    await _ensureGoogleSignInInitialized();
    try {
      // authenticate() throws exceptions instead of returning null
      await _googleSignIn.signOut();
      print("Google Sign-In initialized successfully");
     try{
            final GoogleSignInAccount account = await _googleSignIn.authenticate(
        scopeHint: ['email'], // Specify required scopes
      );
     print("Google Sign-In initialized successfully: ${account.displayName}");
      return ApiResponse.success(data: account);
     }catch(e){
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
