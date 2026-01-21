import 'package:athlink/features/athlete/campaign/presentation/widgets/cost_break_down_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/financial_goal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Reusable component imports
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';

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

  /// Handles the action button clicks within each section
  void _onSectionAction(String sectionTitle) {
    if (sectionTitle == "Financial Goal") {
      _showFinancialGoalBottomSheet();
    } else if (sectionTitle == "Cost Breakdown") {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) =>
            const CostBreakdownBottomSheet(totalBudget: 1000000),
      );
    }
  }

  /// Displays the Financial Goal Modal Bottom Sheet
  void _showFinancialGoalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, // Required to see the container's border radius
      builder: (context) => const FinancialGoalBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
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
          CampaignSectionTile(
            title: "Financial Goal",
            description:
                "Set your financial goal and campaign duration. You’ll break down the costs in the next step.",
            buttonLabel: "Set Financial Goal",
            isExpanded: _expandedSections["Financial Goal"]!,
            onToggle: () => setState(
              () => _expandedSections["Financial Goal"] =
                  !_expandedSections["Financial Goal"]!,
            ),
            onAction: () => _onSectionAction("Financial Goal"),
          ),
          CampaignSectionTile(
            title: "Cost Breakdown",
            description:
                "Break down your campaign expenses so sponsors can clearly understand where the funds will be used.",
            buttonLabel: "Add Cost breakdown",
            isExpanded: _expandedSections["Cost Breakdown"]!,
            onToggle: () => setState(
              () => _expandedSections["Cost Breakdown"] =
                  !_expandedSections["Cost Breakdown"]!,
            ),
            onAction: () => _onSectionAction("Cost Breakdown"),
          ),
          CampaignSectionTile(
            title: "Goal",
            description:
                "Set a measurable career goal with a timeline to help sponsors understand your direction.",
            buttonLabel: "Add Goal",
            isExpanded: _expandedSections["Goal"]!,
            onToggle: () => setState(
              () => _expandedSections["Goal"] = !_expandedSections["Goal"]!,
            ),
            onAction: () => _onSectionAction("Goal"),
          ),
          CampaignSectionTile(
            title: "Preferred Sponsors",
            description:
                "Select brands or sponsors you’re interested in working with. You will automatically receive updates on their journey.",
            buttonLabel: "Add Sponsors",
            isExpanded: _expandedSections["Preferred Sponsors"]!,
            onToggle: () => setState(
              () => _expandedSections["Preferred Sponsors"] =
                  !_expandedSections["Preferred Sponsors"]!,
            ),
            onAction: () => _onSectionAction("Preferred Sponsors"),
          ),
          CampaignSectionTile(
            title: "Sponsorship Preferences",
            description:
                "Define your preferred sponsorship opportunities to match with the right partners.",
            buttonLabel: "Add Preferences",
            isExpanded: _expandedSections["Sponsorship Preferences"]!,
            onToggle: () => setState(
              () => _expandedSections["Sponsorship Preferences"] =
                  !_expandedSections["Sponsorship Preferences"]!,
            ),
            onAction: () => _onSectionAction("Sponsorship Preferences"),
          ),
        ],
      ),
    );
  }
}

// --- REFACTORED SUB-WIDGETS ---

class CampaignSectionTile extends StatelessWidget {
  final String title;
  final String description;
  final String buttonLabel;
  final bool isExpanded;
  final VoidCallback onToggle;
  final VoidCallback onAction;

  const CampaignSectionTile({
    super.key,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.isExpanded,
    required this.onToggle,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onToggle,
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
          const SizedBox(height: 24),
          RoundedButton(
            label: buttonLabel,
            onPressed: onAction,
            icon: const Icon(Icons.add, color: AppColors.white, size: 18),
            backgroundColor: AppColors.darkGreyCard.withOpacity(0.5),
            height: 48,
          ),
          const SizedBox(height: 10),
        ],
        const Divider(color: Colors.white12, height: 1),
      ],
    );
  }
}
