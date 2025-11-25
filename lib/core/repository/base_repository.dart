import 'dart:developer';

import 'package:dio/dio.dart';

abstract class BaseRepository {
  void handleErrorResponse(dynamic responseData, {String path = ''}) {
    if (responseData is Map &&
        responseData.containsKey('status') &&
        responseData['status'] == 'FAILED') {
      final message = responseData['message'] as String? ?? 'Operation failed';
      final statusCode = responseData['status_code'] is int
          ? responseData['status_code']
          : 400;

      throw DioException(
        requestOptions: RequestOptions(path: path),
        error: message,
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: path),
          statusCode: statusCode,
          data: responseData,
        ),
      );
    }
  }

  Future<T> safeApiCall<T>({
    required Future<Response> Function() apiCall,
    required T Function(dynamic data) fromData,
    String path = '',
  }) async {
    try {
      final response = await apiCall();
      // Check for error response
      handleErrorResponse(response.data, path: path);
      return fromData(response.data);
    } catch (e) {
      log("API call error: $e");
      rethrow; // Re-throw to be handled by the repository
    }
  }
}
