import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateJobModalLayout extends StatelessWidget {
  final int currentPage;
  final PageController pageController;
  final VoidCallback onPreviousPage;
  final VoidCallback onClose;
  final bool isLoading;
  final Widget stepOne;
  final Widget stepTwo;
  final String? errorMessage;

  const CreateJobModalLayout({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.onPreviousPage,
    required this.onClose,
    required this.isLoading,
    required this.stepOne,
    required this.stepTwo,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage == 1)
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/step-back.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: isLoading ? null : onPreviousPage,
                  )
                else
                  const SizedBox(width: 40),
                const CustomText(
                  title: "Create Job Post",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: AppColors.black,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 24,
                    color: AppColors.grey,
                  ),
                  onPressed: isLoading ? null : onClose,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepCircle(1, isActive: true),
                const SizedBox(width: 8),
                Container(width: 40, height: 2, color: AppColors.divider),
                const SizedBox(width: 8),
                _buildStepCircle(2, isActive: currentPage == 1),
              ],
            ),
            if (errorMessage != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.error.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: AppColors.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomText(
                        title: errorMessage!,
                        textColor: AppColors.error,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [stepOne, stepTwo],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step, {required bool isActive}) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.extraLightGrey,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$step',
        style: TextStyle(
          color: isActive ? AppColors.white : AppColors.textSecondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
