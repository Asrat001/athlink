import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/sponsor_search_response.dart';

abstract class CampaignRepository {
  Future<ApiResponse<List<CampaignModel>>> getCampaigns();
  Future<ApiResponse<CampaignModel>> createCampaign({required String title});
  Future<ApiResponse<CampaignDetailModel>> getCampaignDetail({
    required String id,
  });
  Future<ApiResponse<void>> updateFinancialGoal({
    required String id,
    required double totalAmount,
    required String deadline,
  });
  Future<ApiResponse<void>> addGoal({
    required String id,
    required String title,
    required String targetDate,
    required String status,
  });
  Future<ApiResponse<void>> updateSponsorshipPreferences({
    required String id,
    required Map<String, dynamic> preferences,
  });
  Future<ApiResponse<void>> updateCostBreakdown({
    required String id,
    required List<Map<String, dynamic>> costs,
  });
  Future<ApiResponse<void>> deleteGoal({
    required String id,
    required String goalId,
  });
  Future<ApiResponse<void>> deleteCampaign({required String id});
  Future<ApiResponse<void>> updateCampaignTitle({
    required String id,
    required String title,
  });
  Future<ApiResponse<void>> updateFundedPercentage({
    required String id,
    required double fundedPercentage,
  });
  Future<ApiResponse<void>> toggleCampaignActive({
    required String id,
    required bool isActive,
  });
  Future<ApiResponse<SponsorSearchResponse>> searchSponsors({
    required String query,
  });
  Future<ApiResponse<void>> updatePreferredSponsors({
    required String id,
    required List<String> sponsorIds,
  });
}
