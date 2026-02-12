import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileStatsWidget extends StatelessWidget {
  final int? sponsorshipCampaigns;
  final int? athletesSponsored;
  final int? globalPartners;
  final bool isDarkMode;

  const ProfileStatsWidget({
    super.key,
    this.sponsorshipCampaigns,
    this.athletesSponsored,
    this.globalPartners,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: StatItem(
              value: "${sponsorshipCampaigns ?? 0}",
              label: "Sponsorship Campaigns",
              isDarkMode: isDarkMode,
            ),
          ),
          VerticalDivider(
            color: isDarkMode ? Colors.white24 : AppColors.divider,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: StatItem(
              value: "${athletesSponsored ?? 0}",
              label: "Athletes Represented",
              isDarkMode: isDarkMode,
            ),
          ),
          VerticalDivider(
            color: isDarkMode ? Colors.white24 : AppColors.divider,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(
            child: StatItem(
              value: "${globalPartners ?? 0}",
              label: "Global Partners",
              isDarkMode: isDarkMode,
            ),
          ),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String value;
  final String label;
  final bool isDarkMode;

  const StatItem({
    super.key,
    required this.value,
    required this.label,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            title: value,
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            textColor: isDarkMode ? Colors.white : AppColors.black,
          ),
          const SizedBox(height: 4),
          CustomText(
            title: label,
            textAlign: TextAlign.center,
            fontSize: 13,
            textColor: isDarkMode ? Colors.white54 : AppColors.grey,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
