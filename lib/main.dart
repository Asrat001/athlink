import 'package:athlink/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di.dart';
import 'app.dart';
import 'observers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();

  final router = sl<AppRouter>().router;
  runApp(
    ProviderScope(
      observers: [Observers()],
      child: MyApp(goRouter: router),
    ),
  );
}
