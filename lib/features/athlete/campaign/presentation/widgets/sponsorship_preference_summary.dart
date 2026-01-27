import 'dart:ui';

import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SponsorshipPreferencesSummary extends StatelessWidget {
  final List<SponsorshipPreference> preferences;
  final VoidCallback onEdit; // Function to re-open modal

  const SponsorshipPreferencesSummary({
    required this.preferences,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(preferences.length, (index) {
          final pref = preferences[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                Icon(pref.icon, color: Colors.orange, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomText(
                    title: pref.title,
                    fontSize: 15,
                    textColor: AppColors.white,
                  ),
                ),
                // Functional Edit Button
                IconButton(
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                    size: 18,
                  ),
                  onPressed: onEdit,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 10),
      ],
    );
  }
}
