import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/state/profile_state.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_provider.dart';
import 'package:athlink/shared/widgets/create_job_modal.dart';
import 'package:athlink/features/sponsor/profile/presenation/screens/widgets/posts_widget.dart';
import 'package:athlink/shared/theme/app_colors.dart';
import 'package:athlink/shared/widgets/custom_text.dart';
import 'package:athlink/shared/widgets/forms/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoJobsCard extends ConsumerWidget {
  const NoJobsCard({super.key});

  void _openCreateJobModal(BuildContext context, WidgetRef ref) {
    final sponsorId = sl<LocalStorageService>().getUserData()?.id;
    final profileState = sponsorId != null
        ? ref.read(profileProvider(sponsorId))
        : const ProfileState();
    final sports = profileState.profileUser?.sport ?? [];

    // Save the current status bar style to restore later
    final originalStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );

    // Set the new status bar style for the modal
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.black.withOpacity(0.3),
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      useRootNavigator: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => CreateJobModal(sports: sports),
    ).then((_) {
      // Restore the original status bar style when modal closes
      SystemChrome.setSystemUIOverlayStyle(originalStyle);
      // Refresh job list after modal closes
      ref.read(jobListProvider.notifier).fetchJobPosts();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double appBarHeight =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
    const double tabBarHeight = 48;
    final double viewportHeight =
        MediaQuery.of(context).size.height - appBarHeight - tabBarHeight;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: viewportHeight),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: viewportHeight * 0.15),
              const Center(
                child: CustomText(
                  title: 'No job posted yet',
                  textColor: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RoundedButton(
                  label: 'Create a job post',
                  onPressed: () => _openCreateJobModal(context, ref),
                  height: 50,
                  borderRadius: 8,
                  backgroundColor: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
