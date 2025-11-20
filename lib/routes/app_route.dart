import 'package:athlink/features/auth/presentaion/screens/forgot_password_screen.dart';
import 'package:athlink/features/auth/presentaion/screens/login_screen.dart';
import 'package:athlink/features/auth/presentaion/screens/otp_screen.dart';
import 'package:athlink/features/auth/presentaion/screens/register_screen.dart';
import 'package:athlink/features/auth/presentaion/screens/reset_password_screen.dart';
import 'package:athlink/features/home_feed/presentation/screens/home_feed_screen.dart';
import 'package:athlink/features/message/presentation/screens/message_detail_screen.dart';
import 'package:athlink/features/message/presentation/screens/message_screen.dart';
import 'package:athlink/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:athlink/features/sports/presentaion/screens/select_sport_screen.dart';
import 'package:athlink/features/watchlist/presentation/screens/watch_list_screen.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/main/error_screen.dart';
import '../features/main/main_screen.dart';
import '../features/manage/presentation/screens/manage/manage_screen.dart';
import '../features/onboarding/presentation/screens/on_boarding_screen.dart';
import '../features/profile/presenation/screens/profile_screen.dart';
import '../features/splash/presentation/screens/logo_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../shared/handlers/app_router_observer.dart';

class AppRouter {
  final bool isFirstTimeUser;
  AppRouter(this.isFirstTimeUser);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: [AppRouterObserver()],
    navigatorKey: navigatorKey,
    initialLocation: Routes.splashRouteName,
    routes: [
      GoRoute(
        path: Routes.splashRouteName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.onBoardingRouteName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(path: "/logo", builder: (context, state) => const LogoScreen()),
      GoRoute(
        path: Routes.registerRouteName,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: Routes.forgotPasswordRouteName,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.verifyOtpRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>?;
          return VerifyOTPScreen(
            email: extra?['email'] ?? '',
            purpose: extra?['purpose'] ?? 'verification',
          );
        },
      ),

      GoRoute(
        path: Routes.resetPasswordRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>?;
          return ResetPasswordScreen(
            email: extra?['email'] ?? '',
            token: extra?['token'] ?? '',
            otp: extra?['otp'] ?? '',
          );
        },
      ),

      GoRoute(
        path: Routes.chatDetailRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return MessageDetailScreen(
            name: extra["name"],
            logo: extra["logo"],
            isOnline: extra["isOnline"],
          );
        },
      ),

      GoRoute(
        path: Routes.selectSportScreen,
        builder: (context, state) => SelectSportScreen(),
      ),
      GoRoute(
        path: Routes.notificationScreen,
        builder: (context, state) => NotificationsScreen(),
      ),
      GoRoute(
        path: Routes.loginRouteName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.loginRouteName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.forgotPasswordRouteName,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.verifyOtpRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>?;
          return VerifyOTPScreen(
            email: extra?['email'] ?? '',
            purpose: extra?['purpose'] ?? 'verification',
          );
        },
      ),

      GoRoute(
        path: Routes.resetPasswordRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, String>?;
          return ResetPasswordScreen(
            email: extra?['email'] ?? '',
            token: extra?['token'] ?? '',
            otp: extra?['otp'] ?? '',
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.dashBoardRouteName,
                builder: (context, state) => const HomeFeedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.feedRouteName,
                builder: (context, state) => const ManageScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.messageRouteName,
                builder: (context, state) => MessageScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.watchListRouteName,
                builder: (context, state) => WatchListScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profileRouteName,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        ErrorScreen(errorMessage: state.error.toString()),
    redirect: (context, state) {
      return null;
    },
  );
}
