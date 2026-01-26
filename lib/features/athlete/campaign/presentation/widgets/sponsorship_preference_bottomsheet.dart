import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';

class SponsorshipPreferencesBottomSheet extends StatefulWidget {
  final List<SponsorshipPreference> initialPreferences;
  const SponsorshipPreferencesBottomSheet({
    super.key,
    required this.initialPreferences,
  });

  @override
  State<SponsorshipPreferencesBottomSheet> createState() =>
      _SponsorshipPreferencesBottomSheetState();
}

class _SponsorshipPreferencesBottomSheetState
    extends State<SponsorshipPreferencesBottomSheet> {
  final List<SponsorshipPreference> _options = [
    SponsorshipPreference(title: "Logo placement", icon: Icons.image_outlined),
    SponsorshipPreference(
      title: "Content Creation",
      icon: Icons.videocam_outlined,
    ),
    SponsorshipPreference(title: "Product", icon: Icons.inventory_2_outlined),
    SponsorshipPreference(title: "Speech", icon: Icons.mic_none_outlined),
  ];

  late List<SponsorshipPreference> _selected;

  @override
  void initState() {
    super.initState();
    _selected = List.from(widget.initialPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            title: "Sponsorship Preferences",
            fontSize: 22,
            fontWeight: FontWeight.bold,
            textColor: AppColors.white,
          ),
          const SizedBox(height: 24),
          ..._options.map((opt) {
            final isChecked = _selected.any((s) => s.title == opt.title);
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white10)),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.orange,
                    side: const BorderSide(color: AppColors.grey),
                    onChanged: (val) {
                      setState(() {
                        val!
                            ? _selected.add(opt)
                            : _selected.removeWhere(
                                (s) => s.title == opt.title,
                              );
                      });
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(opt.icon, color: Colors.orange, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomText(
                      title: opt.title,
                      fontSize: 16,
                      textColor: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 32),
          RoundedButton(
            label: "Save Preferences",
            backgroundColor: AppColors.darkGreyCard,
            onPressed: () => Navigator.pop(context, _selected),
          ),
        ],
      ),
    );
  }
}
