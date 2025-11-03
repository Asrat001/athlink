import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
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
          // Parse applicants from dynamic to List<JobApplication>
          final applicationsList = jobPost.applicants
              .map((applicantJson) {
                try {
                  // Try to parse as JobApplication (with _id and athlete fields)
                  return manage_models.JobApplication.fromJson(
                    applicantJson as Map<String, dynamic>,
                  );
                } catch (e) {
                  // If parsing fails, it might be a direct Athlete object
                  // Create a JobApplication with athlete ID as application ID
                  try {
                    final athlete = Athlete.fromJson(
                      applicantJson as Map<String, dynamic>,
                    );
                    // Use athlete ID as a fallback for application ID
                    return manage_models.JobApplication(
                      id: athlete.id ?? 'unknown',
                      athlete: athlete,
                    );
                  } catch (e2) {
                    // If both fail, return null and filter it out
                    return null;
                  }
                }
              })
              .whereType<
                manage_models.JobApplication
              >() // Filter out null values
              .toList();

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
            applications: applicationsList,
            applicantCount: applicationsList.length,
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

  Future<manage_models.AcceptApplicantResponse> acceptApplicant({
    required String jobId,
    required String applicationId,
  }) async {
    return await safeApiCall(
      path: "/sponsorship/accept-applicant/$jobId/$applicationId",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/sponsorship/accept-applicant/$jobId/$applicationId");
      },
      fromData: (data) {
        return manage_models.AcceptApplicantResponse.fromJson(data);
      },
    );
  }

  Future<manage_models.SponsoredAthletesResponse> getSponsoredAthletes() async {
    return await safeApiCall(
      path: "/sponsorship/sponsored-athletes",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsorship/sponsored-athletes");
      },
      fromData: (data) {
        return manage_models.SponsoredAthletesResponse.fromJson(data);
      },
    );
  }

  Future<manage_models.SendInvitationResponse> sendInvitation({
    required String athleteId,
    required String jobId,
    required String message,
  }) async {
    return await safeApiCall(
      path: "/invitation/send",
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/invitation/send",
              data: {
                "athleteId": athleteId,
                "jobId": jobId,
                "message": message,
              },
            );
      },
      fromData: (data) {
        return manage_models.SendInvitationResponse.fromJson(data);
      },
    );
  }

  Future<manage_models.SponsorInvitationsResponse> getSponsorInvitations({
    String? status,
  }) async {
    print(
      "=== DATASOURCE: getSponsorInvitations called (fetching ALL statuses) ===",
    );
    return await safeApiCall(
      path: "/invitation/sponsor",
      apiCall: () async {
        print("=== DATASOURCE: Making HTTP GET to /invitation/sponsor (no status filter) ===");
        final response = await _httpClient
            .client(requireAuth: true)
            .get("/invitation/sponsor"); // Removed queryParameters - fetch all
        print("=== DATASOURCE: HTTP response received: ${response.data} ===");
        return response;
      },
      fromData: (data) {
        print("=== DATASOURCE: Parsing response data ===");
        try {
          final parsed = manage_models.SponsorInvitationsResponse.fromJson(
            data,
          );
          print(
            "=== DATASOURCE: Parsed ${parsed.data.invitations.length} invitations ===",
          );
          return parsed;
        } catch (e, stackTrace) {
          print("=== DATASOURCE: Parsing FAILED ===");
          print("Error: $e");
          print("Stack trace: $stackTrace");
          rethrow;
        }
      },
    );
  }

  Future<manage_models.WithdrawInvitationResponse> withdrawInvitation({
    required String invitationId,
  }) async {
    print("=== DATASOURCE: withdrawInvitation called for ID: $invitationId ===");
    return await safeApiCall(
      path: "/invitation/$invitationId",
      apiCall: () async {
        print("=== DATASOURCE: Making DELETE request to /invitation/$invitationId ===");
        final response = await _httpClient
            .client(requireAuth: true)
            .delete("/invitation/$invitationId");
        print("=== DATASOURCE: DELETE response: ${response.data} ===");
        return response;
      },
      fromData: (data) {
        print("=== DATASOURCE: Parsing withdraw response ===");
        return manage_models.WithdrawInvitationResponse.fromJson(data);
      },
    );
  }
}
