import 'dart:developer';
import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/features/auth/domain/models/verification_response.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

import '../../domain/models/registration_response.dart';

class AuthenticationRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;
  AuthenticationRemoteDataSource(this._httpClient);

  Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post("/auth/login", data: {"email": email, "password": password});
      },
      fromData: (data) => LoginResponse.fromJson(data),
    );
  }

  Future<ApiResponse<LoginResponse>> loginWithGoogle({
    required String idToken,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post("/auth/sign-in-with-google", data: {"idToken": idToken});
      },
      fromData: (data) => LoginResponse.fromJson(data),
    );
  }

  Future<ApiResponse<RegistrationResponse>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post(
              "/auth/register",
              data: {"email": email, "password": password},
            );
      },
      fromData: (data) => RegistrationResponse.fromJson(data),
    );
  }

  Future<ApiResponse<bool>> forgotPassword({required String email}) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post("/auth/forgot-password", data: {"email": email});
      },
      fromData: (data) => true,
    );
  }

  Future<ApiResponse<bool>> resetPassword({
    required String password,
    required String otp,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post(
              "/auth/reset-password",
              queryParameters: {'otp': otp},
              data: {'password': password},
            );
      },
      fromData: (data) => true,
    );
  }

  Future<ApiResponse<LoginResponse>> verifyAccount({
    required String otp,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .get(
              "/auth/verify-email",
              queryParameters: {'otp': int.tryParse(otp) ?? otp},
            );
      },
      fromData: (data) => LoginResponse.fromJson(data),
    );
  }

  Future<ApiResponse<VerificationResponse>> verifyOtp({
    required String otp,
  }) async {
    log("Verifying OTP: $otp");
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .get(
              "/auth/verify-email",
              queryParameters: {'otp': int.tryParse(otp) ?? otp},
            );
      },
      fromData: (data) => VerificationResponse.fromJson(data),
    );
  }
}
