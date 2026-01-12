import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/career_journey_notifier.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/career_journey_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final careerJourneyProvider =
    StateNotifierProvider<CareerJourneyNotifier, CareerJourneyState>((ref) {
      return CareerJourneyNotifier(sl<AthletProfileRepository>());
    });
