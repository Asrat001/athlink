import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/base_response.dart';
import 'package:athlink/features/sponsor/manage/domain/models/job_list_model.dart'
    as manage_models;
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';

class JobListRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  JobListRemoteDataSource(this._httpClient);

  Future<ApiResponse<List<manage_models.JobPostItem>>> getJobPosts() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsors/jobs");
      },
      fromData: (data) {
        final baseResponse = BaseResponse.fromJson(
          data,
          (json) => (json as Map<String, dynamic>)["jobs"] as List,
        );
        return baseResponse.data.map((e)=>manage_models.JobPostItem.fromJson(e)).toList();
      },
    );
  }

  Future<ApiResponse<manage_models.AcceptApplicantResponse>> acceptApplicant({
    required String jobId,
    required String applicationId,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/sponsorship/accept-applicant/$jobId/$applicationId");
      },
      fromData: (data) {
        return manage_models.AcceptApplicantResponse.fromJson(data);
      },
    );
  }

  Future<ApiResponse<manage_models.SponsoredAthletesResponse>>
  getSponsoredAthletes() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsorship/sponsored-athletes");
      },
      fromData: (data) {
        return manage_models.SponsoredAthletesResponse.fromJson(data);
      },
    );
  }

  Future<ApiResponse<manage_models.SendInvitationResponse>> sendInvitation({
    required String athleteId,
    required String jobId,
    required String message,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/invitation/send",
              data: {
                "athleteId": athleteId,
                "jobId": jobId,
                "message": message,
              },
            );
      },
      fromData: (data) {
        return manage_models.SendInvitationResponse.fromJson(data);
      },
    );
  }

  Future<ApiResponse<manage_models.SponsorInvitationsResponse>>
  getSponsorInvitations({String? status}) async {
    print(
      "=== DATASOURCE: getSponsorInvitations called (fetching ALL statuses) ===",
    );
    return await safeApiCall(
      apiCall: () async {
        print(
          "=== DATASOURCE: Making HTTP GET to /invitation/sponsor (no status filter) ===",
        );
        final response = await _httpClient
            .client(requireAuth: true)
            .get("/invitation/sponsor");
        print("=== DATASOURCE: HTTP response received: ${response.data} ===");
        return response;
      },
      fromData: (data) {
        return manage_models.SponsorInvitationsResponse.fromJson(data);
      },
    );
  }

  Future<ApiResponse<manage_models.WithdrawInvitationResponse>>
  withdrawInvitation({required String invitationId}) async {
    return await safeApiCall(
      apiCall: () async {
        final response = await _httpClient
            .client(requireAuth: true)
            .delete("/invitation/$invitationId");
        return response;
      },
      fromData: (data) {
        return manage_models.WithdrawInvitationResponse.fromJson(data);
      },
    );
  }
}
