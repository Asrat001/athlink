import 'package:athlink/features/manage/presentation/providers/manage_screen_state.dart';
import 'package:athlink/features/manage/presentation/screens/manage_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// StateNotifier for managing the Manage screen UI state
class ManageScreenNotifier extends StateNotifier<ManageScreenState> {
  ManageScreenNotifier() : super(const ManageScreenState());

  /// Show a job from the listing view
  void showJobFromListing(int index) {
    state = state.copyWith(
      selectedJobIndex: index,
      previousJobsState: state.jobsState,
      jobsState: JobsSectionState.applicants,
    );
  }

  /// Open detail view for the selected job
  void openDetailForSelectedJob() {
    if (state.selectedJobIndex == null) return;

    state = state.copyWith(
      previousJobsState: state.jobsState,
      jobsState: JobsSectionState.jobDetail,
    );
  }

  /// Navigate back in the jobs section
  void jobsBack() {
    if (state.previousJobsState != null) {
      state = state.copyWith(
        jobsState: state.previousJobsState!,
        previousJobsState: null,
      );
    } else {
      state = state.copyWith(
        jobsState: JobsSectionState.listing,
        previousJobsState: null,
      );
    }

    // Clear selected job if returning to listing
    if (state.jobsState == JobsSectionState.listing) {
      state = state.copyWith(selectedJobIndex: null);
    }
  }

  /// Switch to a different applicant tab
  void setApplicantTab(ApplicantTab tab) {
    state = state.copyWith(activeApplicantTab: tab);
  }

  /// Reset to initial state
  void reset() {
    state = const ManageScreenState();
  }
}

/// Provider for the Manage screen state
final manageScreenProvider =
    StateNotifierProvider<ManageScreenNotifier, ManageScreenState>((ref) {
      return ManageScreenNotifier();
    });
