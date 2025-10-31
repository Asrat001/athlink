import 'package:athlink/features/manage/domain/models/milestone_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'milestone_state.freezed.dart';

@freezed
abstract class MilestoneState with _$MilestoneState {
  const factory MilestoneState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? successMessage,
    Milestone? milestone,
    @Default([]) List<Milestone> milestones,
    @Default(0) int milestonesCount,
  }) = _MilestoneState;

  factory MilestoneState.initial() => const MilestoneState();
}
