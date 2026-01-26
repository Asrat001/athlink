import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';

class PreferredSponsorsBottomSheet extends StatefulWidget {
  final List<Sponsor> alreadySelected;
  const PreferredSponsorsBottomSheet({
    super.key,
    required this.alreadySelected,
  });

  @override
  State<PreferredSponsorsBottomSheet> createState() =>
      _PreferredSponsorsBottomSheetState();
}

class _PreferredSponsorsBottomSheetState
    extends State<PreferredSponsorsBottomSheet> {
  final _searchController = TextEditingController();

  // Mock data for available sponsors
  final List<Sponsor> _availableSponsors = [
    Sponsor(
      name: "Gatorade",
      category: "Beverages",
      logoUrl: "assets/gatorade.png",
    ),
    Sponsor(
      name: "Red Bull",
      category: "Beverages",
      logoUrl: "assets/redbull.png",
    ),
    Sponsor(name: "Nike", category: "Apparel", logoUrl: "assets/nike.png"),
    Sponsor(
      name: "Adidas",
      category: "Nutrition",
      logoUrl: "assets/adidas.png",
    ),
    Sponsor(
      name: "Under Armour",
      category: "Apparel",
      logoUrl: "assets/ua.png",
    ),
  ];

  late List<Sponsor> _tempSelected;

  @override
  void initState() {
    super.initState();
    _tempSelected = List.from(widget.alreadySelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Preferred Sponsors",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 8),
          const CustomText(
            title: "Select brands you're interested in.",
            fontSize: 14,
            textColor: AppColors.grey,
          ),
          const SizedBox(height: 24),

          CustomTextField(
            label: "Search with a name",
            controller: _searchController,
            icon: const Icon(Icons.search, color: AppColors.grey),
            borderRadius: 12,
            textColor: AppColors.white,
          ),

          const SizedBox(height: 24),

          Expanded(
            child: GridView.builder(
              itemCount: _availableSponsors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, index) {
                final sponsor = _availableSponsors[index];
                final isSelected = _tempSelected.any(
                  (s) => s.name == sponsor.name,
                );

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected
                          ? _tempSelected.removeWhere(
                              (s) => s.name == sponsor.name,
                            )
                          : _tempSelected.add(sponsor);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkGreyCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? Colors.orange : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Placeholder for Logo
                        const Icon(
                          Icons.business,
                          color: Colors.white,
                          size: 30,
                        ),
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
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),
          RoundedButton(
            label: "Add Sponsors",
            backgroundColor: AppColors.darkGreyCard,
            onPressed: () => Navigator.pop(context, _tempSelected),
          ),
        ],
      ),
    );
  }
}
