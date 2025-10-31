import 'package:athlink/features/manage/domain/models/milestone_model.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class MilestoneRepository {
  Future<ApiResponse<CreateMilestoneResponse>> createMilestone({
    required String athleteId,
    required String jobId,
    required String applicationId,
    required CreateMilestoneRequest request,
  });

  Future<ApiResponse<GetMilestonesResponse>> getMilestones({String? status});

  Future<ApiResponse<GetMilestonesResponse>> getAthleteMilestones({
    String? status,
  });

  Future<ApiResponse<GetMilestoneByIdResponse>> getMilestoneById({
    required String milestoneId,
  });

  Future<ApiResponse<UpdateMilestoneStatusResponse>> updateMilestoneStatus({
    required String milestoneId,
    required UpdateMilestoneStatusRequest request,
  });
}
