import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:athlink/routes/route_names.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileDisplaySection extends StatelessWidget {
  final ProfileModel? profile; // Changed to nullable
  final VoidCallback onEditToggle;
  final bool isSelf;

  const ProfileDisplaySection({
    super.key,
    required this.profile,
    required this.onEditToggle,
    this.isSelf = false,
  });

  @override
  Widget build(BuildContext context) {
    // If profile is null, we show a loading placeholder state
    final bool isLoading = profile == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: isLoading
                  ? _buildPlaceholder(width: 200, height: 35)
                  : CustomText(
                      title: profile?.name ?? "Athlete",
                      fontSize: 30,
                      textColor: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
            ),
            if (isSelf && !isLoading)
              IconButton(
                onPressed: onEditToggle,
                icon: Icon(
                  Icons.edit_outlined,
                  color: AppColors.white.withValues(alpha: 0.7),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              size: 18,
              color: AppColors.orangeGradientStart,
            ),
            const SizedBox(width: 8),
            isLoading
                ? _buildPlaceholder(width: 120, height: 16)
                : CustomText(
                    title: profile?.location ?? "No location set",
                    fontSize: 14,
                    textColor: AppColors.orangeGradientStart,
                    fontWeight: FontWeight.w500,
                  ),
          ],
        ),
        if (profile?.sport != null && profile!.sport!.isNotEmpty) ...[
          const SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              Text(
                profile!.sport?[0].name ?? "",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isSelf)
                IconButton(
                  onPressed: () {
                    context.push(
                      Routes.selectSportScreen,
                      extra: {
                        'initialSportNames': profile!.sport
                            ?.map((e) => e.name ?? '')
                            .toList(),
                        'isEditing': true,
                      },
                    );
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 14,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
            ],
          ),
        ],
        const SizedBox(height: 8),
        isLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPlaceholder(width: double.infinity, height: 14),
                  const SizedBox(height: 8),
                  _buildPlaceholder(width: 250, height: 14),
                ],
              )
            : CustomText(
                title: (profile?.bio ?? "").isEmpty
                    ? "No bio added yet."
                    : profile!.bio!,
                fontSize: 15,
                textColor: AppColors.white.withValues(alpha: 0.7),
                fontWeight: FontWeight.w400,
              ),
      ],
    );
  }

  /// Simple placeholder widget for null/loading state
  Widget _buildPlaceholder({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
