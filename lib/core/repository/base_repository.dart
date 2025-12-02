import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';

abstract class BaseRepository {
  /// Executes an API call and returns an [ApiResponse].
  Future<ApiResponse<T>> safeApiCall<T>({
    required Future<Response> Function() apiCall,
    required T Function(dynamic data) fromData,
  }) async {
    try {
      final response = await apiCall();
      _validateResponseData(response.data, path: response.requestOptions.path);
      final parsedData = fromData(response.data);
      return ApiResponse.success(data: parsedData);
    } on DioException catch (e) {
      log("Dio Error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    } catch (e, stackTrace) {
      log("Unknown Error: $e", stackTrace: stackTrace);
      return ApiResponse.failure(
        error: NetworkExceptions.defaultError(
          "An unexpected error occurred: $e",
        ),
      );
    }
  }

  void _validateResponseData(dynamic responseData, {String path = ''}) {
    if (responseData is Map) {
      // Check for "success": false
      if (responseData.containsKey('success') &&
          responseData['success'] == false) {
        String message =
            responseData['message'] as String? ?? 'Operation failed';

        // Handle "errors" array if present (e.g. validation errors)
        if (responseData.containsKey('errors') &&
            responseData['errors'] is List) {
          final errors = responseData['errors'] as List;
          if (errors.isNotEmpty) {
            final errorMessages = errors
                .map((e) {
                  if (e is Map && e.containsKey('message')) {
                    return e['message'];
                  }
                  return e.toString();
                })
                .join('\n');
            if (errorMessages.isNotEmpty) {
              message = "$message\n$errorMessages";
            }
          }
        }

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
  }
}
