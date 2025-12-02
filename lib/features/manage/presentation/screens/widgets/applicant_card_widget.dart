import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Applicant card widget for displaying athlete information
class ApplicantCardWidget extends ConsumerWidget {
  final JobApplication application;
  final String jobId;
  final bool isApplicant;
  final bool isAccepted;
  final bool hasInvitation;
  final Future<void> Function()? onAccept;
  final Future<void> Function()? onSendProposal;
  final VoidCallback onTap;

  const ApplicantCardWidget({
    super.key,
    required this.application,
    required this.jobId,
    required this.isApplicant,
    required this.isAccepted,
    required this.hasInvitation,
    this.onAccept,
    this.onSendProposal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final applicant = application.athlete;
    final athleteProfile = applicant.athleteProfile;
    final athleteName =
        athleteProfile?.name ?? applicant.name ?? 'Unknown Athlete';
    final age = athleteProfile?.age ?? 0;
    final rating = athleteProfile?.rating ?? 0.0;
    final position = athleteProfile?.position ?? '';
    final profileImageUrl = athleteProfile?.profileImageUrl;
    final countryFlag = athleteProfile?.countryFlag;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: AppColors.grey.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            // Main row
            Row(
              children: [
                // Athlete image
                _buildAthleteImage(profileImageUrl),

                // Content area
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 14,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: athleteName,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.white,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          title: position.isNotEmpty ? position : "Athlete",
                          fontSize: 12,
                          textColor: AppColors.white.withValues(alpha: .85),
                        ),
                        const SizedBox(height: 6),
                        CustomText(
                          title: 'Age : ${age > 0 ? age : 'N/A'}',
                          fontSize: 12,
                          textColor: AppColors.white.withValues(alpha: .85),
                        ),
                        const SizedBox(height: 8),

                        // Rating
                        _buildRating(rating, athleteProfile),

                        const SizedBox(height: 10),

                        // Action button
                        _buildActionButton(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Country flag overlay
            _buildCountryFlag(countryFlag),
          ],
        ),
      ),
    );
  }

  Widget _buildAthleteImage(String? profileImageUrl) {
    return SizedBox(
      width: 140,
      height: 170,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18),
          bottomLeft: Radius.circular(18),
        ),
        child: profileImageUrl != null && profileImageUrl.isNotEmpty
            ? Image.network(
                '$fileBaseUrl$profileImageUrl',
                fit: BoxFit.cover,
                height: 170,
                width: 140,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/athlete.png",
                    fit: BoxFit.cover,
                    height: 170,
                    width: 140,
                  );
                },
              )
            : Image.asset(
                "assets/images/athlete.png",
                fit: BoxFit.cover,
                height: 170,
                width: 140,
              ),
      ),
    );
  }

  Widget _buildRating(double rating, AthleteProfile? athleteProfile) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (i) => Icon(
              Icons.star,
              size: 16,
              color: i < rating.floor()
                  ? AppColors.amber
                  : AppColors.amber.withValues(alpha: 0.3),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CustomText(
          title: '(${athleteProfile?.achievements.length ?? 0})',
          fontSize: 12,
          textColor: AppColors.white,
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return RoundedButton(
      label: isAccepted
          ? 'Accepted'
          : isApplicant
          ? 'Accept proposal'
          : hasInvitation
          ? 'Sent'
          : 'Send Proposal',
      onPressed: isAccepted || hasInvitation
          ? () {} // Disabled button
          : _getButtonAction(context),
      height: 36,
      width: 140,
      borderRadius: 20,
      backgroundColor: isAccepted || hasInvitation
          ? AppColors.black.withValues(alpha: 0.6)
          : AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
  }

  VoidCallback? _getButtonAction(BuildContext context) {
    if (isApplicant && application.id.isNotEmpty && onAccept != null) {
      return () => onAccept!();
    } else if (!isApplicant &&
        application.athlete.id != null &&
        !hasInvitation &&
        onSendProposal != null) {
      return () => onSendProposal!();
    }
    return () {};
  }

  Widget _buildCountryFlag(String? countryFlag) {
    return Positioned(
      top: 10,
      right: 12,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: countryFlag != null && countryFlag.isNotEmpty
            ? Image.network(
                '$fileBaseUrl$countryFlag',
                height: 28,
                width: 28,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/flag.png",
                    height: 28,
                    width: 28,
                    fit: BoxFit.cover,
                  );
                },
              )
            : Image.asset(
                "assets/images/flag.png",
                height: 28,
                width: 28,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
