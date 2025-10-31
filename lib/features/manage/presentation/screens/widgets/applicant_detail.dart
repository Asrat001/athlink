import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ApplicantDetail extends StatelessWidget {
  final Map<String, dynamic> applicantData;

  const ApplicantDetail({super.key, required this.applicantData});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final overlayHeight = screenHeight * 0.7;

    return Scaffold(
      backgroundColor: AppColors.black.withValues(alpha: 0.2),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: overlayHeight,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child:
                    applicantData["image"] != null &&
                        applicantData["image"]!.isNotEmpty
                    ? Image.network(applicantData["image"]!, fit: BoxFit.cover)
                    : Image.asset(
                        "assets/images/athlete.png",
                        fit: BoxFit.cover,
                      ),
              ),

              // Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.grey600.withValues(alpha: 0.9),
                        AppColors.grey600.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // Fixed Header Section
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: CircleAvatar(
                              backgroundColor: AppColors.grey600,
                              child: SvgPicture.asset(
                                "assets/images/close.svg",
                                height: 20,
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                  AppColors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ClipOval(
                            child: Image.asset(
                              "assets/images/flag.png",
                              height: 55,
                              width: 55,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.lightGreen.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CustomText(
                          title: "Available for \nsponsorship",
                          textColor: AppColors.lightGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Scrollable Content
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                bottom: 0,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),

                        // Dynamic Name and Club
                        CustomText(
                          title: applicantData["name"] ?? "Unknown Athlete",
                          textColor: AppColors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          title: applicantData["club"] ?? "No Club",
                          textColor: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),

                        const SizedBox(height: 20),

                        _infoText("Age : ${applicantData["age"] ?? "N/A"}"),

                        _infoText("Position : Wide Receiver"),
                        _infoText("Category : Flag Football"),
                        _infoText("Level : Semi-pro"),
                        _infoText("Training : 20 hours/week"),

                        // Rating Info
                        _infoText(
                          "Achievements: State champion \n2023, MVP Nominee",
                        ),

                        const SizedBox(height: 40),

                        RoundedButton(
                          label: "Send Proposal",
                          onPressed: () {},
                          height: 60,
                          borderRadius: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoText(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.only(bottom: 4),
      child: CustomText(
        title: text,
        textColor: AppColors.white.withValues(alpha: 0.6),
        fontSize: 14,
      ),
    );
  }
}
