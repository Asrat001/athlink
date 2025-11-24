import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';


class NoJobsCard extends StatelessWidget {
  const NoJobsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double appBarHeight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    const double tabBarHeight = 48;
    final double viewportHeight =
        MediaQuery.of(context).size.height - appBarHeight - tabBarHeight;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: viewportHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: viewportHeight * 0.15),
              const Center(
                child: CustomText(
                  title: 'No job posted yet',
                  textColor: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RoundedButton(
                  label: 'Create a job post',
                  onPressed: () => _openCreateJobModal(context),
                  height: 50,
                  borderRadius: 8,
                  backgroundColor: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}