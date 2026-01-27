import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';

class SponsorshipPreferencesBottomSheet extends StatefulWidget {
  final List<SponsorshipPreference> initialPreferences;
  final Future<void> Function(List<SponsorshipPreference>)? onSave;

  const SponsorshipPreferencesBottomSheet({
    super.key,
    required this.initialPreferences,
    this.onSave,
  });

  @override
  State<SponsorshipPreferencesBottomSheet> createState() =>
      _SponsorshipPreferencesBottomSheetState();
}

class _SponsorshipPreferencesBottomSheetState
    extends State<SponsorshipPreferencesBottomSheet> {
  final List<SponsorshipPreference> _options = [
    SponsorshipPreference(title: "Social Media", icon: Icons.share),
    SponsorshipPreference(title: "Event Appearance", icon: Icons.event),
    SponsorshipPreference(title: "Content Creation", icon: Icons.create),
    SponsorshipPreference(title: "Product Endorsement", icon: Icons.verified),
    SponsorshipPreference(title: "Speech", icon: Icons.record_voice_over),
    SponsorshipPreference(title: "Workshop", icon: Icons.work),
    SponsorshipPreference(title: "Other", icon: Icons.more_horiz),
  ];

  late List<SponsorshipPreference> _selected;
  bool _isLoading = false;
  String? _errorMessage;

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
      child: IgnorePointer(
        ignoring: _isLoading,
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
                  border: Border(bottom: BorderSide(color: Colors.white12)),
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
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Center(
                  child: CustomText(
                    title: _errorMessage!,
                    fontSize: 13,
                    textColor: AppColors.error,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            RoundedButton(
              label: _isLoading ? "" : "Save Preferences",
              icon: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : null,
              backgroundColor: AppColors.darkGreyCard,
              onPressed: () async {
                if (widget.onSave != null) {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = null;
                  });
                  try {
                    await widget.onSave!(_selected);
                  } catch (e) {
                    if (mounted) {
                      setState(() => _errorMessage = e.toString());
                    }
                  } finally {
                    if (mounted) setState(() => _isLoading = false);
                  }
                } else {
                  Navigator.pop(context, _selected);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
