import 'package:athlink/features/message/presentation/widgets/search_bar.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAthletsSheet extends StatelessWidget {
  const SelectAthletsSheet({
    super.key,
    required this.scrollController,
    required this.onSearchChanged,
  });

  final ScrollController scrollController;
  final Function(String) onSearchChanged;




  @override
  Widget build(BuildContext context) {

    TextEditingController _searchController = TextEditingController();


  List<Map<String, dynamic>> _filteredContactsList = [
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






    return   Container(
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
            child: ChatSearchBar(
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
                    // Navigator.pop(context);

                    // context.push(
                    //   Routes.chatDetailRouteName,
                    //   extra: {
                    //     "name":
                    //         contact["name"] ??
                    //         contact["sponsorProfile"]?["name"] ??
                    //         contact["athleteProfile"]?["name"] ??
                    //         "Unknown",
                    //     "logo": contact["logo"],
                    //     "isOnline": false,
                    //   },
                    // );
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
}