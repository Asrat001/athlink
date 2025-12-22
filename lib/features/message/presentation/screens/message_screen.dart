import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/widgets/chat_list_widget.dart';
import 'package:athlink/features/message/presentation/widgets/search_bar.dart';
import 'package:athlink/features/message/presentation/widgets/select_athlets_sheet.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _chatSearchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(conversationProvider.notifier).getConversations();
    });
    // _chatSearchController.addListener(_filterChatLists);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _chatSearchController.dispose();
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
            return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
                void handleFilter(String query) {
                  // final lowerQuery = query.toLowerCase();
                  // // setModalState(() {
                  // //   _filteredContactsList = contactsList.where((contact) {
                  // //     final nameLower = contact["name"].toLowerCase();
                  // //     return nameLower.contains(lowerQuery);
                  // //   }).toList();
                  // // });
                }

                return SelectAthletsSheet(
                  scrollController: scrollController,
                  onSearchChanged: handleFilter,
                );
              },
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: SvgPicture.asset("assets/images/chat-add.svg"),
        onPressed: () {
          _showNewChatModal();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ChatSearchBar(
                      hint: "Search message",
                      controller: _chatSearchController,
                      onChanged: (value) {
                        // _filterChatLists();
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.notifications_none,
                    color: AppColors.grey600,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildTabs(),
            const Divider(height: 1, color: AppColors.extraLightGrey),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [ChatListWidget(), ChatListWidget()],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildTabs() {

    return TabBar(
      controller: _tabController,
      indicatorColor: AppColors.transparent,
      indicatorWeight: 2,
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey600.withValues(alpha: .5),
      labelPadding: const EdgeInsets.symmetric(horizontal: 20),
      tabs: [
        Tab(
          child: Text(
            "Athlete",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Tab(
          child: Text(
            "Sponsor",
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
