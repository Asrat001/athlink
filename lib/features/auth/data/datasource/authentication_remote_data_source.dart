import 'dart:developer';

import 'package:athlink/features/auth/domain/models/forgot_password_model.dart'
    show ForgotPasswordRequest;
import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/features/auth/domain/models/reset_password_model.dart';
import 'package:athlink/features/auth/domain/models/verification_response.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';

class AuthenticationRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;
  AuthenticationRemoteDataSource(this._httpClient);

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    return await safeApiCall(
      path: "/auth/login",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post("/auth/login", data: {"email": email, "password": password});
      },
      fromData: (data) => LoginResponse.fromJson(data),
    );
  }

  Future<dynamic> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return await safeApiCall(
      path: "/auth/register",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post(
              "/auth/register",
              data: {
                "name": name,
                "email": email,
                "password": password,
                "role": "sponsor",
              },
            );
      },
      fromData: (data) => data,
    );
  }

  Future<dynamic> forgotPassword({required String email}) async {
    return await safeApiCall(
      path: "/auth/forgot-password",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post(
              "/auth/forgot-password",
              data: ForgotPasswordRequest(email: email).toJson(),
            );
      },
      fromData: (data) => data?["message"] ?? "Email sent successfully",
    );
  }

  Future<ResetPasswordResponse> resetPassword({
    required String token,
    required String password,
    required String otp,
  }) async {
    return await safeApiCall(
      path: "/auth/reset-password",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: false)
            .post(
              "/auth/reset-password",
              queryParameters: {'token': token, 'otp': otp},
              data: {'password': password},
            );
      },
      fromData: (data) => ResetPasswordResponse.fromJson(data),
    );
  }

  Future<VerificationResponse> verifyOtp({required String otp}) async {
    log("Verifying OTP: $otp");
    return await safeApiCall(
      path: "/auth/verify-email",
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
