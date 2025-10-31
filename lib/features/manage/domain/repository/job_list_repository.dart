import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class JobListRepository {
  Future<ApiResponse<JobListResponse>> getJobPosts();
}
