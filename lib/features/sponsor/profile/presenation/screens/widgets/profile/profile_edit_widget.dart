import 'dart:io';
import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/profile/profile_edit_page.dart';
import 'package:flutter/material.dart';

class ProfileEditWidget extends StatelessWidget {
  final SponsorProfile? sponsorProfile;
  final File? profileImage;
  final File? bannerImage;
  final Function(
    String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
    String? websiteUrl,
    Map<String, String>? socialLinks,
  )
  onSave;
  final bool isLoading;

  const ProfileEditWidget({
    super.key,
    this.sponsorProfile,
    this.profileImage,
    this.bannerImage,
    required this.onSave,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileEditPage(
      sponsorProfile: sponsorProfile,
      profileImage: profileImage,
      bannerImage: bannerImage,
      onSave: onSave,
      isLoading: isLoading,
    );
  }
}
