import 'package:athlink/features/message/domain/models/chat_message.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatCardProposal extends StatelessWidget {
  final ChatMessage message;

  const ChatCardProposal({super.key, required this.message});

  void _showProposalDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ProposalDetailBottomSheet(
          title: message.proposalTitle ?? "Proposal Deal",
          logoUrl: message.proposalLogo ?? "",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: message.fromMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Align(
            alignment: message.fromMe
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => _showProposalDetails(context),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.86,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: AppColors.greyBackground,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: message.proposalTitle ?? 'Proposal',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(height: 6),
                          CustomText(
                            title: message.proposalSubtitle ?? 'View detail',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.grey600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          if (message.time != null)
            Padding(
              padding: EdgeInsets.only(
                left: message.fromMe ? 0 : 6,
                right: message.fromMe ? 6 : 0,
                bottom: 6,
              ),
              child: CustomText(
                title: message.time!,
                fontSize: 11,
                fontWeight: FontWeight.w400,
                textColor: AppColors.grey600,
              ),
            ),
        ],
      ),
    );
  }
}

class ProposalDetailBottomSheet extends StatelessWidget {
  final String title;
  final String logoUrl;

  const ProposalDetailBottomSheet({
    super.key,
    required this.title,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/images/logo.png"),
                backgroundColor: AppColors.greyBackground,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: "SP Sport Agency",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.black,
                  ),
                  const SizedBox(height: 2),
                  CustomText(
                    title: "Los Angeles, CA",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    textColor: AppColors.grey600,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          CustomText(
            title: title,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: AppColors.darkBlue,
          ),
          const SizedBox(height: 12),

          Text(
            "Track and field athletes aged 18 - 21, with social media presence. This is a full time job for 6 months.",
            style: GoogleFonts.inter(
              fontSize: 14,
              height: 1.5,
              color: AppColors.grey600,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              SizedBox(
                width: 100,
                child: CustomText(
                  title: "Payment",
                  fontSize: 14,
                  textColor: AppColors.grey600,
                ),
              ),
              CustomText(
                title: "500\$",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                textColor: AppColors.grey600,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: CustomText(
                  title: "Time line",
                  fontSize: 14,
                  textColor: AppColors.grey600,
                ),
              ),
              CustomText(
                title: "6 months",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                textColor: AppColors.grey600,
              ),
            ],
          ),
          const SizedBox(height: 32),

          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}
