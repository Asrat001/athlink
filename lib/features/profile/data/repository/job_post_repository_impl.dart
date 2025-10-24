import 'dart:developer';

import 'package:athlink/features/profile/data/datasource/job_post_remote_datasource.dart';
import 'package:athlink/features/profile/domain/models/job_post_request.dart';
import 'package:athlink/features/profile/domain/repository/job_post_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class JobPostRepositoryImpl implements JobPostRepository {
  final JobPostRemoteDataSource _remoteDataSource;

  JobPostRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<CreateJobPostResponse>> createJobPost(
    JobPostRequest request,
  ) async {
    try {
      final response = await _remoteDataSource.createJobPost(request);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Create job post error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
