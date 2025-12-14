import 'dart:io';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String? bannerImageUrl;
  final String? profileImageUrl;
  final File? bannerImage;
  final File? profileImage;
  final bool isEditMode;
  final VoidCallback onEditToggle;
  final VoidCallback onLogout;
  final VoidCallback onBannerPick;
  final VoidCallback onProfilePick;

  const ProfileHeaderWidget({
    super.key,
    this.bannerImageUrl,
    this.profileImageUrl,
    this.bannerImage,
    this.profileImage,
    required this.isEditMode,
    required this.onEditToggle,
    required this.onLogout,
    required this.onBannerPick,
    required this.onProfilePick,
  });

  @override
  Widget build(BuildContext context) {
    const double bannerHeight = 250;
    const double logoCircleRadius = 50;

    final String fullBannerUrl = UrlHelper.getFullImageUrl(bannerImageUrl);
    final String fullProfileUrl = UrlHelper.getFullImageUrl(profileImageUrl);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Background Banner
        Container(
          height: bannerHeight,
          decoration: const BoxDecoration(color: AppColors.extraLightGrey),
        ),

        // Banner Image
        Positioned.fill(
          child: Opacity(
            opacity: 0.9,
            child: InkWell(
              onTap: isEditMode ? onBannerPick : null,
              child: _buildBannerImage(fullBannerUrl),
            ),
          ),
        ),

        // Edit Button
        Positioned(bottom: 5, right: 20, child: _buildEditButton()),

        // Logout Button
        Positioned(top: 50, right: 20, child: _buildLogoutButton()),

        // Play Button (optional)
        Positioned(bottom: 110, child: _buildPlayButton()),

        // Profile Picture
        Positioned(
          bottom: -15,
          child: _buildProfilePicture(
            fullProfileUrl,
            logoCircleRadius,
            isEditMode,
          ),
        ),
      ],
    );
  }

  Widget _buildBannerImage(String fullBannerUrl) {
    if (bannerImage != null) {
      return Image.file(
        bannerImage!,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      );
    }

    if (fullBannerUrl.isNotEmpty) {
      return Image.network(
        fullBannerUrl,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorBuilder: (context, error, stackTrace) {
          return Container(color: AppColors.extraLightGrey);
        },
      );
    }

    return Container(color: AppColors.extraLightGrey);
  }

  Widget _buildEditButton() {
    return InkWell(
      onTap: onEditToggle,
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        child: SvgPicture.asset(
          "assets/images/edit.svg",
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return InkWell(
      onTap: onLogout,
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        child: Icon(Icons.logout, color: AppColors.black),
      ),
    );
  }

  Widget _buildPlayButton() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.7),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.play_arrow, color: AppColors.black, size: 20),
    );
  }

  Widget _buildProfilePicture(
    String fullProfileUrl,
    double logoCircleRadius,
    bool isEditMode,
  ) {
    return Container(
      width: logoCircleRadius * 2,
      height: logoCircleRadius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(color: AppColors.white, width: 7),
        boxShadow: const [
          BoxShadow(
            color: AppColors.textGrey,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(logoCircleRadius),
        child: InkWell(
          onTap: isEditMode ? onProfilePick : null,
          child: _buildProfileImage(fullProfileUrl, logoCircleRadius),
        ),
      ),
    );
  }

  Widget _buildProfileImage(String fullProfileUrl, double logoCircleRadius) {
    if (profileImage != null) {
      return Image.file(
        profileImage!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage(logoCircleRadius);
        },
      );
    }

    if (fullProfileUrl.isNotEmpty) {
      return Image.network(
        fullProfileUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage(logoCircleRadius);
        },
      );
    }

    return Image.asset('assets/images/on1.jpg', fit: BoxFit.cover);
  }

  Widget _buildPlaceholderImage(double logoCircleRadius) {
    return Container(
      color: AppColors.extraLightGrey,
      child: Icon(Icons.person, size: 40, color: AppColors.grey),
    );
  }
}
