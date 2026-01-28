import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:athlink/shared/widgets/custom_text.dart';

class InstagramConnectSection extends StatefulWidget {
  final bool isSelf;
  final bool initiallyConnected;

  const InstagramConnectSection({
    super.key,
    this.isSelf = false,
    this.initiallyConnected = false,
  });

  @override
  State<InstagramConnectSection> createState() =>
      _InstagramConnectSectionState();
}

class _InstagramConnectSectionState extends State<InstagramConnectSection> {
  late bool isConnected;

  @override
  void initState() {
    super.initState();
    isConnected = widget.initiallyConnected;
  }

  void _showLogoutSheet() {
    if (!widget.isSelf) return;

    HapticFeedback.heavyImpact();
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
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
                color: AppColors.lightGrey.withAlpha((0.3 * 255).round()),
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
                backgroundColor: AppColors.red.withAlpha((0.1 * 255).round()),
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

          if (isConnected)
            _buildInstagramProfileCard()
          else ...[
            CustomText(
              title: widget.isSelf
                  ? 'Link your Instagram account'
                  : 'Instagram Not Connected',
              fontSize: 18,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 6),
            CustomText(
              title: widget.isSelf
                  ? 'Show your highlights and build trust with sponsors.'
                  : 'This athlete hasn\'t linked their Instagram profile yet.',
              fontSize: 13,
              textColor: AppColors.lightGrey,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),

            if (widget.isSelf) ...[
              const SizedBox(height: 16),
              _buildConnectButton(),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildConnectButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() => isConnected = true);
      },
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
      // Long press to disconnect is only available for the owner
      onLongPress: widget.isSelf ? _showLogoutSheet : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.darkGreyCard,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: AppColors.white.withAlpha((0.08 * 255).round()),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.camera_alt, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
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
