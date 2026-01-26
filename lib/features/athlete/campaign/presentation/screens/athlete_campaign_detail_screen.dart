import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_theme.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/cost_break_down_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/financial_goal_bottom_sheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/goal_milestone_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/goal_timeline_widget.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/prefer_sponsors_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/sponsor_grid_summary.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/sponsorship_preference_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/sponsorship_preference_summary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:athlink/shared/theme/app_colors.dart';

class AthleteCampaignDetailScreen extends StatefulWidget {
  final String campaignTitle;
  const AthleteCampaignDetailScreen({super.key, required this.campaignTitle});

  @override
  State<AthleteCampaignDetailScreen> createState() =>
      _AthleteCampaignDetailScreenState();
}

class _AthleteCampaignDetailScreenState
    extends State<AthleteCampaignDetailScreen> {
  final Map<String, bool> _sections = {
    "Financial Goal": false,
    "Cost Breakdown": false,
    "Goal": false,
    "Preferred Sponsors": false,
    "Sponsorship Preferences": false,
  };

  FinancialGoalData? _financialGoal;
  List<CostItem> _costs = [];
  List<GoalMilestone> _milestones = [];
  List<Sponsor> _selectedSponsors = [];
  List<SponsorshipPreference> _preferences = [];

  void _handlePreferences() async {
    final result = await showModalBottomSheet<List<SponsorshipPreference>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          SponsorshipPreferencesBottomSheet(initialPreferences: _preferences),
    );
    if (result != null) {
      setState(() {
        _preferences = result;
        _sections["Sponsorship Preferences"] = _preferences.isNotEmpty;
      });
    }
  }

  void _deletePreference(int index) {
    setState(() {
      _preferences.removeAt(index);
      if (_preferences.isEmpty) {
        _sections["Sponsorship Preferences"] = false;
      }
    });
  }

  void _handleSponsors() async {
    final result = await showModalBottomSheet<List<Sponsor>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          PreferredSponsorsBottomSheet(alreadySelected: _selectedSponsors),
    );
    if (result != null) {
      setState(() {
        _selectedSponsors = result;
        _sections["Preferred Sponsors"] = true;
      });
    }
  }

  void _handleGoal() async {
    final result = await showModalBottomSheet<GoalMilestone>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddGoalBottomSheet(),
    );
    if (result != null) {
      setState(() {
        _milestones.add(result);
        _sections["Goal"] = true;
      });
    }
  }

  void _handleFinancialGoal() async {
    final result = await showModalBottomSheet<FinancialGoalData>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          FinancialGoalBottomSheet(initialGoal: _financialGoal),
    );
    if (result != null) {
      setState(() {
        _financialGoal = result;
        _sections["Financial Goal"] = true;
        // If goal changes, costs might need re-validating, but we keep them for now
      });
    }
  }

  void _handleCostBreakdown() async {
    if (_financialGoal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please set a Financial Goal first")),
      );
      return;
    }
    final result = await showModalBottomSheet<List<CostItem>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CostBreakdownBottomSheet(
        totalBudget: _financialGoal!.amount,
        initialItems: _costs,
      ),
    );
    if (result != null) {
      setState(() {
        _costs = result;
        _sections["Cost Breakdown"] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "${widget.campaignTitle} Campaign",
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Tile(
            "Financial Goal",
            "Set your financial goal and duration.",
            _financialGoal == null ? "Set Financial Goal" : "Edit Goal",
            _sections["Financial Goal"]!,
            (v) => setState(() => _sections["Financial Goal"] = v),
            _handleFinancialGoal,
            content: _financialGoal == null
                ? null
                : _FinancialGoalSummaryCard(
                    goal: _financialGoal!,
                    title: widget.campaignTitle,
                  ),
          ),
          _Tile(
            "Cost Breakdown",
            "Break down campaign expenses for sponsors.",
            _costs.isEmpty ? "Add Cost breakdown" : "Edit Breakdown",
            _sections["Cost Breakdown"]!,
            (v) => setState(() => _sections["Cost Breakdown"] = v),
            _handleCostBreakdown,
            content: _costs.isEmpty
                ? null
                : _SummaryBody(
                    costs: _costs,
                    budget: _financialGoal?.amount ?? 0,
                  ),
          ),
          _Tile(
            "Goal",
            "Set a career goal with a timeline.",
            "Add Goal",
            _sections["Goal"]!,
            (v) => setState(() => _sections["Goal"] = v),
            _handleGoal,
            content: _milestones.isEmpty
                ? null
                : GoalTimelineSummary(
                    milestones: _milestones,
                    onAdd: _handleGoal,
                  ),
          ),
          _Tile(
            "Preferred Sponsors",
            "Select brands you're interested in.",
            "Add Sponsors",
            _sections["Preferred Sponsors"]!,
            (v) => setState(() => _sections["Preferred Sponsors"] = v),
            _handleSponsors,
            content: _selectedSponsors.isEmpty
                ? null
                : SponsorGridSummary(
                    selectedSponsors: _selectedSponsors,
                    onAddMore: _handleSponsors,
                  ),
          ),
          _Tile(
            "Sponsorship Preferences",
            "Define your sponsorship opportunities.",
            "Add Preferences",
            _sections["Sponsorship Preferences"]!,
            (v) => setState(() => _sections["Sponsorship Preferences"] = v),
            _handlePreferences,
            content: _preferences.isEmpty
                ? null
                : SponsorshipPreferencesSummary(
                    preferences: _preferences,
                    onEdit: _handlePreferences, // Edit re-opens modal
                    onDelete: _deletePreference, // Removes specific item
                  ),
          ),
        ],
      ),
    );
  }
}

class _FinancialGoalSummaryCard extends StatelessWidget {
  final FinancialGoalData goal;
  final String title;
  const _FinancialGoalSummaryCard({required this.goal, required this.title});

  @override
  Widget build(BuildContext context) {
    final months = (goal.deadline.difference(DateTime.now()).inDays / 30)
        .ceil();
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 16,
                ),
              ),
              const Icon(Icons.more_vert, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "\$0",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Goal: \$${NumberFormat('#,###').format(goal.amount)}",
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
              Text(
                "$months months remaining",
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: const LinearProgressIndicator(
              value: 0.05,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "0% funded",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String title, desc, btnLabel;
  final bool isExp;
  final ValueChanged<bool> onToggle;
  final VoidCallback onAct;
  final Widget? content;
  const _Tile(
    this.title,
    this.desc,
    this.btnLabel,
    this.isExp,
    this.onToggle,
    this.onAct, {
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => onToggle(!isExp),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textTertiary,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  isExp ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
        ),
        if (isExp) ...[
          if (content != null) content!,
          Text(
            desc,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: onAct,
            icon: const Icon(Icons.add, size: 18),
            label: Text(btnLabel),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surface.withOpacity(0.5),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        const Divider(color: AppColors.border),
      ],
    );
  }
}

class _SummaryBody extends StatelessWidget {
  final List<CostItem> costs;
  final double budget;
  const _SummaryBody({required this.costs, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Total Budget",
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "\$${NumberFormat('#,###').format(budget)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: CustomPaint(
                painter: MultiColorPiePainter(items: costs, total: budget),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...costs.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: e.color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    e.title,
                    style: const TextStyle(
                      color: AppColors.textTertiary,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  "\$${NumberFormat('#,###').format(e.amount)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
