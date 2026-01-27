import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_detail_provider.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_detail_state.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_theme.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/cost_break_down_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/financial_goal_bottom_sheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/goal_milestone_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/funded_percentage_bottom_sheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/goal_timeline_widget.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/prefer_sponsors_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/sponsor_grid_summary.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/sponsorship_preference_bottomsheet.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/sponsorship_preference_summary.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AthleteCampaignDetailScreen extends ConsumerStatefulWidget {
  final CampaignModel campaign;
  const AthleteCampaignDetailScreen({super.key, required this.campaign});

  @override
  ConsumerState<AthleteCampaignDetailScreen> createState() =>
      _AthleteCampaignDetailScreenState();
}

class _AthleteCampaignDetailScreenState
    extends ConsumerState<AthleteCampaignDetailScreen> {
  final Map<String, bool> _sections = {
    "Funded Level": false,
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
  double _fundedPercentage = 0.0;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Fetch campaign details when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(campaignDetailProvider.notifier)
          .getCampaignDetail(widget.campaign.id ?? '');
    });
  }

  Color _getCostColor(int index) {
    final colors = [
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.pink,
      Colors.teal,
    ];
    return colors[index % colors.length];
  }

  void _handlePreferences() async {
    await showModalBottomSheet<List<SponsorshipPreference>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SponsorshipPreferencesBottomSheet(
        initialPreferences: _preferences,
        onSave: (items) async {
          final prefs = {
            "socialMedia": items.any((e) => e.title == "Social Media"),
            "eventAppearance": items.any((e) => e.title == "Event Appearance"),
            "contentCreation": items.any((e) => e.title == "Content Creation"),
            "productEndorsement": items.any(
              (e) => e.title == "Product Endorsement",
            ),
            "speech": items.any((e) => e.title == "Speech"),
            "workshop": items.any((e) => e.title == "Workshop"),
            "other": items.any((e) => e.title == "Other"),
          };

          await ref
              .read(campaignDetailProvider.notifier)
              .updateSponsorshipPreferences(
                id: widget.campaign.id ?? '',
                preferences: prefs,
                onSuccess: () {
                  setState(() => _isInitialized = false);
                  if (mounted) Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Preferences updated successfully",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                onFailure: (error) {
                  throw error;
                },
              );
        },
      ),
    );
  }

  void _handleFundedLevel() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FundedPercentageBottomSheet(
        initialPercentage: _fundedPercentage,
        onSave: (value) async {
          await ref
              .read(campaignDetailProvider.notifier)
              .updateFundedPercentage(
                id: widget.campaign.id ?? '',
                fundedPercentage: value,
                onSuccess: () {
                  setState(() => _isInitialized = false);
                  if (mounted) Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Funded level updated successfully",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                onFailure: (error) {
                  throw error;
                },
              );
        },
      ),
    );
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

  void _handleDeleteGoal(int index) async {
    final goal = _milestones[index];
    if (goal.id == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.darkGreyCard,
        title: const CustomText(
          title: "Remove Goal",
          textColor: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        content: CustomText(
          title: "Are you sure you want to remove '${goal.title}'?",
          textColor: AppColors.grey,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              "Cancel",
              style: TextStyle(color: AppColors.grey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              "Remove",
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref
          .read(campaignDetailProvider.notifier)
          .deleteGoal(
            id: widget.campaign.id ?? '',
            goalId: goal.id!,
            onSuccess: () {
              setState(() => _isInitialized = false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Goal removed successfully",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            onFailure: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColors.error,
                ),
              );
            },
          );
    }
  }

  void _handleAddGoal() async {
    await showModalBottomSheet<GoalMilestone>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddGoalBottomSheet(
        onSave: (goal) async {
          await ref
              .read(campaignDetailProvider.notifier)
              .addGoal(
                id: widget.campaign.id ?? '',
                title: goal.title,
                targetDate: goal.date,
                status: goal.status,
                onSuccess: () {
                  setState(() => _isInitialized = false);
                  if (mounted) Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Goal added successfully",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                onFailure: (error) {
                  throw error;
                },
              );
        },
      ),
    );
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
      ref
          .read(campaignDetailProvider.notifier)
          .updateFinancialGoal(
            id: widget.campaign.id ?? '',
            totalAmount: result.amount,
            deadline: result.deadline,
            onSuccess: () {
              setState(() {
                _isInitialized = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Financial Goal updated successfully",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          );
    }
  }

  void _handleCostBreakdown() async {
    if (_financialGoal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please set a Financial Goal first",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    await showModalBottomSheet<List<CostItem>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CostBreakdownBottomSheet(
        totalBudget: _financialGoal!.amount,
        initialItems: _costs,
        onSave: (items) async {
          await ref
              .read(campaignDetailProvider.notifier)
              .updateCostBreakdown(
                id: widget.campaign.id ?? '',
                costs: items
                    .map((e) => {'title': e.title, 'amount': e.amount})
                    .toList(),
                onSuccess: () {
                  setState(() => _isInitialized = false);
                  if (mounted) Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Cost breakdown updated successfully",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.success,
                    ),
                  );
                },
                onFailure: (error) {
                  throw error;
                },
              );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detailState = ref.watch(campaignDetailProvider);

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
          "${widget.campaign.title?.text ?? ''} Campaign",
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: detailState.when(
        initial: () => const SizedBox.shrink(),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (message) => Center(
          child: Text(message, style: const TextStyle(color: AppColors.white)),
        ),
        loaded: (campaign) {
          // Map API data to UI state only once
          if (!_isInitialized) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _isInitialized = true;
                if (campaign.financialGoal != null &&
                    (campaign.financialGoal?.totalAmount ?? 0) > 0) {
                  _financialGoal = FinancialGoalData(
                    amount: campaign.financialGoal?.totalAmount ?? 0,
                    deadline:
                        DateTime.tryParse(
                          campaign.financialGoal?.deadline ?? '',
                        ) ??
                        DateTime.now(),
                  );
                }
                _sections["Financial Goal"] =
                    true; // Always expand to show card or add button

                _costs = (campaign.costBreakdown ?? [])
                    .asMap()
                    .entries
                    .map(
                      (entry) => CostItem(
                        id: entry.value.id,
                        title: entry.value.title ?? '',
                        amount: entry.value.amount ?? 0,
                        color: _getCostColor(entry.key),
                      ),
                    )
                    .toList();
                if (_costs.isNotEmpty) _sections["Cost Breakdown"] = true;

                _milestones = (campaign.goals ?? [])
                    .map(
                      (goal) => GoalMilestone(
                        id: goal.id,
                        title: goal.title ?? '',
                        date:
                            DateTime.tryParse(goal.targetDate ?? '') ??
                            DateTime.now(),
                        status: goal.status ?? 'incoming',
                      ),
                    )
                    .toList();
                if (_milestones.isNotEmpty) _sections["Goal"] = true;

                final rawFunded = campaign.title?.fundedPercentage ?? 0.0;
                // If the value is > 1.0, assume it's a whole number percentage and normalize it
                _fundedPercentage = rawFunded > 1.0
                    ? rawFunded / 100
                    : rawFunded;
                if (_fundedPercentage > 0) _sections["Funded Level"] = true;

                _selectedSponsors = (campaign.preferredSponsors ?? [])
                    .map(
                      (s) => Sponsor(
                        name: (s.email ?? '').split('@').first, // Fallback name
                        category: s.role ?? '',
                        logoUrl:
                            "https://via.placeholder.com/150", // Placeholder logo
                      ),
                    )
                    .toList();
                if (_selectedSponsors.isNotEmpty)
                  _sections["Preferred Sponsors"] = true;

                if (campaign.sponsorshipPreferences != null) {
                  _preferences = [];
                  final p = campaign.sponsorshipPreferences!;
                  if (p.socialMedia ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Social Media",
                        icon: Icons.share,
                      ),
                    );
                  }
                  if (p.eventAppearance ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Event Appearance",
                        icon: Icons.event,
                      ),
                    );
                  }
                  if (p.contentCreation ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Content Creation",
                        icon: Icons.create,
                      ),
                    );
                  }
                  if (p.productEndorsement ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Product Endorsement",
                        icon: Icons.verified,
                      ),
                    );
                  }
                  if (p.speech ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Speech",
                        icon: Icons.record_voice_over,
                      ),
                    );
                  }
                  if (p.workshop ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Workshop",
                        icon: Icons.work,
                      ),
                    );
                  }
                  if (p.other?.enabled ?? false) {
                    _preferences.add(
                      SponsorshipPreference(
                        title: "Other",
                        icon: Icons.more_horiz,
                      ),
                    );
                  }

                  if (_preferences.isNotEmpty) {
                    _sections["Sponsorship Preferences"] = true;
                  }
                }
              });
            });
          }

          return _buildCampaignForm(campaign);
        },
      ),
    );
  }

  Widget _buildCampaignForm(CampaignDetailModel campaign) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _Tile(
          "Funded Level",
          "Update how much your campaign is funded.",
          _fundedPercentage > 0 ? "Edit Level" : "Add Level",
          _sections["Funded Level"]!,
          (v) => setState(() => _sections["Funded Level"] = v),
          _handleFundedLevel,
          content: _fundedPercentage > 0
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: _fundedPercentage,
                          backgroundColor: Colors.white12,
                          valueColor: const AlwaysStoppedAnimation(
                            Colors.orange,
                          ),
                          minHeight: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${(_fundedPercentage * 100).toInt()}% funded",
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        ),
        _Tile(
          "Financial Goal",
          "Set your financial goal and duration.",
          (_financialGoal == null || _financialGoal!.amount == 0)
              ? "Add Goal"
              : "Edit Goal",
          _sections["Financial Goal"]!,
          (v) => setState(() => _sections["Financial Goal"] = v),
          _handleFinancialGoal,
          content: (_financialGoal == null || _financialGoal!.amount == 0)
              ? null
              : _FinancialGoalSummaryCard(
                  goal: _financialGoal!,
                  campaignTitle: campaign.title,
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
          _handleAddGoal,
          content: _milestones.isEmpty
              ? null
              : GoalTimelineSummary(
                  milestones: _milestones,
                  onAdd: _handleAddGoal,
                  onDelete: _handleDeleteGoal,
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
                ),
        ),
      ],
    );
  }
}

class _FinancialGoalSummaryCard extends StatelessWidget {
  final FinancialGoalData goal;
  final CampaignTitleModel? campaignTitle;
  const _FinancialGoalSummaryCard({required this.goal, this.campaignTitle});

  String _getDurationString(DateTime deadline) {
    final now = DateTime.now();
    if (deadline.isBefore(now)) return "Ended";

    int years = deadline.year - now.year;
    int months = deadline.month - now.month;
    int days = deadline.day - now.day;

    if (days < 0) {
      final lastDayOfPrevMonth = DateTime(deadline.year, deadline.month, 0).day;
      days += lastDayOfPrevMonth;
      months--;
    }

    if (months < 0) {
      months += 12;
      years--;
    }

    final parts = <String>[];
    if (years > 0) parts.add("$years ${years == 1 ? 'year' : 'years'}");
    if (months > 0) parts.add("$months ${months == 1 ? 'month' : 'months'}");
    if (days > 0) parts.add("$days ${days == 1 ? 'day' : 'days'}");

    if (parts.isEmpty) return "Today";
    return "${parts.join(', ')} remaining";
  }

  @override
  Widget build(BuildContext context) {
    final durationString = _getDurationString(goal.deadline);
    final rawFunded = campaignTitle?.fundedPercentage ?? 0.0;
    // Normalize if the value comes as a whole number (0-100) instead of decimal (0.0-1.0)
    final fundedPercentage = rawFunded > 1.0 ? rawFunded / 100 : rawFunded;
    final fundedAmount = goal.amount * fundedPercentage;

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
                campaignTitle?.text ?? '',
                style: const TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 16,
                ),
              ),
              const Icon(Icons.more_vert, color: AppColors.textSecondary),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "\$${NumberFormat('#,###').format(fundedAmount)}",
            style: const TextStyle(
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
              Expanded(
                child: Text(
                  durationString,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fundedPercentage,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(Colors.orange),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${(fundedPercentage * 100).toInt()}% funded",
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
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
