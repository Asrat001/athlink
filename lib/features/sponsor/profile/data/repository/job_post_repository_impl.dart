import 'package:athlink/features/sponsor/profile/data/datasource/job_post_remote_datasource.dart';
import 'package:athlink/features/sponsor/profile/domain/models/job_post_request.dart';
import 'package:athlink/features/sponsor/profile/domain/repository/job_post_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class JobPostRepositoryImpl implements JobPostRepository {
  final JobPostRemoteDataSource _remoteDataSource;

  JobPostRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<CreateJobPostResponse>> createJobPost(
    JobPostRequest request,
  ) async {
    return await _remoteDataSource.createJobPost(request);
  }

  @override
  Future<ApiResponse<UpdateJobPostResponse>> updateJobPost(
    String jobId,
    UpdateJobPostRequest request,
  ) async {
    return await _remoteDataSource.updateJobPost(jobId, request);
  }

  @override
  Future<ApiResponse<DeleteJobPostResponse>> deleteJobPost(String jobId) async {
    return await _remoteDataSource.deleteJobPost(jobId);
  }
}
