
import 'package:athlink/features/splash/presentation/providers/splash_notifier.dart';
import 'package:athlink/features/splash/presentation/providers/state/splash_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
      (ref)  {
        return SplashNotifier();
      }
);