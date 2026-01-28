
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatHeader extends StatelessWidget {
  final String name;
  final bool isOnline;
  final bool isAthlet;
  final String logo;
  final GlobalKey meetIconKey;
  final VoidCallback onMeetPressed;

  const ChatHeader({
    super.key,
    required this.name,
    required this.isOnline,
    required this.logo,
    required this.meetIconKey,
    required this.onMeetPressed,
     required this.isAthlet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon:  Icon(Icons.arrow_back, color:isAthlet?Colors.white: AppColors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          Stack(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(logo),
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: name,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textColor:isAthlet?Colors.white: AppColors.black,
                ),
                const SizedBox(height: 2),
                CustomText(
                  title: isOnline ? "Active" : "Offline",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.grey600,
                ),
              ],
            ),
          ),
          InkWell(
            key: meetIconKey,
            onTap: onMeetPressed,
            child: SvgPicture.asset("assets/images/google-meet.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: AppColors.grey600),
          ),
        ],
      ),
    );
  }
}