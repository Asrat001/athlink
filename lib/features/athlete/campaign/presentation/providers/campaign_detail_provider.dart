import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_detail_notifier.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final campaignDetailProvider =
    StateNotifierProvider<CampaignDetailNotifier, CampaignDetailState>((ref) {
      return CampaignDetailNotifier(sl(), ref);
    });
