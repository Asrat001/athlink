import 'package:athlink/features/athlete/profile/presentation/widgets/profile_action_button.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:athlink/routes/route_names.dart';

class QuickActionsGrid extends StatelessWidget {
  final String? athleteId;
  final bool isSelf;

  const QuickActionsGrid({super.key, this.athleteId, this.isSelf = true});

  void _handleNavigation(BuildContext context, String routeName) {
    if (isSelf) {
      context.push(routeName, extra: {"isSelf": true});
    } else {
      context.push(routeName, extra: {'athleteId': athleteId, 'isSelf': false});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionTile(
            label: 'Career Journey',
            icon: SvgPicture.asset(
              'assets/images/career_icon.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
              height: 32,
            ),
            onTap: () =>
                _handleNavigation(context, Routes.careerJourneyRouteName),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: QuickActionTile(
            label: 'Results',
            icon: SvgPicture.asset(
              'assets/images/results_icon.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
              height: 32,
            ),
            onTap: () =>
                _handleNavigation(context, Routes.athleteResultsRouteName),
          ),
        ),
      ],
    );
  }
}
