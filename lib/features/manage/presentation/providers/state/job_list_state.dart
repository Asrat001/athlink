import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_list_state.freezed.dart';

@freezed
abstract class JobListState with _$JobListState {
  const factory JobListState({
    @Default(false) bool isLoading,
    @Default([]) List<JobPostItem> jobPosts,
    String? errorMessage,
    String? companyName,
    String? companyLogo,
  }) = _JobListState;

  factory JobListState.initial() => const JobListState();
}
