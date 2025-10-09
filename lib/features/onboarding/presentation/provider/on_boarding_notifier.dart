
import 'dart:math';

import 'package:athlink/shared/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../di.dart';
import '../../data/model/onboarding_model.dart';
import 'on_boarding_state.dart';

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier()
      : super(OnboardingState(
    currentPage: 0,
    pageController: PageController(),
    pages: [
      OnboardingData(
        title: "Welcome to ET-Podcast & Radio",
        description: "Discover amazing features and start your journey with us. Experience the best mobile application designed just for you.",
        image: "assets/images/on1.jpg",
      ),
      OnboardingData(
        title: "Ethiopian Story Times For Your Kids",
        description: "Our intuitive interface makes it simple to navigate and find what you need. Everything is designed with user experience in mind.",
        image: "assets/images/on2.jpg",
      ),
      OnboardingData(
        title: "Stay Tuned To Your Favorite Radio Shows",
        description: "Join thousands of users who are already enjoying our platform. Start your amazing journey today and unlock endless possibilities.",
        image: "assets/images/on3.jpg",
      ),
    ],
  ));

  void updateCurrentPage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void nextPage() {
    if (state.currentPage < state.pages.length - 1) {
      state.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> finishOnboarding() async {
    await sl<LocalStorageService>().setIsDoneOnboarding(true);
  }

  bool get isLastPage => state.currentPage == state.pages.length - 1;

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }

}