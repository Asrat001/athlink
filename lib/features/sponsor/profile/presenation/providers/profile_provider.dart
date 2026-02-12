import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/sponsor/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/profile_notifier.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider =
    StateNotifierProvider.family<ProfileNotifier, ProfileState, String>((
      ref,
      sponsorId,
    ) {
      return ProfileNotifier(sl<ProfileRepository>());
    });
