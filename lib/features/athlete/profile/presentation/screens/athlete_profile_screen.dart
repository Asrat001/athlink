import 'dart:io';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/athlete_profile_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/athlete_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_header.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_display_section.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_edit_section.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/instagram_connection_widget.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/funding_progress_card.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/quick_actions_grid.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/global_footprint_map.dart';
import 'package:athlink/features/athlete/profile/presentation/widgets/profile_primary_button.dart';

class AthleteProfileScreen extends ConsumerStatefulWidget {
  const AthleteProfileScreen({super.key});

  @override
  ConsumerState<AthleteProfileScreen> createState() =>
      _AthleteProfileScreenState();
}

class _AthleteProfileScreenState extends ConsumerState<AthleteProfileScreen> {
  bool _isEditing = false;

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localStorage = sl<LocalStorageService>();
      final user = localStorage.getUserData();
      if (user != null) {
        ref.read(athleteProfileProvider.notifier).getProfile(user.id);
      }
    });
  }

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
    final state = ref.watch(athleteProfileProvider);
    //  final hasNoData=state.maybeWhen(hasNoData: ()=>true,orElse: ()=>false);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: state.when(
          loading: () {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ],
            );
          },
          loaded: (profile) {
            if (!_isEditing) {
              _nameController.text = profile.name;
              _locationController.text = profile.location;
              _bioController.text = profile.bio;
            }
            return Column(
              children: [
                ProfileHeader(
                  isEditing: _isEditing,
                  onPickImage: _handleImageUpload,
                  localImage: _profileImage,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                             _isEditing
                    ? ProfileEditSection(
                        nameController: _nameController,
                        locationController: _locationController,
                        bioController: _bioController,
                      )
                    : ProfileDisplaySection(
                        profile: profile,
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
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            );
          },
          error: (error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Something went wrong: $error",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          hasNoData: () {
            return Column(
              children: [
                ProfileHeader(
                  isEditing: true,
                  onPickImage: _handleImageUpload,
                  localImage: _profileImage,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProfileEditSection(
                    nameController: _nameController,
                    locationController: _locationController,
                    bioController: _bioController,
                  ),
                ),

                _buildEditActions(),
              ],
            );
          },
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
              onTap: () {
                final localStorage = sl<LocalStorageService>();
                final user = localStorage.getUserData();
                if (user != null) {
                  ref
                      .read(athleteProfileProvider.notifier)
                      .updateProfile(
                        athleteId: user.id,
                        data: {
                          "name": _nameController.text,
                          "location": _locationController.text,
                          "bio": _bioController.text,
                          // Add other fields as needed
                        },
                        profileImage: _profileImage,
                        onSuccess: () {
                          setState(() {
                            _isEditing = false;
                          });
                        },
                      );
                }
              },
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
