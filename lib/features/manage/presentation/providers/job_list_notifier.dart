import 'package:athlink/features/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/features/manage/presentation/providers/state/job_list_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter/material.dart';
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
          jobPosts: data,
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
        debugPrint(
          "Accept applicant error: ${NetworkExceptions.getErrorMessage(error)}",
        );
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

  Future<ApiResponse<dynamic>> sendInvitation({
    required String athleteId,
    required String jobId,
    required String message,
  }) async {
    final response = await _jobListRepository.sendInvitation(
      athleteId: athleteId,
      jobId: jobId,
      message: message,
    );

    return response.when(
      success: (data) {
        debugPrint("Invitation sent: ${data.message}");
        return ApiResponse.success(data: data);
      },
      failure: (error) {
        debugPrint(
          "Send invitation error: ${NetworkExceptions.getErrorMessage(error)}",
        );
        return ApiResponse.failure(error: error);
      },
    );
  }

  Future<void> getSponsorInvitations({String? status}) async {
    debugPrint("=== getSponsorInvitations CALLED with status: $status ===");
    state = state.copyWith(
      isInvitationsLoading: true,
      invitationsErrorMessage: null,
    );

    debugPrint("=== Making API call to get sponsor invitations ===");
    final response = await _jobListRepository.getSponsorInvitations(
      status: status,
    );

    debugPrint("=== API Response received: $response ===");
    response.when(
      success: (data) {
        debugPrint(
          "=== SUCCESS: Invitations count: ${data.data.invitations.length} ===",
        );
        for (var inv in data.data.invitations) {
          // Extract IDs for logging
          final athleteId = inv.athlete['_id'] as String?;
          final jobPostId = inv.jobPost is Map<String, dynamic>
              ? (inv.jobPost as Map<String, dynamic>)['_id'] as String?
              : inv.jobPost as String?;

          debugPrint(
            "Invitation: ${inv.id}, athlete: $athleteId, job: $jobPostId, status: ${inv.status}",
          );
        }
        // Keep ALL invitations (including withdrawn) - don't filter
        state = state.copyWith(
          isInvitationsLoading: false,
          invitations: data.data.invitations,
          invitationsErrorMessage: null,
        );
        debugPrint(
          "=== State updated with ${state.invitations.length} invitations ===",
        );
      },
      failure: (error) {
        debugPrint(
          "=== FAILURE: ${NetworkExceptions.getErrorMessage(error)} ===",
        );
        state = state.copyWith(
          isInvitationsLoading: false,
          invitationsErrorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<ApiResponse<dynamic>> withdrawInvitation({
    required String invitationId,
  }) async {
    final response = await _jobListRepository.withdrawInvitation(
      invitationId: invitationId,
    );

    return response.when(
      success: (data) {
        debugPrint("Invitation withdrawn: ${data.message}");
        // Refresh invitations list after withdrawing
        getSponsorInvitations();
        return ApiResponse.success(data: data);
      },
      failure: (error) {
        debugPrint(
          "Withdraw invitation error: ${NetworkExceptions.getErrorMessage(error)}",
        );
        return ApiResponse.failure(error: error);
      },
    );
  }

  void resetState() {
    state = JobListState.initial();
  }
}
