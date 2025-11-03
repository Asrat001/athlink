import 'dart:developer';

import 'package:athlink/features/manage/data/datasource/job_list_remote_datasource.dart';
import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/features/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class JobListRepositoryImpl implements JobListRepository {
  final JobListRemoteDataSource _remoteDataSource;

  JobListRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<JobListResponse>> getJobPosts() async {
    try {
      final response = await _remoteDataSource.getJobPosts();
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get job posts error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<AcceptApplicantResponse>> acceptApplicant({
    required String jobId,
    required String applicationId,
  }) async {
    try {
      final response = await _remoteDataSource.acceptApplicant(
        jobId: jobId,
        applicationId: applicationId,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Accept applicant error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<SponsoredAthletesResponse>> getSponsoredAthletes() async {
    try {
      final response = await _remoteDataSource.getSponsoredAthletes();
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get sponsored athletes error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<SendInvitationResponse>> sendInvitation({
    required String athleteId,
    required String jobId,
    required String message,
  }) async {
    try {
      final response = await _remoteDataSource.sendInvitation(
        athleteId: athleteId,
        jobId: jobId,
        message: message,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Send invitation error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<SponsorInvitationsResponse>> getSponsorInvitations({
    String? status,
  }) async {
    try {
      final response = await _remoteDataSource.getSponsorInvitations(
        status: status,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get sponsor invitations error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<WithdrawInvitationResponse>> withdrawInvitation({
    required String invitationId,
  }) async {
    try {
      final response = await _remoteDataSource.withdrawInvitation(
        invitationId: invitationId,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Withdraw invitation error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
