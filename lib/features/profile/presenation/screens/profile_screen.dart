import 'dart:io';

import 'package:athlink/di.dart';
import 'package:athlink/features/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/profile/profile_edit_widget.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/profile/profile_header.dart';
import 'package:athlink/features/profile/presenation/screens/widgets/profile/profile_view_widget.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

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

  void _loadProfileData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileProvider.notifier).getProfile();
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
  ) async {
    final success = await ref
        .read(profileProvider.notifier)
        .updateSponsorProfile(
          name: name,
          description: description,
          address: address,
          profileImage: profileImage,
          bannerImage: bannerImage,
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
        final errorMessage =
            ref.read(profileProvider).errorMessage ??
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
    final profileState = ref.watch(profileProvider);
    final profileUser = profileState.profileUser;
    final sponsorProfile = profileUser?.sponsorProfile;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: profileState.isLoading && profileUser == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProfileHeaderWidget(
                    bannerImageUrl: sponsorProfile?.bannerImageUrl,
                    profileImageUrl: sponsorProfile?.profileImageUrl,
                    bannerImage: _bannerImage,
                    profileImage: _profileImage,
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
                        )
                      : ProfileViewWidget(sponsorProfile: sponsorProfile),
                  PostFeedSection(
                    jobPosts: sponsorProfile?.jobPosts,
                    sponsorProfile: sponsorProfile,
                    profileUser: profileUser,
                  ),
                ],
              ),
            ),
    );
  }
}
