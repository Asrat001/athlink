import 'package:athlink/di.dart' show sl;
import 'package:athlink/features/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/profile/presenation/providers/profile_notifier.dart';
import 'package:athlink/features/profile/presenation/providers/state/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((
  ref,
) {
  return ProfileNotifier(sl<ProfileRepository>());
});
