
import 'package:athlink/features/manage/data/datasource/job_list_remote_datasource.dart';
import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/features/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';


class JobListRepositoryImpl implements JobListRepository {
  final JobListRemoteDataSource _remoteDataSource;

  JobListRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<JobPostItem>>> getJobPosts() async {
    final response = await _remoteDataSource.getJobPosts();
    return response.when(
      success: (data) => ApiResponse.success(data: data),
      failure: (error) => ApiResponse.failure(error: error),
    );
  }

  @override
  Future<ApiResponse<AcceptApplicantResponse>> acceptApplicant({
    required String jobId,
    required String applicationId,
  }) async {
    return await _remoteDataSource.acceptApplicant(
      jobId: jobId,
      applicationId: applicationId,
    );
  }

  @override
  Future<ApiResponse<SponsoredAthletesResponse>> getSponsoredAthletes() async {
    return await _remoteDataSource.getSponsoredAthletes();
  }

  @override
  Future<ApiResponse<SendInvitationResponse>> sendInvitation({
    required String athleteId,
    required String jobId,
    required String message,
  }) async {
    return await _remoteDataSource.sendInvitation(
      athleteId: athleteId,
      jobId: jobId,
      message: message,
    );
  }

  @override
  Future<ApiResponse<SponsorInvitationsResponse>> getSponsorInvitations({
    String? status,
  }) async {
    return await _remoteDataSource.getSponsorInvitations(status: status);
  }

  @override
  Future<ApiResponse<WithdrawInvitationResponse>> withdrawInvitation({
    required String invitationId,
  }) async {
    return await _remoteDataSource.withdrawInvitation(
      invitationId: invitationId,
    );
  }
}
