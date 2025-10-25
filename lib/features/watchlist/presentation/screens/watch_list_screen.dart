import 'package:athlink/features/watchlist/widgets/watchlist_athlete_card.dart';
import 'package:athlink/features/home_feed/widgets/filter_drop_downs.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen>
    with SingleTickerProviderStateMixin {
  bool isFilterOpen = false;
  int? activeActionIndex;
  String? activeActionType; // "delete" or "mute"

  final players = [
    {
      "name": "Mariya Osteen",
      "club": "NY Woman's Flag Football",
      "age": "21",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg",
      "image":
          "https://cdn3d.iconscout.com/3d/premium/thumb/fitness-woman-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--lady-girl-cartoon-character-illustrations-5652139.png",
    },
    {
      "name": "David Shuan",
      "club": "King Box Club",
      "age": "21",
      "flag":
          "https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg",
      "image":
          "https://cdn3d.iconscout.com/3d/premium/thumb/fitness-man-3d-illustration-download-in-png-blend-fbx-gltf-file-formats--male-boy-cartoon-character-illustrations-5652137.png",
    },
  ];

  void _handleAction(int index, String type) {
    setState(() {
      activeActionIndex = index;
      activeActionType = type;
    });
  }

  void _cancelAction() {
    setState(() {
      activeActionIndex = null;
      activeActionType = null;
    });
  }

  void _confirmAction(int index) async {
    final isDelete = activeActionType == "delete";

    if (isDelete) {
      // Animate fade out before removal
      setState(() {
        activeActionType = "deleting";
      });
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        players.removeAt(index);
        activeActionIndex = null;
        activeActionType = null;
      });
    } else {
      // Mute: just revert after delay
      setState(() {
        activeActionType = "muting";
      });
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        activeActionIndex = null;
        activeActionType = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),

            if (isFilterOpen)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterBar(
                  filters: [
                    FilterData("Hand Based", ["< 18", "18 – 21", "> 18"]),
                    FilterData("Foot Based", [
                      "Beginner",
                      "Intermediate",
                      "Advanced",
                    ]),
                    FilterData("Athletics", [
                      "FootBased",
                      "HandBased",
                      "Athletics",
                    ]),
                    FilterData("Netbased", [
                      "FootBased",
                      "HandBased",
                      "Athletics",
                    ]),
                  ],
                ),
              ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: List.generate(players.length, (index) {
                    final player = players[index];
                    final isActive = activeActionIndex == index;
                    final action = activeActionType;

                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder: (child, animation) {
                        final fadeAnimation = CurvedAnimation(
                          parent: animation,
                          curve: const Interval(
                            0.0,
                            1.0,
                            curve: Curves.easeInOutCubic,
                          ),
                        );

                        final slideAnimation =
                            Tween<Offset>(
                              begin: const Offset(0, 0.08),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: const Interval(
                                  0.15,
                                  1.0,
                                  curve: Curves.easeOutCubic,
                                ),
                              ),
                            );

                        final scaleAnimation =
                            Tween<double>(begin: 0.98, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutBack,
                              ),
                            );

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: SlideTransition(
                            position: slideAnimation,
                            child: ScaleTransition(
                              scale: scaleAnimation,
                              child: child,
                            ),
                          ),
                        );
                      },
                      child: isActive
                          ? _buildConfirmationCard(index, player, action)
                          : Padding(
                              key: ValueKey("card_$index"),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  extentRatio: 0.5,
                                  children: [
                                    SlidableAction(
                                      onPressed: (_) =>
                                          _handleAction(index, "mute"),
                                      // foregroundColor: AppColors.muteAction,
                                      // backgroundColor: AppColors.lightMute,
                                      icon: Icons.notifications_off_outlined,
                                    ),
                                    SlidableAction(
                                      onPressed: (_) =>
                                          _handleAction(index, "delete"),
                                      backgroundColor: AppColors.lightError,
                                      foregroundColor: AppColors.error,
                                      icon: Icons.delete_outline,
                                    ),
                                  ],
                                ),
                                child: WatchlistAthleteCard(
                                  key: ValueKey(player["name"]),
                                  name: player["name"]!,
                                  club: player["club"]!,
                                  age: player["age"]!,
                                  flag: player["flag"]!,
                                  image: player["image"]!,
                                ),
                              ),
                            ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------- HEADER --------------------------
  Widget _buildHeader() {
    return Container(
      color: AppColors.lightBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/search.svg',
                        color: AppColors.grey,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: AppColors.grey),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFilterOpen = !isFilterOpen;
                          });
                        },
                        child: SvgPicture.asset(
                          isFilterOpen
                              ? "assets/images/filter_filled.svg"
                              : "assets/images/filter.svg",
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              CustomText(
                title: "Watchlist Athletes",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textColor: AppColors.textPrimary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationCard(
    int index,
    Map<String, String> player,
    String? actionType,
  ) {
    final isDelete = actionType == "delete" || actionType == "deleting";
    final isMute = actionType == "mute" || actionType == "muting";

    final bgColor = isDelete ? AppColors.lightError : AppColors.lightMute;
    final textColor = isDelete ? AppColors.red : AppColors.muteAction;
    final icon = isDelete
        ? Icons.delete_outline
        : Icons.notifications_off_outlined;

    return AnimatedContainer(
      key: ValueKey("confirm_$index"),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 38, color: textColor),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: isDelete ? "Remove " : "Mute notifications from ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: player['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),
                TextSpan(
                  text: isDelete ? " from watchlist?" : "?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          CustomText(
            title: isDelete
                ? "You won't receive any updates about this athlete."
                : "You can unmute anytime from their profile.",
            fontSize: 13,
            fontWeight: FontWeight.w400,
            textColor: AppColors.textGrey,
          ),
          const SizedBox(height: 20),
          if (actionType != "deleting" && actionType != "muting")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _confirmAction(index),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: textColor,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(isDelete ? "Remove" : "Mute"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _cancelAction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonGrey,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text("Cancel"),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
