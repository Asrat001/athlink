import 'dart:io';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/athlete_profile_provider.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/athlete_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  File? _coverImage;
  final ImagePicker _picker = ImagePicker();

  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    _fetchProfile();
  }

  void _fetchProfile() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = sl<LocalStorageService>().getUserData();
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

  Future<void> _handleImageUpload({required bool isCover}) async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() {
        if (isCover) {
          _coverImage = File(picked.path);
        } else {
          _profileImage = File(picked.path);
        }
      });
    }
  }

  void _toggleEdit() {
    if (_isEditing) {
      setState(() {
        _profileImage = null;
        _coverImage = null;
      });
    }
    setState(() => _isEditing = !_isEditing);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(athleteProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: state.when(
          loading: () => const SizedBox(
            height: 600,
            child: Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
          error: (e) => Center(
            child: Text(
              e.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          hasNoData: () => _buildScreenContent(isInitial: true),
          loaded: (profile) {
            if (!_isEditing) {
              _nameController.text = profile.name;
              _locationController.text = profile.location;
              _bioController.text = profile.bio;
            }
            return _buildScreenContent(profile: profile);
          },
        ),
      ),
    );
  }

  Widget _buildScreenContent({dynamic profile, bool isInitial = false}) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        SizedBox(height: statusBarHeight),
        ProfileHeader(
          isEditing: _isEditing || isInitial,
          onPickImage: () => _handleImageUpload(isCover: false),
          onPickCover: () => _handleImageUpload(isCover: true),
          localImage: _profileImage,
          localCoverImage: _coverImage,
          remoteImageUrl: profile?.profilePhoto ?? "",
          remoteCoverUrl: profile?.coverPhoto ?? "",
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              (_isEditing || isInitial)
                  ? ProfileEditSection(
                      nameController: _nameController,
                      locationController: _locationController,
                      bioController: _bioController,
                    )
                  : ProfileDisplaySection(
                      profile: profile,
                      onEditToggle: _toggleEdit,
                    ),
              if (!_isEditing && !isInitial) ...[
                const InstagramConnectSection(),
                const SizedBox(height: 32),
                const FundingProgressCard(),
                const SizedBox(height: 24),
                const QuickActionsGrid(),
                const SizedBox(height: 32),
                const GlobalFootprintMap(),
              ],
              if (_isEditing || isInitial) _buildEditActions(),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
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
              color: AppColors.darkGreyCard,
              onTap: () {
                final user = sl<LocalStorageService>().getUserData();
                if (user != null) {
                  ref
                      .read(athleteProfileProvider.notifier)
                      .updateProfile(
                        athleteId: user.id,
                        data: {
                          "name": _nameController.text,
                          "location": _locationController.text,
                          "bio": _bioController.text,
                        },
                        profileImage: _profileImage,
                        coverImage: _coverImage,
                        onSuccess: () {
                          setState(() {
                            _isEditing = false;
                            _profileImage = null;
                            _coverImage = null;
                          });
                        },
                      );
                }
              },
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ProfilePrimaryButton(
              label: "Cancel",
              isBordered: true,
              color: AppColors.transparent,
              onTap: _toggleEdit,
            ),
          ),
        ],
      ),
    );
  }
}
