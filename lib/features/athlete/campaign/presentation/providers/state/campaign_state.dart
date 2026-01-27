import 'package:athlink/features/athlete/campaign/domain/models/campaign_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_state.freezed.dart';

@freezed
class CampaignState with _$CampaignState {
  const factory CampaignState.loading() = _Loading;
  const factory CampaignState.loaded({required List<CampaignModel> campaigns}) =
      _Loaded;
  const factory CampaignState.error({required String error}) = _Error;
  const factory CampaignState.empty() = _Empty;
}
