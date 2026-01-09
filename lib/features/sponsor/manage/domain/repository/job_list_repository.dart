import 'package:athlink/features/sponsor/manage/domain/models/job_list_model.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class JobListRepository {
  Future<ApiResponse<List<JobPostItem>>> getJobPosts();

  Future<ApiResponse<AcceptApplicantResponse>> acceptApplicant({
    required String jobId,
    required String applicationId,
  });

  Future<ApiResponse<SponsoredAthletesResponse>> getSponsoredAthletes();

  Future<ApiResponse<SendInvitationResponse>> sendInvitation({
    required String athleteId,
    required String jobId,
    required String message,
  });

  Future<ApiResponse<SponsorInvitationsResponse>> getSponsorInvitations({
    String? status,
  });

  Future<ApiResponse<WithdrawInvitationResponse>> withdrawInvitation({
    required String invitationId,
  });
}
