import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/sports/domain/repository/sports_repository.dart';
import 'package:athlink/features/sports/presenation/providers/sports_notifier.dart';
import 'package:athlink/features/sports/presenation/providers/state/sports_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sportsProvider = StateNotifierProvider<SportsNotifier, SportsState>((
    ref,
    ) {
  return SportsNotifier(sl<ISportsRepository>());
});

final sportSelectionProvider =
StateNotifierProvider<SportSelectionNotifier, SportSelectionState>((ref) {
  return SportSelectionNotifier(sl<ISportsRepository>());
});