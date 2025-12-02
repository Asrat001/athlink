import 'package:athlink/features/message/presentation/providers/providers.dart';
import 'package:athlink/features/message/presentation/widgets/chat_list_widget.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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

  List<Map<String, dynamic>> _filteredContactsList = [];

  List<Map<String, dynamic>> contactsList = [
    {"name": "Maria Queen", "logo": "https://i.pravatar.cc/150?img=51"},
    {"name": "John Doe", "logo": "https://i.pravatar.cc/150?img=6"},
    {"name": "Alice Smith", "logo": "https://i.pravatar.cc/150?img=17"},
    {"name": "Bob Johnson", "logo": "https://i.pravatar.cc/150?img=30"},
    {"name": "Sarah Lee", "logo": "https://i.pravatar.cc/150?img=43"},
    {"name": "David Kim", "logo": "https://i.pravatar.cc/150?img=55"},
    {"name": "Emily Chen", "logo": "https://i.pravatar.cc/150?img=11"},
    {"name": "Chris Brown", "logo": "https://i.pravatar.cc/150?img=26"},
    {"name": "Olivia White", "logo": "https://i.pravatar.cc/150?img=38"},
    {"name": "Maria Queen", "logo": "https://i.pravatar.cc/150?img=51"},
    {"name": "John Doe", "logo": "https://i.pravatar.cc/150?img=6"},
    {"name": "Alice Smith", "logo": "https://i.pravatar.cc/150?img=17"},
    {"name": "Bob Johnson", "logo": "https://i.pravatar.cc/150?img=30"},
  ];

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
    _filteredContactsList = contactsList;

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
                  final lowerQuery = query.toLowerCase();
                  setModalState(() {
                    _filteredContactsList = contactsList.where((contact) {
                      final nameLower = contact["name"].toLowerCase();
                      return nameLower.contains(lowerQuery);
                    }).toList();
                  });
                }

                return _buildSelectAthleteSheet(
                  scrollController,
                  handleFilter,
                  context,
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildSelectAthleteSheet(
    ScrollController scrollController,
    Function(String) onSearchChanged,
    BuildContext context, // Accept context parameter
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.grey600.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          CustomText(
            title: "Select Athlete",
            fontSize: 18,
            fontWeight: FontWeight.w700,
            textColor: AppColors.black,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSearchBar(
              hint: "Search athlete",
              controller: _searchController,
              onChanged: onSearchChanged,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemCount: _filteredContactsList.length,
              itemBuilder: (context, index) {
                final contact = _filteredContactsList[index];
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    context.push(
                      Routes.chatDetailRouteName,
                      extra: {
                        "name":
                            contact["name"] ??
                            contact["sponsorProfile"]?["name"] ??
                            contact["athleteProfile"]?["name"] ??
                            "Unknown",
                        "logo": contact["logo"],
                        "isOnline": false,
                      },
                    );
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.extraLightGrey,
                        backgroundImage: NetworkImage(contact["logo"]),
                      ),
                      const SizedBox(height: 6),
                      CustomText(
                        title:
                            contact["name"] ??
                            contact["sponsorProfile"]?["name"] ??
                            contact["athleteProfile"]?["name"] ??
                            "Unknown",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
                    child: _buildSearchBar(
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

  Widget _buildSearchBar({
    String hint = "Search message",
    TextEditingController? controller,
    Function(String)? onChanged,
  }) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          SvgPicture.asset("assets/images/search.svg"),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: GoogleFonts.inter(fontSize: 14),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.grey600,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (hint != "Search message") const SizedBox(width: 12),
        ],
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
