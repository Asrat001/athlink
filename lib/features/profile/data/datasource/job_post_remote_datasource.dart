import 'package:athlink/features/profile/domain/models/job_post_request.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';
import 'package:dio/dio.dart';

class JobPostRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  JobPostRemoteDataSource(this._httpClient);

  Future<CreateJobPostResponse> createJobPost(JobPostRequest request) async {
    return await safeApiCall(
      path: "/sponsors/job-post",
      apiCall: () async {
        // Convert the request to FormData for file uploads
        final formData = FormData.fromMap({
          'title': request.title,
          if (request.sportId != null) 'sport_id': request.sportId,
          if (request.location != null) 'location': request.location,
          if (request.description != null) 'description': request.description,
          if (request.timelineStart != null)
            'timelineStart': request.timelineStart,
          if (request.timelineEnd != null) 'timelineEnd': request.timelineEnd,
          if (request.requirements != null)
            'requirements': request.requirements,
          if (request.budget != null) 'budget': request.budget,
        });

        // Add media files if present
        if (request.media != null && request.media!.isNotEmpty) {
          for (var i = 0; i < request.media!.length; i++) {
            final filePath = request.media![i];
            formData.files.add(
              MapEntry(
                'media',
                await MultipartFile.fromFile(
                  filePath,
                  filename: filePath.split('/').last,
                ),
              ),
            );
          }
        }

        return await _httpClient
            .client(requireAuth: true)
            .post("/sponsors/job-post", data: formData);
      },
      fromData: (data) => CreateJobPostResponse.fromJson(data),
    );
  }

  Future<UpdateJobPostResponse> updateJobPost(
    String jobId,
    UpdateJobPostRequest request,
  ) async {
    return await safeApiCall(
      path: "/sponsors/job-post",
      apiCall: () async {
        // Convert the request to FormData for file uploads
        final formData = FormData.fromMap({
          if (request.title != null) 'title': request.title,
          if (request.sportId != null) 'sport_id': request.sportId,
          if (request.location != null) 'location': request.location,
          if (request.description != null) 'description': request.description,
          if (request.timelineStart != null)
            'timelineStart': request.timelineStart,
          if (request.timelineEnd != null) 'timelineEnd': request.timelineEnd,
          if (request.requirements != null)
            'requirements': request.requirements,
          if (request.budget != null) 'budget': request.budget,
        });

        // Add media files if present
        if (request.media != null && request.media!.isNotEmpty) {
          for (var i = 0; i < request.media!.length; i++) {
            final filePath = request.media![i];
            formData.files.add(
              MapEntry(
                'media',
                await MultipartFile.fromFile(
                  filePath,
                  filename: filePath.split('/').last,
                ),
              ),
            );
          }
        }

        return await _httpClient
            .client(requireAuth: true)
            .put("/sponsors/job-post/$jobId", data: formData);
      },
      fromData: (data) => UpdateJobPostResponse.fromJson(data),
    );
  }

  Future<DeleteJobPostResponse> deleteJobPost(String jobId) async {
    return await safeApiCall(
      path: "/sponsors/job-post/$jobId",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/sponsors/job-post/$jobId");
      },
      fromData: (data) => DeleteJobPostResponse.fromJson(data),
    );
  }
}
