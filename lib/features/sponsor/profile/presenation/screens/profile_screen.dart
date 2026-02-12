import 'dart:io';

import 'package:athlink/di.dart';
import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/profile/profile_edit_widget.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/profile/profile_header.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/profile/profile_view_widget.dart';
import 'package:athlink/shared/utils/name_helper.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  final String? sponsorId;
  final bool isSelf;

  const ProfileScreen({super.key, this.sponsorId, this.isSelf = true});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? _bannerImage;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  String? get _targetId {
    final loggedInUser = sl<LocalStorageService>().getUserData();
    return widget.sponsorId ?? loggedInUser?.id;
  }

  void _loadProfileData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final id = _targetId;
      if (id != null) {
        ref.read(profileProvider(id).notifier).getProfile(id);
      }
      ref.read(jobListProvider.notifier).fetchSponsoredAthletes();
    });
  }

  Future<void> _pickBannerImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _bannerImage = File(picked.path));
    }
  }

  Future<void> _pickProfileImage() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _profileImage = File(picked.path));
    }
  }

  Future<void> _handleProfileSave(
    String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
    String? websiteUrl,
    Map<String, String>? socialLinks,
  ) async {
    final id = _targetId;
    if (id == null) return;

    final success = await ref
        .read(profileProvider(id).notifier)
        .updateSponsorProfile(
          sponsorId: id,
          name: name,
          description: description,
          address: address,
          profileImage: profileImage,
          bannerImage: bannerImage,
          websiteUrl: websiteUrl,
          socialLinks: socialLinks,
        );

    if (success) {
      if (mounted) {
        setState(() {
          isEditMode = false;
          _profileImage = null;
          _bannerImage = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } else {
      if (mounted) {
        final id = _targetId;
        final errorMessage =
            (id != null
                ? ref.read(profileProvider(id)).errorMessage
                : 'Failed to update profile') ??
            'Failed to update profile';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _handleLogout() {
    final storageService = sl<LocalStorageService>();
    storageService.deleteAccessToken();
    storageService.deleteUserData();
    GoRouter.of(context).go(Routes.loginRouteName);
  }

  void _toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final id = _targetId;
    if (id == null) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Text("Profile not found")),
      );
    }

    final profileState = ref.watch(profileProvider(id));
    final profileUser = profileState.profileUser;
    final sponsorProfile = profileUser?.sponsorProfile;

    final sponsorName = NameHelper.getSponsorDisplayName(
      topLevelName: profileUser?.name,
      profileName: sponsorProfile?.name,
      email: profileUser?.email,
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: !widget.isSelf
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            )
          : null,
      extendBodyBehindAppBar: !widget.isSelf,
      body: profileState.isLoading && profileUser == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProfileHeaderWidget(
                    name: sponsorName,
                    bannerImageUrl: sponsorProfile?.bannerImageUrl,
                    profileImageUrl: sponsorProfile?.profileImageUrl,
                    bannerImage: _bannerImage,
                    profileImage: _profileImage,
                    isSelf: widget.isSelf,
                    isEditMode: isEditMode,
                    onEditToggle: _toggleEditMode,
                    onLogout: _handleLogout,
                    onBannerPick: _pickBannerImage,
                    onProfilePick: _pickProfileImage,
                  ),
                  isEditMode
                      ? ProfileEditWidget(
                          sponsorProfile: sponsorProfile,
                          profileImage: _profileImage,
                          bannerImage: _bannerImage,
                          onSave: _handleProfileSave,
                          isLoading: profileState.isLoading,
                        )
                      : ProfileViewWidget(
                          sponsorProfile: sponsorProfile,
                          displayName: sponsorName,
                        ),
                  PostFeedSection(
                    jobPosts: sponsorProfile?.jobPosts,
                    sponsorProfile: sponsorProfile,
                    profileUser: profileUser,
                    isSelf: widget.isSelf,
                  ),
                ],
              ),
            ),
    );
  }
}
