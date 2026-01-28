import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:athlink/features/athlete/campaign/domain/models/sponsor_search_response.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/shared/utils/logger.dart';

class CampaignRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;
  CampaignRemoteDataSource(this._httpClient);

  Future<ApiResponse<List<CampaignModel>>> getCampaigns() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/campaigns");
      },
      fromData: (data) {
        if (data is List) {
          return data
              .map<CampaignModel>(
                (campaign) => CampaignModel.fromJson(campaign),
              )
              .toList();
        } else if (data is Map<String, dynamic> && data.containsKey('data')) {
          final campaignsList = data['data'] as List;
          return campaignsList
              .map<CampaignModel>(
                (campaign) => CampaignModel.fromJson(campaign),
              )
              .toList();
        }
        return [];
      },
    );
  }

  Future<ApiResponse<CampaignModel>> createCampaign({
    required String title,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/campaigns", data: {'title': title});
      },
      fromData: (data) {
        // Handle if response wraps the campaign in a 'data' or 'campaign' field
        if (data is Map<String, dynamic>) {
          if (data.containsKey('data')) {
            return CampaignModel.fromJson(data['data']);
          } else if (data.containsKey('campaign')) {
            return CampaignModel.fromJson(data['campaign']);
          }
        }
        return CampaignModel.fromJson(data);
      },
    );
  }

  Future<ApiResponse<CampaignDetailModel>> getCampaignDetail({
    required String id,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/campaigns/$id");
      },
      fromData: (data) {
        // Handle if response wraps the detail in a 'data' field
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          return CampaignDetailModel.fromJson(data['data']);
        }
        return CampaignDetailModel.fromJson(data);
      },
    );
  }

  Future<ApiResponse<void>> updateFinancialGoal({
    required String id,
    required double totalAmount,
    required String deadline,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/campaigns/$id/financial-goal",
              data: {'totalAmount': totalAmount, 'deadline': deadline},
            );
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> addGoal({
    required String id,
    required String title,
    required String targetDate,
    required String status,
  }) async {
    logger({
      'id': id,
      'title': title,
      'targetDate': targetDate,
      'status': status,
    });
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/campaigns/$id/goals",
              data: {
                'title': title,
                'targetDate': targetDate,
                'status': status,
              },
            );
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> updateCostBreakdown({
    required String id,
    required List<Map<String, dynamic>> costs,
  }) async {
    logger({'costs': costs});
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/campaigns/$id/costs", data: {'costs': costs});
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> updateSponsorshipPreferences({
    required String id,
    required Map<String, dynamic> preferences,
  }) async {
    logger(preferences);
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post("/campaigns/$id/sponsorship-preferences", data: preferences);
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> deleteGoal({
    required String id,
    required String goalId,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/campaigns/$id/goals/$goalId");
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> deleteCampaign({required String id}) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .delete("/campaigns/$id");
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> updateCampaignTitle({
    required String id,
    required String title,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .put("/campaigns/$id", data: {'title': title});
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> updateFundedPercentage({
    required String id,
    required double fundedPercentage,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .patch(
              "/campaigns/$id/title/funded-percentage",
              data: {'fundedPercentage': fundedPercentage},
            );
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<void>> toggleCampaignActive({
    required String id,
    required bool isActive,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .patch("/campaigns/$id/title/toggle", data: {'isActive': isActive});
      },
      fromData: (data) {},
    );
  }

  Future<ApiResponse<SponsorSearchResponse>> searchSponsors({
    required String query,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .get("/sponsors/search/by-name", queryParameters: {'name': query});
      },
      fromData: (data) {
        return SponsorSearchResponse.fromJson(data);
      },
    );
  }

  Future<ApiResponse<void>> updatePreferredSponsors({
    required String id,
    required List<String> sponsorIds,
  }) async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient
            .client(requireAuth: true)
            .post(
              "/campaigns/$id/preferred-sponsors",
              data: {'sponsors': sponsorIds},
            );
      },
      fromData: (data) {},
    );
  }
}
