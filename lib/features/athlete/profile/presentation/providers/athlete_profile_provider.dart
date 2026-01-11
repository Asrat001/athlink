import 'package:athlink/di.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/athlete_profile_notifier.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/athlete_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final athleteProfileProvider =
    StateNotifierProvider<AthleteProfileNotifier, AthleteProfileState>((ref) {
      return AthleteProfileNotifier(sl<AthletProfileRepository>());
    });
