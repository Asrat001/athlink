import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AthleteMainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AthleteMainScreen({super.key, required this.navigationShell});

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody allows the body to flow behind the navigation bar
      // This is essential for the modern "floating" look
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          // Making the system nav bar transparent so it doesn't block our design
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      body: PopScope(canPop: false, child: navigationShell),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return SafeArea(
      // bottom: true ensures it respects the iOS/Android home indicator height
      bottom: true,
      child: Container(
        height: 64,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF121212), // Dark mode surface color
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.08),
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, "assets/logos/home.svg"),
            _buildNavItem(1, "assets/logos/setting.svg"),
            _buildNavItem(2, "assets/logos/chat.svg"),
            _buildNavItem(3, "assets/logos/campaign.svg"),
            _buildNavItem(4, "assets/logos/account.svg"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath) {
    final bool isSelected = navigationShell.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 22,
              width: 22,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : const Color(0xFF8E8E93),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
