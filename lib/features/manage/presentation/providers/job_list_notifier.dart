import 'package:athlink/features/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/features/manage/presentation/providers/state/job_list_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobListNotifier extends StateNotifier<JobListState> {
  final JobListRepository _jobListRepository;

  JobListNotifier(this._jobListRepository) : super(JobListState.initial());

  Future<void> fetchJobPosts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _jobListRepository.getJobPosts();

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          jobPosts: data.jobPosts,
          companyName: data.companyName,
          companyLogo: data.companyLogo,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void resetState() {
    state = JobListState.initial();
  }
}
