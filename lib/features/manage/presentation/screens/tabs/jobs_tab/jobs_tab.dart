import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/features/manage/presentation/providers/manage_navigation_provider.dart';
import 'package:athlink/features/manage/presentation/screens/manage_enums.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/application_view.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/brand_ambasador_detail_view.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/job_detail_view.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/job_listing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobsTab extends ConsumerWidget {
  const JobsTab({
    super.key,
    required this.showAthleteDetailOverlay,
  });

  final Function(JobApplication jobApplication, String jobId, bool isApplicant)
      showAthleteDetailOverlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(manageNavigationProvider);

    return switch (navigationState.jobsState) {
      JobsSectionState.listing => const JobListing(),
      JobsSectionState.applicants => ApplicationView(
          showAthleteDetailOverlay: showAthleteDetailOverlay,
        ),
      JobsSectionState.jobDetail => JobDetailView(
          selectedJobIndex: navigationState.selectedJobIndex,
          onJobBack: () =>
              ref.read(manageNavigationProvider.notifier).jobsBack(),
        ),
      JobsSectionState.baDetail => BrandAmbasadorDetailView(
          selectedJobIndex: navigationState.selectedJobIndex,
          onJobBack: () =>
              ref.read(manageNavigationProvider.notifier).jobsBack(),
        ),
    };
  }
}