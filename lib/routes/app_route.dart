import 'package:athlink/features/athlete/home_screen/search/presentation/screens/search_athlete_screen.dart';
import 'package:athlink/features/athlete/home_screen/presentation/screens/connection_requests_screen.dart';
import 'package:athlink/features/athlete/profile/domain/models/result_data.dart';
import 'package:athlink/features/athlete/profile/presentation/screens/athlete_profile_screen.dart';
import 'package:athlink/features/athlete/profile/presentation/screens/athlete_result_detail_screen.dart';
import 'package:athlink/features/athlete/profile/presentation/screens/athlete_results_screen.dart';
import 'package:athlink/features/athlete/profile/presentation/screens/career_journey_screen.dart';
import 'package:athlink/features/auth/presentation/screens/account_type_selection_screen.dart';
import 'package:athlink/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:athlink/features/auth/presentation/screens/login_screen.dart';
import 'package:athlink/features/auth/presentation/screens/otp_screen.dart';
import 'package:athlink/features/auth/presentation/screens/register_screen.dart';
import 'package:athlink/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:athlink/features/athlete/home_screen/presentation/screens/athlete_home_screen.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/screens/home_feed_screen.dart';
import 'package:athlink/features/message/presentation/screens/message_detail_screen.dart';
import 'package:athlink/features/message/presentation/screens/message_screen.dart';
import 'package:athlink/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:athlink/features/sports/presentaion/screens/select_sport_screen.dart';
import 'package:athlink/features/sponsor/watchlist/presentation/screens/watch_list_screen.dart';
import 'package:athlink/routes/athlete_main_screen.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/widgets/coming_soon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'error_screen.dart';
import 'main_screen.dart';
import '../features/sponsor/manage/presentation/screens/manage_screen.dart';
import '../features/onboarding/presentation/screens/on_boarding_screen.dart';
import '../features/sponsor/profile/presenation/screens/profile_screen.dart';
import '../features/splash/presentation/screens/logo_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../core/handlers/app_router_observer.dart';

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
        path: Routes.viewAthleteScreen,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return AthleteProfileScreen(
            athleteId: extra?['athleteId'] as String?,
            isSelf: extra?['isSelf'] as bool? ?? true,
          );
        },
      ),
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
        path: Routes.accountTypeSelectionRouteName,
        builder: (context, state) {
          final isGoogleSignup = state.extra as bool?;
          return ChooseAccountTypeScreen(
            isGoogleSignup: isGoogleSignup ?? false,
          );
        },
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
            conversationId: extra["conversationId"] as String,
            name: extra["name"],
            logo:
                extra["logo"] ??
                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Quartz_logo.svg/512px-Quartz_logo.svg.png",
            isOnline: extra["isOnline"],
            userId: extra["userId"],
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
        path: Routes.connectionRequestsScreen,
        builder: (context, state) => const ConnectionRequestsScreen(),
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

      GoRoute(
        path: Routes.athleteResultDetialRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          return AthleteResultDetailScreen(
            result: extra['result'] as ResultData,
            isSelf: extra['isSelf'] as bool? ?? true,
            athleteId:
                extra['athleteId'] as String?, // Pass the ID to the screen
          );
        },
      ),
      GoRoute(
        path: Routes.careerJourneyRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return CareerJourneyScreen(
            athleteId: extra?['athleteId'] as String?,
            isSelf: extra?['isSelf'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: Routes.athleteResultsRouteName,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return AthleteResultsScreen(
            athleteId: extra?['athleteId'] as String?,
            isSelf: extra?['isSelf'] as bool? ?? true,
          );
        },
      ),

      GoRoute(
        path: Routes.athleteSearchScreen,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return AthleteSearchScreen(
            initialAthletes: data['athletes'] as List<Athlete>,
            initialSponsors: data['sponsors'] as List<Sponsor>,
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
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AthleteMainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.athleteDashBoardRouteName,
                builder: (context, state) => const AthleteDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/athlete-manage",
                builder: (context, state) => ComingSoonScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.athleteMessageRouteName,
                builder: (context, state) => MessageScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/athlete-campaign",
                builder: (context, state) => ComingSoonScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.athleteProfileRouteName,
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  return AthleteProfileScreen(
                    athleteId: extra?['athleteId'] as String?,
                    isSelf: extra?['isSelf'] as bool? ?? true,
                  );
                },
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
