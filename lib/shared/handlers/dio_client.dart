
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:athlink/shared/handlers/token_intreceptor.dart';
import '../constant/constants.dart';


class DioHttpClient {
  Dio client({bool requireAuth = false}) {
    final dio = Dio(
        BaseOptions(
            baseUrl: cBaseUrl,
            connectTimeout: Duration(seconds: 60),
            receiveTimeout: Duration(seconds: 60),
            sendTimeout: Duration(seconds: 60),
           headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
           }
        ));
    dio.interceptors.add(TokenInterceptor(requireAuth: requireAuth, dio: dio));
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (obj) {
        log(obj.toString());
      },
    ));
    return dio;
  }
}