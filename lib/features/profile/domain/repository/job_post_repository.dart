import 'package:athlink/features/profile/domain/models/job_post_request.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class JobPostRepository {
  Future<ApiResponse<CreateJobPostResponse>> createJobPost(
    JobPostRequest request,
  );
}
