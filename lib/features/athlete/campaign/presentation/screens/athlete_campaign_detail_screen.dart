import 'package:athlink/features/athlete/campaign/data/models/campaign_models.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_detail_provider.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_detail_state.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_detail/campaign_detail_tile.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_detail/cost_breakdown_summary.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_detail/financial_goal_summary_card.dart';
import 'package:athlink/features/athlete/campaign/presentation/widgets/campaign_detail/funded_level_summary.dart';

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
import 'package:athlink/shared/constant/constants.dart';
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
          .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
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
              .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
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
              .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
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
    final result = await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PreferredSponsorsBottomSheet(
        campaignId: widget.campaign.id ?? '',
        alreadySelected: _selectedSponsors,
      ),
    );
    if (result != null) {
      await ref
          .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
          .updatePreferredSponsors(
            id: widget.campaign.id ?? '',
            sponsorIds: result,
            onSuccess: () {
              setState(() => _isInitialized = false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Preferred sponsors updated successfully",
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
          .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
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
              .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
              .addGoal(
                id: widget.campaign.id ?? '',
                title: goal.title,
                targetDate: goal.date,
                status: "PENDING",
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
          .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
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
              .read(campaignDetailProvider(widget.campaign.id ?? '').notifier)
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
    final detailState = ref.watch(
      campaignDetailProvider(widget.campaign.id ?? ''),
    );
    ref.listen(campaignDetailProvider(widget.campaign.id ?? ''), (
      previous,
      next,
    ) {
      // Handle state changes if needed
    });

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
                        id: s.id,
                        name: s.name ?? (s.email ?? '').split('@').first,
                        category: s.role ?? '',
                        profileImageUrl: s.profileImageUrl != null
                            ? "$fileBaseUrl${s.profileImageUrl}"
                            : "https://via.placeholder.com/150",
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
        CampaignDetailTile(
          title: "Funded Level",
          desc: "Update how much your campaign is funded.",
          btnLabel: _fundedPercentage > 0 ? "Edit Level" : "Add Level",
          isExpanded: _sections["Funded Level"]!,
          onToggle: (v) => setState(() => _sections["Funded Level"] = v),
          onAction: _handleFundedLevel,
          content: _fundedPercentage > 0
              ? FundedLevelSummary(fundedPercentage: _fundedPercentage)
              : null,
        ),
        CampaignDetailTile(
          title: "Financial Goal",
          desc: "Set your financial goal and duration.",
          btnLabel: (_financialGoal == null || _financialGoal!.amount == 0)
              ? "Add Goal"
              : "Edit Goal",
          isExpanded: _sections["Financial Goal"]!,
          onToggle: (v) => setState(() => _sections["Financial Goal"] = v),
          onAction: _handleFinancialGoal,
          content: (_financialGoal == null || _financialGoal!.amount == 0)
              ? null
              : FinancialGoalSummaryCard(
                  goal: _financialGoal!,
                  campaignTitle: campaign.title,
                ),
        ),
        CampaignDetailTile(
          title: "Cost Breakdown",
          desc: "Break down campaign expenses for sponsors.",
          btnLabel: _costs.isEmpty ? "Add Cost breakdown" : "Edit Breakdown",
          isExpanded: _sections["Cost Breakdown"]!,
          onToggle: (v) => setState(() => _sections["Cost Breakdown"] = v),
          onAction: _handleCostBreakdown,
          content: _costs.isEmpty
              ? null
              : CostBreakdownSummaryBody(
                  costs: _costs,
                  budget: _financialGoal?.amount ?? 0,
                ),
        ),
        CampaignDetailTile(
          title: "Goal",
          desc: "Set a career goal with a timeline.",
          btnLabel: "Add Goal",
          isExpanded: _sections["Goal"]!,
          onToggle: (v) => setState(() => _sections["Goal"] = v),
          onAction: _handleAddGoal,
          content: _milestones.isEmpty
              ? null
              : GoalTimelineSummary(
                  milestones: _milestones,
                  onAdd: _handleAddGoal,
                  onDelete: _handleDeleteGoal,
                ),
        ),
        CampaignDetailTile(
          title: "Preferred Sponsors",
          desc: "Select brands you're interested in.",
          btnLabel: "Add Sponsors",
          isExpanded: _sections["Preferred Sponsors"]!,
          onToggle: (v) => setState(() => _sections["Preferred Sponsors"] = v),
          onAction: _handleSponsors,
          content: _selectedSponsors.isEmpty
              ? null
              : SponsorGridSummary(
                  selectedSponsors: _selectedSponsors,
                  onAddMore: _handleSponsors,
                ),
        ),
        CampaignDetailTile(
          title: "Sponsorship Preferences",
          desc: "Define your sponsorship opportunities.",
          btnLabel: "Add Preferences",
          isExpanded: _sections["Sponsorship Preferences"]!,
          onToggle: (v) =>
              setState(() => _sections["Sponsorship Preferences"] = v),
          onAction: _handlePreferences,
          content: _preferences.isEmpty
              ? null
              : SponsorshipPreferencesSummary(
                  preferences: _preferences,
                  onEdit: _handlePreferences,
                ),
        ),
      ],
    );
  }
}
