import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/sponsor/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/feed_notifier.dart';
import 'package:athlink/features/sponsor/home_feed/presentation/providers/state/feed_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedProvider = StateNotifierProvider<FeedNotifier, FeedState>((
  ref,
) {
  return FeedNotifier(sl<FeedRepository>());
});
