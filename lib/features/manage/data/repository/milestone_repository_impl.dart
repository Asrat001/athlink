import 'dart:developer';

import 'package:athlink/features/manage/data/datasource/milestone_remote_datasource.dart';
import 'package:athlink/features/manage/domain/models/milestone_model.dart';
import 'package:athlink/features/manage/domain/repository/milestone_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class MilestoneRepositoryImpl implements MilestoneRepository {
  final MilestoneRemoteDataSource _remoteDataSource;

  MilestoneRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<CreateMilestoneResponse>> createMilestone({
    required String athleteId,
    required String jobId,
    required String applicationId,
    required CreateMilestoneRequest request,
  }) async {
    try {
      final response = await _remoteDataSource.createMilestone(
        athleteId: athleteId,
        jobId: jobId,
        applicationId: applicationId,
        request: request,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Create milestone error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<GetMilestonesResponse>> getMilestones({
    String? status,
  }) async {
    try {
      final response = await _remoteDataSource.getMilestones(status: status);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get milestones error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<GetMilestonesResponse>> getAthleteMilestones({
    String? status,
  }) async {
    try {
      final response =
          await _remoteDataSource.getAthleteMilestones(status: status);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get athlete milestones error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<GetMilestoneByIdResponse>> getMilestoneById({
    required String milestoneId,
  }) async {
    try {
      final response =
          await _remoteDataSource.getMilestoneById(milestoneId: milestoneId);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get milestone by ID error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<UpdateMilestoneStatusResponse>> updateMilestoneStatus({
    required String milestoneId,
    required UpdateMilestoneStatusRequest request,
  }) async {
    try {
      final response = await _remoteDataSource.updateMilestoneStatus(
        milestoneId: milestoneId,
        request: request,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Update milestone status error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
