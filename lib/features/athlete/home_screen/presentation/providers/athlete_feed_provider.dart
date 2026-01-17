import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/athlete/home_screen/presentation/providers/athlete_feed_notifier.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/state/feed_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final athelteFeedProvider =
    StateNotifierProvider<AthleteFeedNotifier, FeedState>((ref) {
      return AthleteFeedNotifier(sl<AthleteFeedRepository>());
    });
