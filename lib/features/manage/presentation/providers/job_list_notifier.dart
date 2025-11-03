import 'package:athlink/features/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/features/manage/presentation/providers/state/job_list_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JobListNotifier extends StateNotifier<JobListState> {
  final JobListRepository _jobListRepository;

  JobListNotifier(this._jobListRepository) : super(JobListState.initial());

  Future<void> fetchJobPosts() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _jobListRepository.getJobPosts();
    debugPrint("jobs===== $response");
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

  Future<ApiResponse<dynamic>> acceptApplicant({
    required String jobId,
    required String applicationId,
  }) async {
    final response = await _jobListRepository.acceptApplicant(
      jobId: jobId,
      applicationId: applicationId,
    );

    return response.when(
      success: (data) {
        debugPrint("Applicant accepted: ${data.message}");
        // Refresh the job posts and sponsored athletes
        fetchJobPosts();
        fetchSponsoredAthletes();
        return ApiResponse.success(data: data);
      },
      failure: (error) {
        debugPrint("Accept applicant error: ${NetworkExceptions.getErrorMessage(error)}");
        return ApiResponse.failure(error: error);
      },
    );
  }

  Future<void> fetchSponsoredAthletes() async {
    state = state.copyWith(
      isSponsorshipsLoading: true,
      sponsorshipsErrorMessage: null,
    );

    final response = await _jobListRepository.getSponsoredAthletes();
    debugPrint("sponsored athletes===== $response");
    response.when(
      success: (data) {
        state = state.copyWith(
          isSponsorshipsLoading: false,
          sponsoredAthletes: data.data.athletes,
          sponsorshipsErrorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isSponsorshipsLoading: false,
          sponsorshipsErrorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void resetState() {
    state = JobListState.initial();
  }
}
