import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/athlete/campaign/data/datasource/campaign_remote_data_source.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/sponsor_search_response.dart';
import 'package:athlink/features/athlete/campaign/domain/repository/campaign_repository.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  final CampaignRemoteDataSource _remoteDataSource;

  CampaignRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<CampaignModel>>> getCampaigns() async {
    return await _remoteDataSource.getCampaigns();
  }

  @override
  Future<ApiResponse<CampaignModel>> createCampaign({
    required String title,
  }) async {
    return await _remoteDataSource.createCampaign(title: title);
  }

  @override
  Future<ApiResponse<CampaignDetailModel>> getCampaignDetail({
    required String id,
  }) async {
    return await _remoteDataSource.getCampaignDetail(id: id);
  }

  @override
  Future<ApiResponse<void>> updateFinancialGoal({
    required String id,
    required double totalAmount,
    required String deadline,
  }) async {
    return await _remoteDataSource.updateFinancialGoal(
      id: id,
      totalAmount: totalAmount,
      deadline: deadline,
    );
  }

  @override
  Future<ApiResponse<void>> addGoal({
    required String id,
    required String title,
    required String targetDate,
    required String status,
  }) async {
    return await _remoteDataSource.addGoal(
      id: id,
      title: title,
      targetDate: targetDate,
      status: status,
    );
  }

  @override
  Future<ApiResponse<void>> updateSponsorshipPreferences({
    required String id,
    required Map<String, dynamic> preferences,
  }) async {
    return await _remoteDataSource.updateSponsorshipPreferences(
      id: id,
      preferences: preferences,
    );
  }

  @override
  Future<ApiResponse<void>> updateCostBreakdown({
    required String id,
    required List<Map<String, dynamic>> costs,
  }) async {
    return await _remoteDataSource.updateCostBreakdown(id: id, costs: costs);
  }

  @override
  Future<ApiResponse<void>> deleteGoal({
    required String id,
    required String goalId,
  }) async {
    return await _remoteDataSource.deleteGoal(id: id, goalId: goalId);
  }

  @override
  Future<ApiResponse<void>> deleteCampaign({required String id}) async {
    return await _remoteDataSource.deleteCampaign(id: id);
  }

  @override
  Future<ApiResponse<void>> updateCampaignTitle({
    required String id,
    required String title,
  }) async {
    return await _remoteDataSource.updateCampaignTitle(id: id, title: title);
  }

  @override
  Future<ApiResponse<void>> updateFundedPercentage({
    required String id,
    required double fundedPercentage,
  }) async {
    return await _remoteDataSource.updateFundedPercentage(
      id: id,
      fundedPercentage: fundedPercentage,
    );
  }

  @override
  Future<ApiResponse<void>> toggleCampaignActive({
    required String id,
    required bool isActive,
  }) async {
    return await _remoteDataSource.toggleCampaignActive(
      id: id,
      isActive: isActive,
    );
  }

  @override
  Future<ApiResponse<SponsorSearchResponse>> searchSponsors({
    required String query,
  }) async {
    return await _remoteDataSource.searchSponsors(query: query);
  }

  @override
  Future<ApiResponse<void>> updatePreferredSponsors({
    required String id,
    required List<String> sponsorIds,
  }) async {
    return await _remoteDataSource.updatePreferredSponsors(
      id: id,
      sponsorIds: sponsorIds,
    );
  }
}
