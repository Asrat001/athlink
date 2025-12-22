import 'dart:developer';
import 'package:athlink/routes/app_route.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:dio/dio.dart';
import 'package:athlink/di.dart';
import 'package:go_router/go_router.dart';
import '../services/local_storage_service.dart';
import '../services/token_refreshe_service.dart';

class TokenInterceptor extends Interceptor {
  final bool requireAuth;
  final Dio dio;

  // Static counter shared across all instances to prevent concurrent refresh attempts
  static int _refreshAttempts = 0;
  static const int _maxRefreshAttempts = 1;
  static DateTime? _lastRefreshAttempt;
  static const Duration _refreshCooldown = Duration(seconds: 5);

  TokenInterceptor({required this.requireAuth, required this.dio});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? accessToken = await sl<LocalStorageService>()
        .getAccessToken();
    if (requireAuth && accessToken != null) {
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Check if error is due to an expired token (401 Unauthorized)
    if (err.response?.statusCode == 401 && requireAuth) {
      // ✅ OPTION A: Don't try to refresh if the failing request IS the refresh endpoint
      if (err.requestOptions.path.contains('/auth/refresh-token')) {
        log('🔴 Refresh token endpoint itself failed (401), logging out');
        _resetRefreshState();
        _handleLogout();
        return handler.next(err);
      }

      // ✅ OPTION C: Check retry limit to prevent infinite loops
      if (_refreshAttempts >= _maxRefreshAttempts) {
        log(
          '🔴 Max refresh attempts ($_maxRefreshAttempts) reached, logging out',
        );
        _resetRefreshState();
        _handleLogout();
        return handler.next(err);
      }

      // ✅ BONUS: Cooldown to prevent rapid retries
      if (_lastRefreshAttempt != null) {
        final timeSinceLastAttempt = DateTime.now().difference(
          _lastRefreshAttempt!,
        );
        if (timeSinceLastAttempt < _refreshCooldown) {
          log(
            '⏳ Refresh cooldown active, waiting ${(_refreshCooldown - timeSinceLastAttempt).inSeconds}s...',
          );
          await Future.delayed(_refreshCooldown - timeSinceLastAttempt);
        }
      }

      log(
        '🔄 Token expired, attempting refresh (attempt ${_refreshAttempts + 1}/$_maxRefreshAttempts)',
      );
      _refreshAttempts++;
      _lastRefreshAttempt = DateTime.now();

      // Store the original request to retry it later
      final options = err.requestOptions;

      try {
        // Attempt to refresh the token
        final newToken = await sl<TokenRefreshService>().refreshToken();

        if (newToken != null) {
          log('✅ Token refreshed successfully, retrying original request');
          _resetRefreshState(); // Reset counter on success

          // Update the authorization header with the new token
          options.headers['Authorization'] = 'Bearer $newToken';

          // Retry the original request with the updated token
          final response = await dio.fetch(options);

          // Return the successful response from the retried request
          handler.resolve(response);
          return;
        } else {
          log('🔴 Failed to refresh token, logging out');
          _resetRefreshState();
          _handleLogout();
        }
      } catch (e) {
        log('🔴 Error during token refresh: $e');
        _resetRefreshState();
        _handleLogout();
      }
    }

    // For other errors, just pass them through
    return handler.next(err);
  }

  /// Reset the refresh state counters
  static void _resetRefreshState() {
    _refreshAttempts = 0;
    _lastRefreshAttempt = null;
  }

  void _handleLogout() {
    // Clear tokens
    sl<LocalStorageService>().clearAuthData();
    final context = sl<AppRouter>().navigatorKey.currentContext;
    if (context != null) {
      // Navigate to login
      context.go(Routes.loginRouteName);
    }
  }
}
