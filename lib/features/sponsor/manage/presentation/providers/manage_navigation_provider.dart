import 'package:athlink/features/sponsor/manage/presentation/providers/job_list_provider.dart';
import 'package:athlink/features/sponsor/manage/presentation/screens/manage_enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State class for managing navigation within the Manage screen
@immutable
class ManageNavigationState {
  final JobsSectionState jobsState;
  final ApplicantTab activeApplicantTab;
  final int? selectedJobIndex;
  final JobsSectionState? previousJobsState;

  const ManageNavigationState({
    this.jobsState = JobsSectionState.listing,
    this.activeApplicantTab = ApplicantTab.newApplicants,
    this.selectedJobIndex,
    this.previousJobsState,
  });

  ManageNavigationState copyWith({
    JobsSectionState? jobsState,
    ApplicantTab? activeApplicantTab,
    int? selectedJobIndex,
    JobsSectionState? previousJobsState,
    bool clearSelectedJobIndex = false,
    bool clearPreviousJobsState = false,
  }) {
    return ManageNavigationState(
      jobsState: jobsState ?? this.jobsState,
      activeApplicantTab: activeApplicantTab ?? this.activeApplicantTab,
      selectedJobIndex: clearSelectedJobIndex
          ? null
          : (selectedJobIndex ?? this.selectedJobIndex),
      previousJobsState: clearPreviousJobsState
          ? null
          : (previousJobsState ?? this.previousJobsState),
    );
  }
}

/// Notifier for managing navigation state
class ManageNavigationNotifier extends StateNotifier<ManageNavigationState> {
  final Ref ref;

  ManageNavigationNotifier(this.ref) : super(const ManageNavigationState());

  /// Navigate to applicants view for a specific job
  void showJobFromListing(int index) {
    debugPrint("=== Navigating to job at index: $index ===");

    state = state.copyWith(
      selectedJobIndex: index,
      previousJobsState: state.jobsState,
      jobsState: JobsSectionState.applicants,
    );

    // Refresh invitations when entering applicants view
    debugPrint("=== Opening job, refreshing invitations ===");
    ref.read(jobListProvider.notifier).getSponsorInvitations();
  }

  /// Navigate back to previous state
  void jobsBack() {
    debugPrint("=== Navigating back ===");

    final previousState = state.previousJobsState ?? JobsSectionState.listing;

    state = state.copyWith(
      jobsState: previousState,
      clearSelectedJobIndex: previousState == JobsSectionState.listing,
      clearPreviousJobsState: true,
    );
  }

  /// Switch between applicant tabs (New Applicants / Invitees)
  void setActiveApplicantTab(ApplicantTab tab) {
    debugPrint("=== Switching to tab: $tab ===");
    state = state.copyWith(activeApplicantTab: tab);
  }

  /// Navigate to job detail view
  void showJobDetail() {
    debugPrint("=== Navigating to job detail ===");
    state = state.copyWith(
      previousJobsState: state.jobsState,
      jobsState: JobsSectionState.jobDetail,
    );
  }

  /// Navigate to brand ambassador detail view
  void showBrandAmbassadorDetail() {
    debugPrint("=== Navigating to brand ambassador detail ===");
    state = state.copyWith(
      previousJobsState: state.jobsState,
      jobsState: JobsSectionState.baDetail,
    );
  }

  /// Reset to initial state
  void resetState() {
    debugPrint("=== Resetting navigation state ===");
    state = const ManageNavigationState();
  }
}

/// Provider for manage navigation state
final manageNavigationProvider =
    StateNotifierProvider<ManageNavigationNotifier, ManageNavigationState>((
      ref,
    ) {
      return ManageNavigationNotifier(ref);
    });
