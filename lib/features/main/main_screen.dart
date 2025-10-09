import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PopScope(
        canPop: false,
        child: navigationShell,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Explore',
            icon: SvgPicture.asset("assets/images/home.svg", color: Colors.grey.shade300),
            activeIcon: SvgPicture.asset("assets/images/home.svg", color: AppColors.primary),
          ),
          BottomNavigationBarItem(
            label: 'Radios',
            icon: SvgPicture.asset("assets/images/radio.svg", color: Colors.grey.shade300),
            activeIcon: SvgPicture.asset("assets/images/radio.svg", color: AppColors.primary),
          ),
          BottomNavigationBarItem(
            label: 'Kids',
            icon: SvgPicture.asset("assets/images/kids.svg", color: Colors.grey.shade300),
            activeIcon: SvgPicture.asset("assets/images/kids.svg", color: AppColors.primary),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: SvgPicture.asset("assets/images/search.svg", color: Colors.grey.shade300),
            activeIcon: SvgPicture.asset("assets/images/search.svg", color: AppColors.primary),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SvgPicture.asset("assets/images/account.svg", color: Colors.grey.shade300),
            activeIcon: SvgPicture.asset("assets/images/account.svg", color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}