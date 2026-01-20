
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'routes/custom_page_transition.dart';
import 'shared/theme/app_theme.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key, required this.goRouter});

  final GoRouter goRouter;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterNativeSplash.remove();
    // final themeMode = ref.watch(appThemeProvider);
    return MaterialApp.router(
      title: 'Flutter TDD',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {TargetPlatform.android: CustomTransitionBuilder()},
        ),
      ),
      darkTheme: AppTheme.darkTheme.copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CustomTransitionBuilder()},
        ),
      ),
      routerConfig: widget.goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
