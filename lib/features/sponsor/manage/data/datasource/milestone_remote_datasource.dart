import 'package:athlink/features/sponsor/manage/domain/models/milestone_model.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class MilestoneRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  MilestoneRemoteDataSource(this._httpClient);

  Future<ApiResponse<CreateMilestoneResponse>> createMilestone({
    required String athleteId,
    required String jobId,
    required CreateMilestoneRequest request,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/milestones/create/$athleteId/$jobId",
              data: request.toJson(),
            );
      },
      fromData: (data) => CreateMilestoneResponse.fromJson(data),
    );
  }

  Future<ApiResponse<GetMilestonesResponse>> getMilestones({
    String? status,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        final queryParams = <String, dynamic>{};
        if (status != null && status.isNotEmpty) {
          queryParams['status'] = status;
        }

        return await _httpClient
            .client(requireAuth: true)
            .get("/milestones/sponsor", queryParameters: queryParams);
      },
      fromData: (data) => GetMilestonesResponse.fromJson(data),
    );
  }

  Future<ApiResponse<GetMilestonesResponse>> getAthleteMilestones({
    String? status,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        final queryParams = <String, dynamic>{};
        if (status != null && status.isNotEmpty) {
          queryParams['status'] = status;
        }

        return await _httpClient
            .client(requireAuth: true)
            .get("/milestones/athlete", queryParameters: queryParams);
      },
      fromData: (data) => GetMilestonesResponse.fromJson(data),
    );
  }

  Future<ApiResponse<GetMilestoneByIdResponse>> getMilestoneById({
    required String milestoneId,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/milestones/$milestoneId");
      },
      fromData: (data) => GetMilestoneByIdResponse.fromJson(data),
    );
  }

  Future<ApiResponse<UpdateMilestoneStatusResponse>> updateMilestoneStatus({
    required String milestoneId,
    required UpdateMilestoneStatusRequest request,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .patch("/milestones/$milestoneId/status", data: request.toJson());
      },
      fromData: (data) => UpdateMilestoneStatusResponse.fromJson(data),
    );
  }
}
