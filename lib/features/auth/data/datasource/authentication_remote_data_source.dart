import 'package:dio/dio.dart';
import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';

class AuthenticationRemoteDataSource extends BaseRepository {
final DioHttpClient _httpClient;
AuthenticationRemoteDataSource( this._httpClient);

  Future<LoginResponse>login({required String email, required String password}) async {
    return await safeApiCall(
        path: "/auth/login",
        apiCall: () async {
          return await _httpClient.client(requireAuth: false).post(
            "/auth/login",
            data: {
              "email": email,
              "password": password,
            },
          );
        },
        fromData: (data)=> LoginResponse.fromJson(data)
    );
  }

  Future<LoginResponse>register({required String name, required String email, required String password}) async {
    return await safeApiCall(
        path: "/auth/register",
        apiCall: () async {
          return await _httpClient.client(requireAuth: false).post(
            "/auth/register",
            data: {
              "name": name,
              "email": email,
              "password": password,
            },
          );
        },
        fromData: (data)=> LoginResponse.fromJson(data)
    );
  }





}