import 'dart:developer';

import 'package:athlink/features/manage/data/datasource/job_list_remote_datasource.dart';
import 'package:athlink/features/manage/domain/models/job_list_model.dart';
import 'package:athlink/features/manage/domain/repository/job_list_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class JobListRepositoryImpl implements JobListRepository {
  final JobListRemoteDataSource _remoteDataSource;

  JobListRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<JobListResponse>> getJobPosts() async {
    try {
      final response = await _remoteDataSource.getJobPosts();
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get job posts error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
