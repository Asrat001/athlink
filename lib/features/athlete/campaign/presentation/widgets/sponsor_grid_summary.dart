import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SponsorGridSummary extends StatelessWidget {
  final List<Sponsor> selectedSponsors;
  final VoidCallback onAddMore;

  const SponsorGridSummary({
    required this.selectedSponsors,
    required this.onAddMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: selectedSponsors.length + 1, // +1 for the "Add" button
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            if (index == selectedSponsors.length) {
              // The "Add Sponsor" dashed/pill button at the end
              return GestureDetector(
                onTap: onAddMore,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white24,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline, color: Colors.white54),
                      SizedBox(height: 4),
                      CustomText(
                        title: "Add Sponsor",
                        fontSize: 10,
                        textColor: Colors.white54,
                      ),
                    ],
                  ),
                ),
              );
            }

            final sponsor = selectedSponsors[index];
            return Container(
              decoration: BoxDecoration(
                color: AppColors.darkGreyCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (sponsor.profileImageUrl != null &&
                      sponsor.profileImageUrl!.isNotEmpty)
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(sponsor.profileImageUrl!),
                      backgroundColor: Colors.transparent,
                    )
                  else
                    const Icon(Icons.flash_on, color: Colors.orange, size: 28),
                  const SizedBox(height: 8),
                  CustomText(
                    title: sponsor.name,
                    fontSize: 12,
                    textColor: AppColors.white,
                  ),
                  CustomText(
                    title: sponsor.category,
                    fontSize: 10,
                    textColor: AppColors.grey,
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
