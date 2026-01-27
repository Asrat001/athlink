import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/competition_results_notifier.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/competition_results_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final competitionResultsProvider = StateNotifierProvider.family
    .autoDispose<CompetitionResultsNotifier, CompetitionResultsState, String>((
      ref,
      athleteId,
    ) {
      return CompetitionResultsNotifier(sl<AthletProfileRepository>());
    });
