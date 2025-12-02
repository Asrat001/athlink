import 'package:athlink/features/onboarding/presentation/screens/widgets/page_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/route_names.dart';
import '../../../../core/services/responsive_provider.dart';
import '../../data/model/onboarding_model.dart';
import '../provider/on_boarding_provider.dart';


class OnboardingScreen extends ConsumerWidget{

  const OnboardingScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingNotifier = ref.read(onboardingProvider.notifier);
    final responsive = ref.watch(responsiveProvider(context));
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // PageView with background images
          PageView.builder(
            controller:onboardingState.pageController ,
            onPageChanged: (index) {
            onboardingNotifier.updateCurrentPage(index);
            },
            itemCount: onboardingState.pages.length,
            itemBuilder: (context, index) {
              return _buildOnboardingPage(
                onboardingState.pages[index],
                screenHeight,
                screenWidth,
                isTablet,
              );
            },
          ),

          // Skip button (top right)
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 20,
            child: TextButton(
              onPressed: ()  async {
                onboardingNotifier.finishOnboarding();
                if(context.mounted){
                  context.go(Routes.registerRouteName);
                }
              },
              child: Text(
                'Skip',
                style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.w700,
                )
              ),
            ),
          ),

          // Bottom content (indicators and button)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 40 : 24,
                vertical: isTablet ? 40 : 32,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Page indicators
                    PageIndicators(
                      currentPage: onboardingState.currentPage,
                      totalPages: onboardingState.pages.length,
                      responsive: responsive,
                    ),
                    SizedBox(height: isTablet ? 32 : 24),

                    // Next/Get Started button
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 60 : 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (onboardingNotifier.isLastPage) {
                            onboardingNotifier.finishOnboarding().then((_){
                              if(context.mounted){
                                context.go(Routes.registerRouteName);
                              }
                            });

                          } else {
                           onboardingNotifier.nextPage();
                          }
                        },
                        child: Text(
                          onboardingNotifier.isLastPage
                              ? 'Get Started'
                              : 'Next',
                          style: TextStyle(
                            fontSize: isTablet ? 18 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnboardingPage(
      OnboardingData data,
      double screenHeight,
      double screenWidth,
      bool isTablet,
      ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          data.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[400],
              child: Icon(
                Icons.error,
                color: Colors.white,
                size: 50,
              ),
            );
          },
        ),

        // Black overlay
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.999),
              ],
            ),
          ),
        ),

        // Content
        Positioned(
          left: isTablet ? 40 : 24,
          right: isTablet ? 40 : 24,
          top: screenHeight * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                data.title,
                style:GoogleFonts.bebasNeue(
                  color: Colors.white,
                  fontSize: isTablet ? 32 : 24,
                  fontWeight: FontWeight.w700,
                )
              ),

              SizedBox(height: isTablet ? 20 : 16),

              // Description
              Text(
                data.description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: isTablet ? 18 : 16,
                  height: 1.5,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

