import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/features/auth/domain/models/reset_password_model.dart';
import 'package:athlink/features/auth/domain/models/verification_response.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class IAuthenticationRepository {
  Future<ApiResponse<LoginResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ApiResponse<dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<ApiResponse<ResetPasswordResponse>> resetPassword({
    required String token,
    required String password,
    required String otp,
  });

  Future<ApiResponse<dynamic>> forgotPassword({required String email});
  Future<ApiResponse<VerificationResponse>> verifyOtp({required String otp});

  Future<void> signOut();
}
