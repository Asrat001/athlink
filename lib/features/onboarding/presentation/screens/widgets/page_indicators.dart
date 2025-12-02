import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/services/responsive_provider.dart';

class PageIndicators extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ResponsiveValues responsive;

  const PageIndicators({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
            (index) => PageIndicator(
          isActive: currentPage == index,
          responsive: responsive,
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  final bool isActive;
  final ResponsiveValues responsive;

  const PageIndicator({
    super.key,
    required this.isActive,
    required this.responsive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: responsive.indicatorSize,
      width: isActive ? responsive.activeIndicatorWidth : responsive.indicatorSize,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
