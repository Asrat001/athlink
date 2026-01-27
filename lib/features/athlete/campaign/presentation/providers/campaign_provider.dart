import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/campaign/domain/repository/campaign_repository.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/campaign_notifier.dart';
import 'package:athlink/features/athlete/campaign/presentation/providers/state/campaign_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final campaignProvider = StateNotifierProvider<CampaignNotifier, CampaignState>(
  (ref) {
    return CampaignNotifier(sl<CampaignRepository>());
  },
);
