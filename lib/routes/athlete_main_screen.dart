import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/core/services/socket_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/athlete_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AthleteMainScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;
  const AthleteMainScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<AthleteMainScreen> createState() => _AthleteMainScreenState();
}

class _AthleteMainScreenState extends ConsumerState<AthleteMainScreen> {

  @override
  void initState() {
    super.initState();
    _initializeSocket();
    _fetchProfile();
  }

  void _initializeSocket() async {
    final token = await sl<LocalStorageService>().getAccessToken();
    if (token != null && token.isNotEmpty) {
      sl<SocketIoService>().initConnection(token);
    }
  }

  void _fetchProfile() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loggedInUser = sl<LocalStorageService>().getUserData();
      final targetId =  loggedInUser?.id;
      if (targetId != null) {
        ref.read(athleteProfileProvider.notifier).getProfile(targetId);
      }
    });
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
        ),
      ),
      body: PopScope(canPop: false, child: widget.navigationShell),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    final bool isSelected = widget.navigationShell.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.12)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              iconPath,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : const Color(0xFF757575),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
