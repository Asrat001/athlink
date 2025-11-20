import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatCardGoogleMeet extends StatelessWidget {
  final ChatMessage message;

  const ChatCardGoogleMeet({super.key, required this.message});

  void _launchGoogleMeet(String meetLink) async {
    final Uri url = Uri.parse(meetLink);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final isMe = message.fromMe;
    return Padding(
      padding: EdgeInsets.only(
        left: isMe ? 60 : 12,
        right: isMe ? 12 : 60,
        top: 10,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              if (message.meetLink != null) {
                _launchGoogleMeet(message.meetLink!);
              }
            },
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.72,
              ),
              child: RichText(
                text: TextSpan(
                  text: message.meetLink ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              if (message.meetLink != null) {
                _launchGoogleMeet(message.meetLink!);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.72,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                    ),
                    child: Container(
                      width: 110,
                      height: 68,
                      color: AppColors.lightBackground,
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/google-meet.svg",
                          height: 36,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Meet",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 6),
                          CustomText(
                            title: message.meetLink ?? '',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.grey600,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          CustomText(
            title: message.time ?? '',
            fontSize: 11,
            fontWeight: FontWeight.w400,
            textColor: AppColors.grey600,
          ),
        ],
      ),
    );
  }
}
