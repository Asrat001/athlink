import 'dart:io';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/athlete_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AthleteProfileNotifier extends StateNotifier<AthleteProfileState> {
  final AthletProfileRepository _repository;
  final Ref ref;

  AthleteProfileNotifier(this._repository, this.ref)
    : super(AthleteProfileState.loading());

  Future<void> getProfile(String athleteId) async {
    final response = await _repository.getAthleteProfile(athleteId: athleteId);
    response.when(
      success: (data) {
        if (data == null) {
          state = AthleteProfileState.hasNoData();
        } else {
          state = AthleteProfileState.loaded(profile: data);
        }
      },
      failure: (error) {
        state = AthleteProfileState.error(
          error: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> updateProfile({
    required String athleteId,
    required Map<String, dynamic> data,
    required void Function() onSuccess,
    File? profileImage,
    File? coverImage,
  }) async {
    // Capture current profile to preserve data not returned by update (like sports)
    final currentProfile = state.maybeWhen(
      loaded: (profile) => profile,
      orElse: () => null,
    );

    state = const AthleteProfileState.loading();
    final response = await _repository.updateAthleteProfile(
      athleteId: athleteId,
      data: data,
      profileImage: profileImage,
      coverImage: coverImage,
    );
    response.when(
      success: (data) {
        // If the backend returns a profile without sports, but we had them locally,
        // preserve the local sports data.
        var updatedProfile = data;
        if ((updatedProfile.sport == null || updatedProfile.sport!.isEmpty) &&
            currentProfile?.sport != null &&
            currentProfile!.sport!.isNotEmpty) {
          updatedProfile = updatedProfile.copyWith(sport: currentProfile.sport);
        }

        state = AthleteProfileState.loaded(profile: updatedProfile);
        onSuccess();
      },
      failure: (error) {
        state = AthleteProfileState.error(
          error: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }
}
