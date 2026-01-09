import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/manage/domain/models/job_list_model.dart';
import 'package:athlink/shared/constant/constants.dart';
import 'package:athlink/shared/utils/url_helper.dart';

/// Helper functions for the Manage screen
class ManageHelpers {
  /// Filter athletes by sport ID
  static List<Athlete> getFilteredAthletesBySport(
    String sportId,
    List<Athlete> athletes,
  ) {
    if (athletes.isEmpty) {
      return [];
    }

    // Filter athletes that have the same sport as the job
    return athletes.where((athlete) {
      return athlete.sport.any((sport) => sport.id == sportId);
    }).toList();
  }

  /// Check if an application has been accepted (is in sponsored athletes list)
  static bool isApplicationAccepted(
    String applicationId,
    List<SponsoredAthleteItem> sponsoredAthletes,
  ) {
    return sponsoredAthletes.any(
      (sponsoredAthlete) => sponsoredAthlete.applicationId == applicationId,
    );
  }

  /// Get invitation ID for a specific athlete and job combination
  /// Returns null if no invitation exists
  static String? getInvitationId(
    String athleteId,
    String jobId,
    List<InvitationData> invitations,
  ) {
    try {
      final invitation = invitations.firstWhere((inv) {
        // Extract athlete ID from the athlete map
        final invAthleteId = inv.athlete['_id'] as String?;
        // jobPost could be a string ID or an object
        final invJobId = inv.jobPost is String
            ? inv.jobPost
            : (inv.jobPost as Map<String, dynamic>?)?['_id'] as String?;

        // Check if IDs match (regardless of status)
        return invAthleteId == athleteId && invJobId == jobId;
      });
      return invitation.id;
    } catch (e) {
      // No invitation found
      return null;
    }
  }

  /// Convert API jobs to display format
  static List<Map<String, dynamic>> convertJobsToDisplayFormat(
    List<JobPostItem> apiJobs,
    String? companyLogo,
    String companyName,
  ) {
    return apiJobs.map((job) {
      return {
        "id": job.id,
        "type": "hiring",
        "agencyLogo": companyLogo != null && companyLogo.isNotEmpty
            ? UrlHelper.getFullImageUrl(companyLogo)
            : "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Quartz_logo.svg/2560px-Quartz_logo.svg.png",
        "agencyName": companyName,
        "location": job.location,
        "price": job.price.isNotEmpty ? job.price : "N/A",
        "title": job.title,
        "tags": [], // No tags in API data
        "notifications": job.applicantCount,
        "description": job.description,
      };
    }).toList();
  }

  /// Calculate timeline duration from start and end dates
  static String calculateTimelineDuration(
    DateTime? startDate,
    DateTime? endDate,
  ) {
    if (startDate == null || endDate == null) {
      return 'N/A';
    }

    final duration = endDate.difference(startDate);
    final months = (duration.inDays / 30).round();

    if (months > 0) {
      return '$months month${months != 1 ? 's' : ''}';
    }

    return 'N/A';
  }

  /// Get full image URL or placeholder
  static String getImageUrl(String? imageUrl, String placeholder) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return '$fileBaseUrl$imageUrl';
    }
    return placeholder;
  }
}
