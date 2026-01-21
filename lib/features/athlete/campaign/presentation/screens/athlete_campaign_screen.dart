import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:athlink/shared/widgets/forms/custom_text_field.dart'; // Ensure this import path is correct
import 'package:flutter/material.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class Campaign {
  final String title;
  final double progress;
  final bool isActive;

  Campaign({
    required this.title,
    required this.progress,
    required this.isActive,
  });
}

class AthleteCampaignsScreen extends StatefulWidget {
  const AthleteCampaignsScreen({super.key});

  @override
  State<AthleteCampaignsScreen> createState() => _AthleteCampaignsScreenState();
}

class _AthleteCampaignsScreenState extends State<AthleteCampaignsScreen> {
  // Initial data
  List<Campaign> campaigns = [
    Campaign(title: "LA 2028 Olympics", progress: 0.0, isActive: false),
    Campaign(title: "LA 2028 Olympics", progress: 0.0, isActive: false),
    Campaign(title: "LA 2028 Olympics", progress: 0.5, isActive: true),
  ];

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  void _showCreateCampaignSheet() {
    _titleController.clear(); // Reset controller when opening
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.darkGreyCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 24,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter a campaign title";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              RoundedButton(
                label: "Create a Campaign",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      campaigns.insert(
                        0,
                        Campaign(
                          title: _titleController.text.trim(),
                          progress: 0.0,
                          isActive: false,
                        ),
                      );
                    });
                    Navigator.pop(context); // Close bottom sheet
                  }
                },
                icon: const Icon(Icons.add, color: AppColors.white, size: 18),
                backgroundColor: AppColors.primary, // Or match image style
                height: 50,
              ),
              const SizedBox(height: 24),
            ],
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 0,
        title: CustomText(
          title: "My Campaign",
          fontSize: 24,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          if (campaigns.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.add, color: AppColors.white, size: 28),
              onPressed: _showCreateCampaignSheet, // Call the modal
            ),
        ],
      ),
      body: campaigns.isEmpty ? _buildEmptyState() : _buildCampaignList(),
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
            onPressed: _showCreateCampaignSheet, // Call the modal
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

  Widget _buildCampaignList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            context.push(
              Routes.athleteCampaignDetailScreen,
              extra: campaigns[index].title,
            );
          },
          child: CampaignCard(campaign: campaigns[index]),
        );
      },
    );
  }
}

class CampaignCard extends StatelessWidget {
  final Campaign campaign;
  const CampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkGreyCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title: campaign.title,
                fontSize: 18,
                textColor: AppColors.white,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: campaign.isActive,
                      onChanged: (val) {},
                      activeColor: AppColors.orangeGradientStart,
                      activeTrackColor: AppColors.orangeGradientStart
                          .withValues(alpha: 0.3),
                      inactiveThumbColor: AppColors.white,
                      inactiveTrackColor: AppColors.grey,
                    ),
                  ),
                  const Icon(Icons.more_vert, color: AppColors.white, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: campaign.progress,
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                campaign.progress > 0
                    ? AppColors.orangeGradientStart
                    : Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          const SizedBox(height: 12),
          CustomText(
            title: "${(campaign.progress * 100).toInt()}% funded",
            textColor: AppColors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
