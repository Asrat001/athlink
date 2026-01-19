import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class AthleteCampaignDetailScreen extends StatefulWidget {
  final String campaignTitle;
  const AthleteCampaignDetailScreen({super.key, required this.campaignTitle});

  @override
  State<AthleteCampaignDetailScreen> createState() =>
      _AthleteCampaignDetailScreenState();
}

class _AthleteCampaignDetailScreenState
    extends State<AthleteCampaignDetailScreen> {
  // Map to track expanded states for each section
  final Map<String, bool> _expandedSections = {
    "Financial Goal": false,
    "Cost Breakdown": false,
    "Goal": false,
    "Preferred Sponsors": false,
    "Sponsorship Preferences": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
        title: CustomText(
          title: "${widget.campaignTitle} Campaign",
          fontSize: 18,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          _buildExpansionSection(
            title: "Financial Goal",
            description:
                "Set your financial goal and campaign duration. You’ll break down the costs in the next step.",
            buttonLabel: "Set Financial Goal",
          ),
          _buildExpansionSection(
            title: "Cost Breakdown",
            description:
                "Break down your campaign expenses so sponsors can clearly understand where the funds will be used.",
            buttonLabel: "Add Cost breakdown",
          ),
          _buildExpansionSection(
            title: "Goal",
            description:
                "Set a measurable career goal with a timeline to help sponsors understand your direction.",
            buttonLabel: "Add Sponsors", // Based on image 1
          ),
          _buildExpansionSection(
            title: "Preferred Sponsors",
            description:
                "Select brands or sponsors you’re interested in working with. You will automatically receive updates on their journey.",
            buttonLabel: "Add Sponsors",
          ),
          _buildExpansionSection(
            title: "Sponsorship Preferences",
            description:
                "Define your preferred sponsorship opportunities to match with the right partners.",
            buttonLabel: "Add Sponsors",
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionSection({
    required String title,
    required String description,
    required String buttonLabel,
  }) {
    bool isExpanded = _expandedSections[title] ?? false;

    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => _expandedSections[title] = !isExpanded),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: title,
                  fontSize: 16,
                  textColor: AppColors.lightGrey,
                  fontWeight: FontWeight.w400,
                ),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded) ...[
          CustomText(
            title: description,
            fontSize: 14,
            textColor: AppColors.grey,
            fontWeight: FontWeight.w400,
            softWrap: true,
          ),
          const SizedBox(height: 30),
          RoundedButton(
            label: buttonLabel,
            onPressed: () {},
            icon: const Icon(Icons.add, color: AppColors.white, size: 18),
            backgroundColor: AppColors.darkGreyCard.withValues(alpha: 0.5),
            height: 48,
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}
