import 'package:athlink/features/sponsor/profile/domain/models/job_post_request.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class JobPostRepository {
  Future<ApiResponse<CreateJobPostResponse>> createJobPost(
    JobPostRequest request,
  );

  Future<ApiResponse<UpdateJobPostResponse>> updateJobPost(
    String jobId,
    UpdateJobPostRequest request,
  );

  Future<ApiResponse<DeleteJobPostResponse>> deleteJobPost(String jobId);
}
