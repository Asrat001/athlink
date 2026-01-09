import 'package:athlink/features/athlete/profile/presentation/screens/athlete_results_screen.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/action_button.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/info_tile.dart';
import 'package:flutter/material.dart';

class ResultFullDetailsTab extends StatelessWidget {
  final ResultData result;
  const ResultFullDetailsTab({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(
            "POSITION",
            result.position,
            "DATE",
            result.date,
            isDateOrange: true,
          ),
          const SizedBox(height: 40),
          _buildLocationRow(result),
          const SizedBox(height: 60),
          const CustomText(
            title: "Official Results",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textColor: AppColors.orangeGradientStart,
          ),
          const SizedBox(height: 10),
          CustomText(
            title: "Link to the official competition results page.",
            fontSize: 13,
            textColor: AppColors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 30),
          Center(
            child: ActionButton(
              label: "Add results link",
              icon: Icons.add,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String lab1,
    String val1,
    String lab2,
    String val2, {
    bool isDateOrange = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Using Expanded to prevent overlap on small screens
        Expanded(
          child: InfoTile(label: lab1, value: val1),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InfoTile(label: lab2, value: val2, isOrange: isDateOrange),
        ),
      ],
    );
  }

  Widget _buildLocationRow(ResultData result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: "LOCATION",
                fontSize: 12,
                textColor: AppColors.white.withValues(
                  alpha: 0.38,
                ), // Standardized muted text
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Image.network(
                      result.flagUrl,
                      width: 24,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.flag,
                        size: 16,
                        color: AppColors.white.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: CustomText(
                      title: "Turkey",
                      fontSize: 14,
                      textColor: AppColors.orangeGradientStart,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InfoTile(
            label: "DIVISION",
            value: result.division,
            isOrange: true,
          ),
        ),
      ],
    );
  }
}
