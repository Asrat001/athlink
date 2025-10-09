
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'routes/app_route.dart';
import 'routes/custom_page_transition.dart';
import 'shared/theme/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key,required this.goRouter});

  final GoRouter goRouter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FlutterNativeSplash.remove();
    // final themeMode = ref.watch(appThemeProvider);

    return MaterialApp.router(
      title: 'Flutter TDD',
      theme: AppTheme.lightTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android:CustomTransitionBuilder()
          }
        )
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android:CustomTransitionBuilder()
          }
        )
      ),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
