import 'package:athlink/core/services/notification_service.dart';
import 'package:athlink/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'di.dart';
import 'app.dart';
import 'observers.dart';

import 'package:firebase_core/firebase_core.dart'; // Added import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Add try-catch for .env loading to prevent hangs in release builds
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    // Log warning but continue - app should handle missing env vars gracefully
    debugPrint("Warning: .env file not found or failed to load: $e");
  }

  await Firebase.initializeApp(); // Added initialization
  await NotificationService.instance.initialize();
  await serviceLocator();
  final router = sl<AppRouter>().router;
  runApp(
    ProviderScope(
      observers: [Observers()],
      child: MyApp(goRouter: router),
    ),
  );
}
