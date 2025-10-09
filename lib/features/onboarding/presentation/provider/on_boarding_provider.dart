
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'on_boarding_notifier.dart';
import 'on_boarding_state.dart';

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});