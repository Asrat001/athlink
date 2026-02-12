import 'package:athlink/features/sponsor/profile/presenation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class ViewSponsorProfileScreen extends StatelessWidget {
  final String sponsorId;

  const ViewSponsorProfileScreen({super.key, required this.sponsorId});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(sponsorId: sponsorId, isSelf: false);
  }
}
