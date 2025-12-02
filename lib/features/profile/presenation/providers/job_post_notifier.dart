import 'package:athlink/features/profile/domain/models/job_post_request.dart';
import 'package:athlink/features/profile/domain/repository/job_post_repository.dart';
import 'package:athlink/features/profile/presenation/providers/state/job_post_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobPostNotifier extends StateNotifier<JobPostState> {
  final JobPostRepository _jobPostRepository;

  JobPostNotifier(this._jobPostRepository) : super(JobPostState.initial());

  Future<void> createJobPost(JobPostRequest request) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      successMessage: null,
      isSuccess: false,
    );

    final response = await _jobPostRepository.createJobPost(request);

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          successMessage: data.message,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
          successMessage: null,
        );
      },
    );
  }

  void resetState() {
    state = JobPostState.initial();
  }
}
