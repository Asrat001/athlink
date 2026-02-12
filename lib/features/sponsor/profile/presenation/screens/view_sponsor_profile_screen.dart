import 'package:athlink/features/sponsor/profile/presenation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ViewSponsorProfileScreen extends StatelessWidget {
  final String sponsorId;
  final bool isDarkMode;

  const ViewSponsorProfileScreen({
    super.key,
    required this.sponsorId,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      sponsorId: sponsorId,
      isSelf: false,
      isDarkMode: isDarkMode,
    );
  }
}
