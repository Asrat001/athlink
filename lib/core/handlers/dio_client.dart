import 'package:dio/dio.dart';
import 'package:athlink/core/handlers/token_intreceptor.dart';
import '../../shared/constant/constants.dart';

class DioHttpClient {
  static final DioHttpClient _instance = DioHttpClient._internal();
  late final Dio _dio;

  factory DioHttpClient() {
    return _instance;
  }

  DioHttpClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: cBaseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors only once
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
  }

  Dio client({bool requireAuth = false}) {
    // Remove existing TokenInterceptor to avoid duplicates if client is called multiple times
    _dio.interceptors.removeWhere((element) => element is TokenInterceptor);

    // Add TokenInterceptor with current requireAuth setting
    _dio.interceptors.add(
      TokenInterceptor(requireAuth: requireAuth, dio: _dio),
    );

    return _dio;
  }
}
