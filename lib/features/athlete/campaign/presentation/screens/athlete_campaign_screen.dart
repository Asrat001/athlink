import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_provider.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_state.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AthleteCampaignsScreen extends ConsumerStatefulWidget {
  const AthleteCampaignsScreen({super.key});

  @override
  ConsumerState<AthleteCampaignsScreen> createState() =>
      _AthleteCampaignsScreenState();
}

class _AthleteCampaignsScreenState
    extends ConsumerState<AthleteCampaignsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Fetch campaigns when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(campaignProvider.notifier).getCampaigns();
    });
  }

  void _showCreateCampaignSheet() {
    _titleController.clear();
    bool isSaving = false;
    String? error;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AppColors.darkGreyCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    CustomText(
                      title: "Create a Campaign",
                      fontSize: 20,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 24),
                    CustomText(
                      title: "Title",
                      fontSize: 14,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      label: "Add the title of your campaign",
                      controller: _titleController,
                      textColor: AppColors.white,
                      cursorColor: AppColors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter a campaign title";
                        }
                        return null;
                      },
                    ),
                    if (error != null) ...[
                      const SizedBox(height: 12),
                      CustomText(
                        title: error!,
                        textColor: AppColors.error,
                        fontSize: 12,
                      ),
                    ],
                    const SizedBox(height: 32),
                    RoundedButton(
                      label: isSaving ? "" : "Create a Campaign",
                      onPressed: isSaving
                          ? () {}
                          : () {
                              if (_formKey.currentState!.validate()) {
                                setModalState(() {
                                  isSaving = true;
                                  error = null;
                                });

                                ref
                                    .read(campaignProvider.notifier)
                                    .createCampaign(
                                      title: _titleController.text.trim(),
                                      onSuccess: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Campaign created successfully",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: AppColors.success,
                                          ),
                                        );
                                      },
                                      onFailure: (msg) {
                                        setModalState(() {
                                          isSaving = false;
                                          error = msg;
                                        });
                                      },
                                    );
                              }
                            },
                      icon: isSaving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 18,
                            ),
                      backgroundColor: AppColors.primary,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final campaignState = ref.watch(campaignProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: CustomText(
          title: "My Campaign",
          fontSize: 24,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add, color: AppColors.white, size: 28),
              onPressed: _showCreateCampaignSheet,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(campaignProvider.notifier).getCampaigns();
        },
        color: AppColors.primary,
        backgroundColor: AppColors.darkGreyCard,
        child: campaignState.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          loaded: (campaigns) => _buildCampaignList(campaigns),
          error: (error) => Center(
            child: CustomText(
              title: error,
              textColor: AppColors.grey,
              fontSize: 14,
            ),
          ),
          empty: () => _buildEmptyState(),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            title: "No Campaigns created yet.",
            textColor: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 24),
          RoundedButton(
            label: "Create a Campaign",
            onPressed: _showCreateCampaignSheet,
            icon: const Icon(Icons.add, color: AppColors.white, size: 18),
            backgroundColor: AppColors.darkGreyCard,
            width: 220,
          ),
          const SizedBox(height: 24),
          CustomText(
            title:
                "Create a campaign to set goals, track funding, and attract sponsors.",
            textColor: AppColors.grey,
            fontSize: 13,
            centerText: true,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }

  void _handleEditCampaign(CampaignModel campaign) {
    _titleController.text = campaign.title?.text ?? '';
    bool isSaving = false;
    String? error;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: AppColors.darkGreyCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    CustomText(
                      title: "Edit Campaign Name",
                      fontSize: 20,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 24),
                    CustomText(
                      title: "Title",
                      fontSize: 14,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      label: "Enter new campaign title",
                      controller: _titleController,
                      textColor: AppColors.white,
                      cursorColor: AppColors.white,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter a campaign title";
                        }
                        return null;
                      },
                    ),
                    if (error != null) ...[
                      const SizedBox(height: 12),
                      CustomText(
                        title: error!,
                        textColor: AppColors.error,
                        fontSize: 12,
                      ),
                    ],
                    const SizedBox(height: 32),
                    RoundedButton(
                      label: isSaving ? "" : "Save Changes",
                      icon: isSaving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 18,
                            ),
                      onPressed: isSaving
                          ? () {}
                          : () {
                              if (_formKey.currentState!.validate()) {
                                setModalState(() {
                                  isSaving = true;
                                  error = null;
                                });

                                ref
                                    .read(campaignProvider.notifier)
                                    .updateCampaignTitle(
                                      id: campaign.id ?? '',
                                      title: _titleController.text.trim(),
                                      onSuccess: () {
                                        Navigator.pop(context);
                                      },
                                      onFailure: (msg) {
                                        setModalState(() {
                                          isSaving = false;
                                          error = msg;
                                        });
                                      },
                                    );
                              }
                            },
                      backgroundColor: AppColors.primary,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleDeleteCampaign(CampaignModel campaign) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: AppColors.darkGreyCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete_forever_rounded,
                  color: AppColors.error,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              const CustomText(
                title: 'Delete Campaign',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const CustomText(
                title:
                    'Are you sure you want to delete this campaign? This action cannot be undone.',
                fontSize: 14,
                textColor: Colors.white60,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const CustomText(
                        title: 'Cancel',
                        textColor: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _deleteCampaign(campaign.id ?? '');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.error,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const CustomText(
                        title: 'Delete',
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteCampaign(String id) {
    ref
        .read(campaignProvider.notifier)
        .deleteCampaign(
          id: id,
          onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Campaign deleted successfully",
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

  Widget _buildCampaignList(List<CampaignModel> campaigns) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final campaign = campaigns[index];
        return InkWell(
          onTap: () {
            context.push(
              Routes.athleteCampaignDetailScreen,
              extra: campaign, // Pass the entire campaign object
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: CampaignCard(
            campaign: campaign,
            onEdit: () => _handleEditCampaign(campaign),
            onDelete: () => _handleDeleteCampaign(campaign),
            onToggle: (isActive) {
              ref
                  .read(campaignProvider.notifier)
                  .toggleCampaignActive(
                    id: campaign.id ?? '',
                    isActive: isActive,
                    onSuccess: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Campaign ${isActive ? 'activated' : 'deactivated'} successfully",
                            style: const TextStyle(color: Colors.white),
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
            },
          ),
        );
      },
    );
  }
}

class CampaignCard extends StatelessWidget {
  final CampaignModel campaign;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Function(bool) onToggle;
  const CampaignCard({
    super.key,
    required this.campaign,
    required this.onEdit,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomText(
                  title: campaign.title?.text ?? '',
                  fontSize: 18,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: campaign.title?.isActive ?? false,
                      onChanged: onToggle,
                      activeColor: AppColors.orangeGradientStart,
                      activeTrackColor: AppColors.orangeGradientStart
                          .withValues(alpha: 0.2),
                      inactiveThumbColor: AppColors.white,
                      inactiveTrackColor: AppColors.grey.withValues(alpha: 0.3),
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert,
                      color: AppColors.white,
                      size: 20,
                    ),
                    color: AppColors.darkGreyCard,
                    onSelected: (value) {
                      if (value == 'edit') {
                        onEdit();
                      } else if (value == 'delete') {
                        onDelete();
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem<String>(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.white, size: 18),
                            SizedBox(width: 8),
                            Text(
                              'Edit Campaign Name',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: AppColors.error,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Delete Campaign',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: (campaign.title?.fundedPercentage ?? 0.0) > 1.0
                  ? (campaign.title?.fundedPercentage ?? 0.0) / 100
                  : (campaign.title?.fundedPercentage ?? 0.0),
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                (campaign.title?.fundedPercentage ?? 0.0) > 0
                    ? AppColors.orangeGradientStart
                    : Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          const SizedBox(height: 12),
          CustomText(
            title:
                "${((campaign.title?.fundedPercentage ?? 0.0) > 1.0 ? (campaign.title?.fundedPercentage ?? 0.0).toInt() : ((campaign.title?.fundedPercentage ?? 0.0) * 100).toInt())}% funded",
            textColor: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
