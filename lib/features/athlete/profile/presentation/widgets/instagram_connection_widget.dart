import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

class InstagramConnectSection extends StatefulWidget {
  const InstagramConnectSection({super.key});

  @override
  State<InstagramConnectSection> createState() =>
      _InstagramConnectSectionState();
}

class _InstagramConnectSectionState extends State<InstagramConnectSection> {
  bool isConnected = false;

  void _showLogoutSheet() {
    HapticFeedback.heavyImpact();
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: AppColors.darkGreyCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.lightGrey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            const CustomText(
              title: 'Disconnect Instagram?',
              fontSize: 20,
              textColor: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),
            const CustomText(
              title:
                  'Sponsors won\'t be able to see your latest highlights until you reconnect.',
              fontSize: 14,
              textColor: AppColors.lightGrey,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() => isConnected = false);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red.withValues(alpha: 0.1),
                foregroundColor: AppColors.red,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: AppColors.red, width: 0.5),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const CustomText(
                title: 'Cancel',
                textColor: AppColors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          if (!isConnected) ...[
            const CustomText(
              title: 'Link your Instagram account',
              fontSize: 18,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 6),
            const CustomText(
              title: 'Show your highlights and build trust with sponsors.',
              fontSize: 13,
              textColor: AppColors.lightGrey,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 16),
          ],
          isConnected ? _buildInstagramProfileCard() : _buildConnectButton(),
        ],
      ),
    );
  }

  Widget _buildConnectButton() {
    return ElevatedButton(
      onPressed: () => setState(() => isConnected = true),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkGreyCard,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.divider, width: 0.1),
        ),
      ),
      child: const CustomText(
        title: 'Connect',
        textColor: AppColors.white,
        fontSize: 14,
      ),
    );
  }

  Widget _buildInstagramProfileCard() {
    return GestureDetector(
      onLongPress: _showLogoutSheet,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.darkGreyCard,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Using a Hero-like circle for the Instagram icon
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.orangeGradientStart,
                    AppColors.orangeGradientEnd,
                  ],
                ),
              ),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.black,
                child: Image.asset(
                  'assets/images/instagram.png',
                  width: 28,
                  height: 28,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomText(
                  title: 'Maria M.',
                  fontSize: 22,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  title: '11k followers',
                  fontSize: 14,
                  textColor: AppColors.lightGrey,
                ),
              ],
            ),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStatRow(Icons.favorite, AppColors.red, '3k', 'likes'),
                const SizedBox(height: 6),
                _buildStatRow(
                  Icons.grid_view_rounded,
                  AppColors.blue,
                  '2109',
                  'posts',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(IconData icon, Color color, String count, String label) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        CustomText(
          title: '$count ',
          fontSize: 16,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        CustomText(title: label, fontSize: 12, textColor: AppColors.lightGrey),
      ],
    );
  }
}
