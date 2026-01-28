import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/core/services/socket_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    _initializeSocket();
  }

  void _initializeSocket() async {
    final token = await sl<LocalStorageService>().getAccessToken();
    if (token != null && token.isNotEmpty) {
      sl<SocketIoService>().initConnection(token);
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(canPop: false, child: widget.navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
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
            label: 'Message',
            icon: SvgPicture.asset("assets/logos/chat.svg"),
            activeIcon: SvgPicture.asset(
              "assets/logos/chat.svg",
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
