import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/message/presentation/providers/conversation_filter.dart';
import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/widgets/chat_list_widget.dart';
import 'package:athlink/features/message/presentation/widgets/search_bar.dart';
import 'package:athlink/features/message/presentation/widgets/select_athlets_sheet.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends ConsumerStatefulWidget {
  const MessageScreen({super.key});

  @override
  ConsumerState<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _chatSearchController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(conversationProvider.notifier).getConversations();
      final user = sl<LocalStorageService>().getUserData();
      if (user?.role?.contains("sponsor") ?? false) {
        final sponsorId = user?.id;
        if (sponsorId != null) {
          ref.read(profileProvider(sponsorId).notifier).getProfile(sponsorId);
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _chatSearchController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showNewChatModal() {
    _searchController.clear();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      useSafeArea: false,
      backgroundColor: AppColors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return SelectAthletsSheet(
              isAthlet: true,
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = sl<LocalStorageService>().getUserData();
    final isAthlet = user?.role?.contains("athlet") ?? false;
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        backgroundColor: isAthlet ? Colors.black : AppColors.white,
        systemOverlayStyle: isAthlet
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
      backgroundColor: isAthlet ? Colors.black : AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isAthlet ? Colors.black : AppColors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(bottom: 24, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Chat",
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: isAthlet ? Colors.white : AppColors.black,
                          ),
                        ),
                        _buildNotificationIcon(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ChatSearchBar(
                      hint: "Search message",
                      isAthlet: isAthlet,
                      controller: _chatSearchController,

                      onChanged: (query) {
                        ref.read(searchQueryProvider.notifier).state = query;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isAthlet ? Colors.black : AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              indicatorColor: isAthlet
                                  ? Colors.white
                                  : AppColors.primary,
                              indicatorWeight: 3,
                              labelColor: isAthlet
                                  ? Colors.white
                                  : AppColors.black,
                              unselectedLabelColor: AppColors.grey,
                              labelStyle: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              dividerColor: AppColors.transparent,
                              tabAlignment: TabAlignment.start,
                              tabs: const [
                                Tab(text: "All"),
                                Tab(text: "Sponsors"),
                                Tab(text: "Athletes"),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: _showNewChatModal,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isAthlet
                                      ? Colors.white
                                      : AppColors.grey600.withValues(alpha: .3),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                "assets/images/chat-add.svg",
                                colorFilter: ColorFilter.mode(
                                  isAthlet ? Colors.white : AppColors.black,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors
                          .lightBackground, // Replaced Color(0xFFF5F5F5)
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ChatListWidget(
                            filter: ConversationFilter.all,
                            searchQuery: searchQuery,
                          ),
                          ChatListWidget(
                            filter: ConversationFilter.sponsors,
                            searchQuery: searchQuery,
                          ),
                          ChatListWidget(
                            filter: ConversationFilter.athletes,
                            searchQuery: searchQuery,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.grey600.withValues(alpha: .3),
          width: 1.5,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.notifications_none, color: AppColors.black),
          Positioned(
            right: 2,
            top: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.red,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
