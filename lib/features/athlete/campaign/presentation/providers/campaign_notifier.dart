import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/campaign/domain/repository/campaign_repository.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampaignNotifier extends StateNotifier<CampaignState> {
  final CampaignRepository _repository;

  CampaignNotifier(this._repository) : super(const CampaignState.loading());

  Future<void> getCampaigns() async {
    state = const CampaignState.loading();
    final response = await _repository.getCampaigns();
    response.when(
      success: (data) {
        if (data.isEmpty) {
          state = const CampaignState.empty();
        } else {
          state = CampaignState.loaded(campaigns: data);
        }
      },
      failure: (error) {
        state = CampaignState.error(
          error: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> createCampaign({
    required String title,
    required void Function() onSuccess,
    required void Function(String) onFailure,
  }) async {
    final response = await _repository.createCampaign(title: title);
    response.when(
      success: (data) {
        // Refresh the campaigns list after successful creation
        getCampaigns();
        onSuccess();
      },
      failure: (error) {
        onFailure(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> deleteCampaign({
    required String id,
    required void Function() onSuccess,
    required void Function(String) onFailure,
  }) async {
    final response = await _repository.deleteCampaign(id: id);
    response.when(
      success: (_) {
        getCampaigns();
        onSuccess();
      },
      failure: (error) {
        onFailure(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> updateCampaignTitle({
    required String id,
    required String title,
    required void Function() onSuccess,
    required void Function(String) onFailure,
  }) async {
    final response = await _repository.updateCampaignTitle(
      id: id,
      title: title,
    );
    response.when(
      success: (_) {
        getCampaigns();
        onSuccess();
      },
      failure: (error) {
        onFailure(NetworkExceptions.getErrorMessage(error));
      },
    );
  }

  Future<void> toggleCampaignActive({
    required String id,
    required bool isActive,
    required void Function() onSuccess,
    required void Function(String) onFailure,
  }) async {
    final response = await _repository.toggleCampaignActive(
      id: id,
      isActive: isActive,
    );
    response.when(
      success: (_) {
        getCampaigns();
        onSuccess();
      },
      failure: (error) {
        onFailure(NetworkExceptions.getErrorMessage(error));
      },
    );
  }
}
