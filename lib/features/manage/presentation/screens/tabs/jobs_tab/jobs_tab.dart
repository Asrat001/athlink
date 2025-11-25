import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/features/manage/presentation/screens/manage_enums.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/application_view.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/brand_ambasador_detail_view.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/job_detail_view.dart';
import 'package:athlink/features/manage/presentation/screens/tabs/jobs_tab/job_listing.dart';
import 'package:flutter/widgets.dart';

class JobsTab extends StatelessWidget {
  const JobsTab({super.key, required this.jobSectionState,required this.onJobTap, this.selectedJobIndex, required this.activeTab, required this.openDetailForSelectedJob, required this.onApplicatntTabCliked, required this.onJobBack, required this.showAthleteDetailOverlay});
  final JobsSectionState jobSectionState;
  final Function(int index) onJobTap;
    final int? selectedJobIndex;
  final ApplicantTab activeTab;
  final VoidCallback openDetailForSelectedJob;
  final VoidCallback onApplicatntTabCliked;
  final VoidCallback onJobBack;
  final Function(JobApplication jobApplication, String jobId, bool isApplicant) showAthleteDetailOverlay;


  @override
  Widget build(BuildContext context) {
    return switch (jobSectionState) {
      JobsSectionState.listing =>  JobListing(onJobTap:onJobTap,),
      JobsSectionState.applicants => ApplicationView(
        selectedJobIndex: selectedJobIndex, 
        activeTab: activeTab,
         onApplicatntTabCliked: onApplicatntTabCliked, 
         onJobBack: onJobBack, 
         showAthleteDetailOverlay: showAthleteDetailOverlay, 
         openDetailForSelectedJob: openDetailForSelectedJob
         ,),
      JobsSectionState.jobDetail => JobDetailView(selectedJobIndex: selectedJobIndex,onJobBack: onJobBack,),
      JobsSectionState.baDetail => BrandAmbasadorDetailView(selectedJobIndex: selectedJobIndex, onJobBack:onJobBack,)
    };
  }
}