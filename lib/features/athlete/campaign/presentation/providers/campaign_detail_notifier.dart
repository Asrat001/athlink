import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/campaign/domain/repository/campaign_repository.dart';
import 'package:athlink/features/athlete/campaign/domain/models/sponsor_search_response.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_provider.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampaignDetailNotifier extends StateNotifier<CampaignDetailState> {
  final CampaignRepository _repository;
  final Ref ref;

  CampaignDetailNotifier(this._repository, this.ref)
    : super(const CampaignDetailState.initial());

  Future<void> getCampaignDetail(String id) async {
    state = const CampaignDetailState.loading();
    final response = await _repository.getCampaignDetail(id: id);
    response.when(
      success: (data) {
        state = CampaignDetailState.loaded(campaign: data);
      },
      failure: (error) {
        state = CampaignDetailState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> updateFinancialGoal({
    required String id,
    required double totalAmount,
    required DateTime deadline,
    VoidCallback? onSuccess,
  }) async {
    final response = await _repository.updateFinancialGoal(
      id: id,
      totalAmount: totalAmount,
      deadline: deadline.toIso8601String(),
    );

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        ref.read(campaignProvider.notifier).getCampaigns(); // Sync list screen
        onSuccess?.call();
      },
      failure: (error) {
        // Handle failure if needed
      },
    );
  }

  Future<void> addGoal({
    required String id,
    required String title,
    required DateTime targetDate,
    required String status,
    VoidCallback? onSuccess,
    void Function(String)? onFailure,
  }) async {
    final response = await _repository.addGoal(
      id: id,
      title: title,
      targetDate: targetDate.toIso8601String(),
      status: status,
    );

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        onSuccess?.call();
      },
      failure: (error) {
        onFailure?.call(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> deleteGoal({
    required String id,
    required String goalId,
    VoidCallback? onSuccess,
    void Function(String)? onFailure,
  }) async {
    final response = await _repository.deleteGoal(id: id, goalId: goalId);

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        onSuccess?.call();
      },
      failure: (error) {
        onFailure?.call(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> updateSponsorshipPreferences({
    required String id,
    required Map<String, dynamic> preferences,
    VoidCallback? onSuccess,
    void Function(String)? onFailure,
  }) async {
    final response = await _repository.updateSponsorshipPreferences(
      id: id,
      preferences: preferences,
    );

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        onSuccess?.call();
      },
      failure: (error) {
        onFailure?.call(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> updateCostBreakdown({
    required String id,
    required List<Map<String, dynamic>> costs,
    VoidCallback? onSuccess,
    void Function(String)? onFailure,
  }) async {
    final response = await _repository.updateCostBreakdown(
      id: id,
      costs: costs,
    );

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        onSuccess?.call();
      },
      failure: (error) {
        onFailure?.call(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> updateFundedPercentage({
    required String id,
    required double fundedPercentage,
    VoidCallback? onSuccess,
    void Function(String)? onFailure,
  }) async {
    final response = await _repository.updateFundedPercentage(
      id: id,
      fundedPercentage: fundedPercentage,
    );

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        ref.read(campaignProvider.notifier).getCampaigns(); // Sync list screen
        onSuccess?.call();
      },
      failure: (error) {
        onFailure?.call(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<ApiResponse<SponsorSearchResponse>> searchSponsors(
    String query,
  ) async {
    return await _repository.searchSponsors(query: query);
  }

  Future<void> updatePreferredSponsors({
    required String id,
    required List<String> sponsorIds,
    VoidCallback? onSuccess,
    void Function(String)? onFailure,
  }) async {
    final response = await _repository.updatePreferredSponsors(
      id: id,
      sponsorIds: sponsorIds,
    );

    response.when(
      success: (_) async {
        await getCampaignDetail(id); // Refresh data
        ref.read(campaignProvider.notifier).getCampaigns(); // Sync list screen
        onSuccess?.call();
      },
      failure: (error) {
        onFailure?.call(NetworkExceptions.getErrorMessage(error));
      },
    );
  }
}
