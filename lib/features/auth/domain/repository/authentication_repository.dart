import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/features/auth/domain/models/registration_response.dart';

abstract class IAuthenticationRepository {
  Future<ApiResponse<LoginResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ApiResponse<RegistrationResponse>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<ApiResponse<LoginResponse>> googleSignIn();

  Future<ApiResponse<bool>> signOut();
  Future<ApiResponse<bool>> forgotPassword({required String email});
  Future<ApiResponse<LoginResponse>> verifyAccount({required String otp});
  Future<ApiResponse<bool>> resetPassword({
    required String password,
    required String otp,
  });

  // Future<ApiResponse<VerificationResponse>> verifyOtp({required String otp});
}
