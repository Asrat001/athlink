import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  void _onItemTapped(BuildContext context, int index) {
    if (index == 2) {
      // 👇 Handle the "Create" action differently
      _showCreateBottomSheet(context);
    } else {
      // Navigate normally for other tabs
      int branchIndex = index > 2 ? index - 1 : index;
      navigationShell.goBranch(
        branchIndex,
        initialLocation: index == navigationShell.currentIndex,
      );
    }
  }

  int _bottomNavIndexFromBranch(int branchIndex) {
    if (branchIndex >= 2) {
      // branchIndex 2 → Watchlist (BottomNav 3)
      // branchIndex 3 → Profile (BottomNav 4)
      return branchIndex + 1;
    }
    return branchIndex;
  }

  void _showCreateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.post_add),
              title: const Text('Create Post'),
              onTap: () {
                Navigator.pop(context);
                // do something here
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_call),
              title: const Text('Upload Video'),
              onTap: () {
                Navigator.pop(context);
                // do something else
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(canPop: false, child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndexFromBranch(navigationShell.currentIndex),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _onItemTapped(context, index),
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset("assets/logos/home.svg"),
            activeIcon: SvgPicture.asset(
              "assets/logos/home.svg",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Manage',
            icon: SvgPicture.asset("assets/logos/setting.svg"),
            activeIcon: SvgPicture.asset(
              "assets/logos/setting.svg",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset("assets/logos/create.svg"),
            activeIcon: SvgPicture.asset(
              "assets/logos/create.svg",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Watchlist',
            icon: SvgPicture.asset("assets/logos/watchlist.svg"),
            activeIcon: SvgPicture.asset(
              "assets/logos/watchlist.svg",
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SvgPicture.asset("assets/logos/account.svg"),
            activeIcon: SvgPicture.asset(
              "assets/logos/account.svg",
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
