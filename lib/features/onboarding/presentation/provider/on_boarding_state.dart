import 'package:flutter/cupertino.dart';

import '../../data/model/onboarding_model.dart';

class OnboardingState {
  final int currentPage;
  final List<OnboardingData> pages;
  final PageController pageController;

  OnboardingState({
    required this.currentPage,
    required this.pages,
    required this.pageController,
  });

  OnboardingState copyWith({
    int? currentPage,
    List<OnboardingData>? pages,
    PageController? pageController,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      pages: pages ?? this.pages,
      pageController: pageController ?? this.pageController,
    );
  }
}