import 'package:athlink/features/manage/domain/models/milestone_model.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';

class MilestoneRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  MilestoneRemoteDataSource(this._httpClient);

  Future<CreateMilestoneResponse> createMilestone({
    required String athleteId,
    required String jobId,
    required CreateMilestoneRequest request,
  }) async {
    return await safeApiCall(
      path: "/milestones/create/$athleteId/$jobId",
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

  Future<GetMilestonesResponse> getMilestones({String? status}) async {
    return await safeApiCall(
      path: "/milestones/sponsor",
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

  Future<GetMilestonesResponse> getAthleteMilestones({String? status}) async {
    return await safeApiCall(
      path: "/milestones/athlete",
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

  Future<GetMilestoneByIdResponse> getMilestoneById({
    required String milestoneId,
  }) async {
    return await safeApiCall(
      path: "/milestones/$milestoneId",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/milestones/$milestoneId");
      },
      fromData: (data) => GetMilestoneByIdResponse.fromJson(data),
    );
  }

  Future<UpdateMilestoneStatusResponse> updateMilestoneStatus({
    required String milestoneId,
    required UpdateMilestoneStatusRequest request,
  }) async {
    return await safeApiCall(
      path: "/milestones/$milestoneId/status",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .patch("/milestones/$milestoneId/status", data: request.toJson());
      },
      fromData: (data) => UpdateMilestoneStatusResponse.fromJson(data),
    );
  }
}
