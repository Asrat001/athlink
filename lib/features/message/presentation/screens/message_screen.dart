import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _chatSearchController = TextEditingController();

  List<Map<String, dynamic>> _filteredContactsList = [];
  List<Map<String, dynamic>> _filteredAthleteChats = [];
  List<Map<String, dynamic>> _filteredSponsorChats = [];

  List<Map<String, dynamic>> athleteChats = [
    {
      "name": "Maria Ofteen",
      "message": "You : I was wondering if you can meet …",
      "time": "4h",
      "logo": "https://i.pravatar.cc/150?img=47",
      "unread": 0,
      "isOnline": true,
    },
    {
      "name": "Shreen Sali",
      "message": "Okay we will do that way.",
      "time": "6h",
      "logo": "https://i.pravatar.cc/150?img=12",
      "unread": 2,
      "isOnline": false,
    },
    {
      "name": "Daniel Kiros",
      "message": "Sure, I will send the files now.",
      "time": "1d",
      "logo": "https://i.pravatar.cc/150?img=33",
      "unread": 1,
      "isOnline": true,
    },
    {
      "name": "Selam Tesema",
      "message": "Thank you so much!",
      "time": "2d",
      "logo": "https://i.pravatar.cc/150?img=5",
      "unread": 0,
      "isOnline": false,
    },
  ];

  List<Map<String, dynamic>> sponsorChats = [
    {
      "name": "JJ Solutions",
      "message": "You : Thank you in advance!",
      "time": "4h",
      "logo":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Gold_coin_icon.png/600px-Gold_coin_icon.png",
      "unread": 0,
      "isOnline": false,
    },
    {
      "name": "Quartum PLC",
      "message": "We appreciate",
      "time": "6h",
      "logo": "https://cdn-icons-png.flaticon.com/512/1828/1828884.png",
      "unread": 2,
      "isOnline": false,
    },
  ];

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

    _filteredContactsList = contactsList;
    _filteredAthleteChats = athleteChats;
    _filteredSponsorChats = sponsorChats;

    _chatSearchController.addListener(_filterChatLists);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _chatSearchController.dispose();
    super.dispose();
  }

  void _filterChatLists() {
    final query = _chatSearchController.text.toLowerCase();
    setState(() {
      _filteredAthleteChats = athleteChats.where((chat) {
        final nameLower = chat["name"].toLowerCase();
        final messageLower = chat["message"].toLowerCase();
        return nameLower.contains(query) || messageLower.contains(query);
      }).toList();

      _filteredSponsorChats = sponsorChats.where((chat) {
        final nameLower = chat["name"].toLowerCase();
        final messageLower = chat["message"].toLowerCase();
        return nameLower.contains(query) || messageLower.contains(query);
      }).toList();
    });
  }

  bool _isEmpty(List list) => list.isEmpty;

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
                        "name": contact["name"],
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
                        title: contact["name"],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
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
                        _filterChatLists();
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
                children: [
                  _isEmpty(_filteredAthleteChats)
                      ? _buildEmptyState()
                      : _buildChatList(_filteredAthleteChats),
                  _isEmpty(_filteredSponsorChats)
                      ? _buildEmptyState()
                      : _buildChatList(_filteredSponsorChats),
                ],
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

  Widget _buildEmptyState() {
    return Center(
      child: CustomText(
        title: "No messages here yet...",
        textColor: AppColors.grey600,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
    );
  }

  Widget _buildChatList(List chats) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        return InkWell(
          onTap: () {
            context.push(
              Routes.chatDetailRouteName,
              extra: {
                "name": chat["name"],
                "logo": chat["logo"],
                "isOnline": chat["isOnline"] ?? "unknown",
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: index % 2 == 1
                  ? AppColors.extraLightGrey.withValues(alpha: 0.3)
                  : AppColors.transparent,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.extraLightGrey,
                  backgroundImage: NetworkImage(chat["logo"]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: chat["name"],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 3),
                      CustomText(
                        title: chat["message"],
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.grey600,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CustomText(
                      title: chat["time"],
                      fontSize: 12,
                      textColor: AppColors.grey600,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 4),
                    if (chat["unread"] > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.green,
                        ),
                        child: CustomText(
                          title: chat["unread"].toString(),
                          fontSize: 12,
                          textColor: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
