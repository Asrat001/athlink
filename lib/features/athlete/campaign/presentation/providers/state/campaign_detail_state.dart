import 'package:athlink/features/athlete/campaign/domain/models/campaign_detail_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'campaign_detail_state.freezed.dart';

@freezed
class CampaignDetailState with _$CampaignDetailState {
  const factory CampaignDetailState.initial() = _Initial;
  const factory CampaignDetailState.loading() = _Loading;
  const factory CampaignDetailState.loaded({
    required CampaignDetailModel campaign,
  }) = _Loaded;
  const factory CampaignDetailState.error({required String message}) = _Error;
}
