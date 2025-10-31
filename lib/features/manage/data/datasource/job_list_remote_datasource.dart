import 'package:athlink/features/manage/domain/models/job_list_model.dart'
    as manage_models;
import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';

class JobListRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  JobListRemoteDataSource(this._httpClient);

  Future<manage_models.JobListResponse> getJobPosts() async {
    return await safeApiCall(
      path: "/auth/profile",
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/auth/profile");
      },
      fromData: (data) {
        // Parse the profile response
        final profileResponse = ProfileResponse.fromJson(data);

        // Extract sponsor profile and job posts
        final sponsorProfile = profileResponse.user.sponsorProfile;
        final jobPosts = sponsorProfile?.jobPosts ?? [];

        // Convert JobPost to JobPostItem
        final jobPostItems = jobPosts.map((jobPost) {
          return manage_models.JobPostItem(
            id: jobPost.id,
            timeline: manage_models.Timeline(
              startDate: jobPost.timeline.startDate,
              endDate: jobPost.timeline.endDate,
            ),
            title: jobPost.title,
            sportId: manage_models.SportInfo(
              id: jobPost.category,
              name: jobPost.category, // Using category ID as name for now
              icon: null,
            ),
            location: jobPost.location,
            description: jobPost.description,
            requirements: jobPost.requirements,
            createdAt: jobPost.createdAt,
            mediaUrls: jobPost.mediaUrls,
            applicants: jobPost.applicants,
            applicantCount: jobPost.applicants.length,
            price: jobPost.budget,
          );
        }).toList();

        // Sort by creation date (newest first)
        jobPostItems.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        return manage_models.JobListResponse(
          success: true,
          jobPosts: jobPostItems,
          companyName: sponsorProfile?.name,
          companyLogo: sponsorProfile?.profileImageUrl,
        );
      },
    );
  }
}
