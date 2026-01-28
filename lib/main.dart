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
  await dotenv.load(fileName: ".env");
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
