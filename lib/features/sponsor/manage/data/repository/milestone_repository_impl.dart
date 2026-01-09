import 'package:athlink/features/sponsor/manage/data/datasource/milestone_remote_datasource.dart';
import 'package:athlink/features/sponsor/manage/domain/models/milestone_model.dart';
import 'package:athlink/features/sponsor/manage/domain/repository/milestone_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class MilestoneRepositoryImpl implements MilestoneRepository {
  final MilestoneRemoteDataSource _remoteDataSource;

  MilestoneRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<CreateMilestoneResponse>> createMilestone({
    required String athleteId,
    required String jobId,
    required CreateMilestoneRequest request,
  }) async {
    return await _remoteDataSource.createMilestone(
      athleteId: athleteId,
      jobId: jobId,
      request: request,
    );
  }

  @override
  Future<ApiResponse<GetMilestonesResponse>> getMilestones({
    String? status,
  }) async {
    return await _remoteDataSource.getMilestones(status: status);
  }

  @override
  Future<ApiResponse<GetMilestonesResponse>> getAthleteMilestones({
    String? status,
  }) async {
    return await _remoteDataSource.getAthleteMilestones(status: status);
  }

  @override
  Future<ApiResponse<GetMilestoneByIdResponse>> getMilestoneById({
    required String milestoneId,
  }) async {
    return await _remoteDataSource.getMilestoneById(milestoneId: milestoneId);
  }

  @override
  Future<ApiResponse<UpdateMilestoneStatusResponse>> updateMilestoneStatus({
    required String milestoneId,
    required UpdateMilestoneStatusRequest request,
  }) async {
    return await _remoteDataSource.updateMilestoneStatus(
      milestoneId: milestoneId,
      request: request,
    );
  }
}
