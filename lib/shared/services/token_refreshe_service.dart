import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../di.dart';
import '../constant/constants.dart';
import 'local_storage_service.dart';

class TokenRefreshService {
  LocalStorageService localStorageService = sl<LocalStorageService>();
  // Flag to prevent multiple refresh attempts at the same time
  bool _isRefreshing = false;

  // Completer to track ongoing refresh operation
  Completer<String?>? _refreshCompleter;

  Future<String?> refreshToken() async {
    // If already refreshing, return the same future
    if (_isRefreshing && _refreshCompleter != null) {
      log(
        'Token refresh already in progress, waiting for existing operation...',
      );
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<String?>();
    _isRefreshing = true;

    try {
      final refreshToken = await localStorageService.getRefreshToken();

      if (refreshToken == null) {
        log('No refresh token found in storage');
        _refreshCompleter!.complete(null);
        _isRefreshing = false;
        return null;
      }

      log('Attempting to refresh token...');

      final dio = Dio(
        BaseOptions(baseUrl: cBaseUrl, headers: {'accept': 'application/json'}),
      );

      final response = await dio.post(
        '/auth/refresh_token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        log('Token refresh response: ${response.data}');

        // Handle both array and object response formats
        dynamic tokenData;
        if (response.data is List) {
          // If response is an array, get the first element
          final responseData = response.data as List;
          if (responseData.isEmpty) {
            throw Exception('Empty response array from refresh token endpoint');
          }
          tokenData = responseData[0];
        } else if (response.data is Map) {
          // If response is an object, use it directly
          tokenData = response.data;
        } else {
          throw Exception(
            'Unexpected response format from refresh token endpoint',
          );
        }

        // Extract the new access token
        final newAccessToken = tokenData['accessToken'] as String?;

        if (newAccessToken == null) {
          throw Exception('Access token not found in refresh response');
        }

        // Optionally update refresh token if provided
        final newRefreshToken = tokenData['refreshToken'] as String?;

        // First delete old tokens before saving new ones
        await localStorageService.deleteAccessToken();

        // Then save new tokens
        await localStorageService.setAccessToken(newAccessToken);

        // Update refresh token if a new one is provided
        if (newRefreshToken != null) {
          await localStorageService.deleteRefreshToken();
          await localStorageService.setRefreshToken(newRefreshToken);
        }

        log('Token refreshed successfully. New access token saved.');

        _refreshCompleter!.complete(newAccessToken);
        _isRefreshing = false;
        return newAccessToken;
      }

      // If refresh fails or response format is unexpected, clear tokens
      log('Token refresh failed with status code: ${response.statusCode}');
      await localStorageService.clearAuthData();
      _refreshCompleter!.complete(null);
      _isRefreshing = false;
      return null;
    } catch (e, stackTrace) {
      log('Error refreshing token: $e');
      log('Stack trace: $stackTrace');

      // Only clear auth data if it's not a network error
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionError) {
          log('Network error during token refresh, keeping tokens for retry');
          _refreshCompleter!.complete(null);
          _isRefreshing = false;
          return null;
        }
      }

      // For other errors (invalid token, unauthorized, etc.), clear auth data
      await localStorageService.clearAuthData();
      _refreshCompleter!.complete(null);
      _isRefreshing = false;
      return null;
    }
  }
}
