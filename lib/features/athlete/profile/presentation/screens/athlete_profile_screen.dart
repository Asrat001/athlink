import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_header.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_info_section.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/instagram_connection_widget.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/funding_progress_card.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/quick_actions_grid.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/global_footprint_map.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_primary_button.dart';

class AthleteProfileScreen extends StatefulWidget {
  const AthleteProfileScreen({super.key});

  @override
  State<AthleteProfileScreen> createState() => _AthleteProfileScreenState();
}

class _AthleteProfileScreenState extends State<AthleteProfileScreen> {
  bool _isEditing = false;

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final _nameController = TextEditingController(text: "Mariya Osteen");
  final _locationController = TextEditingController(text: "Los Angeles, CA");
  final _bioController = TextEditingController(
    text: "Tell people about who you are here, add bio",
  );

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _handleImageUpload() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _toggleEdit() => setState(() => _isEditing = !_isEditing);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(
              isEditing: _isEditing,
              onPickImage: _handleImageUpload,
              localImage: _profileImage,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 55),

                  ProfileInfoSection(
                    isEditing: _isEditing,
                    nameController: _nameController,
                    locationController: _locationController,
                    bioController: _bioController,
                    onEditToggle: _toggleEdit,
                  ),

                  if (!_isEditing) ...[
                    const InstagramConnectSection(),
                    const SizedBox(height: 32),
                    const FundingProgressCard(),
                    const SizedBox(height: 24),
                    const QuickActionsGrid(),
                    const SizedBox(height: 32),
                    const GlobalFootprintMap(),
                  ],

                  if (_isEditing) _buildEditActions(),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Expanded(
            child: ProfilePrimaryButton(
              label: "Save Update",
              onTap: _toggleEdit,
              color: AppColors.darkGreyCard,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ProfilePrimaryButton(
              label: "Cancel",
              onTap: _toggleEdit,
              color: AppColors.transparent,
              isBordered: true,
            ),
          ),
        ],
      ),
    );
  }
}
