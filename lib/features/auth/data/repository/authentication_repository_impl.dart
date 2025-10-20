import 'dart:developer';

import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/features/auth/domain/models/reset_password_model.dart';
import 'package:athlink/features/auth/domain/models/verification_response.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import '../../../../shared/handlers/network_exceptions.dart';
import '../datasource/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  AuthenticationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<LoginResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Login error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<dynamic>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
      );

      return ApiResponse.success(data: response);
    } catch (e) {
      log("Registration error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<dynamic>> forgotPassword({required String email}) async {
    try {
      final response = await remoteDataSource.forgotPassword(email: email);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Forgot password error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<ResetPasswordResponse>> resetPassword({
    required String token,
    required String password,
    required String otp,
  }) async {
    try {
      final response = await remoteDataSource.resetPassword(
        token: token,
        password: password,
        otp: otp
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Reset password error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<VerificationResponse>> verifyOtp({
    required String otp,
  }) async {
    try {
      final response = await remoteDataSource.verifyOtp(otp: otp);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Verify OTP error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
