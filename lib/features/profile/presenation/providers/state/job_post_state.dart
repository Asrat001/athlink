import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_post_state.freezed.dart';

@freezed
abstract class JobPostState with _$JobPostState {
  const factory JobPostState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? successMessage,
  }) = _JobPostState;

  factory JobPostState.initial() => const JobPostState();
}
