import 'package:athlink/features/manage/presentation/screens/manage_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_screen_state.freezed.dart';

/// State for the Manage screen UI
@freezed
abstract class ManageScreenState with _$ManageScreenState {
  const factory ManageScreenState({
    /// Current section being displayed in the jobs tab
    @Default(JobsSectionState.listing) JobsSectionState jobsState,

    /// Currently active tab in the applicants view
    @Default(ApplicantTab.newApplicants) ApplicantTab activeApplicantTab,

    /// Index of the currently selected job
    int? selectedJobIndex,

    /// Previous jobs state for back navigation
    JobsSectionState? previousJobsState,
  }) = _ManageScreenState;
}
