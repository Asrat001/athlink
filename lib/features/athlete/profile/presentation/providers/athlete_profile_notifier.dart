import 'dart:io';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/athlete_profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AthleteProfileNotifier extends StateNotifier<AthleteProfileState> {
  final AthletProfileRepository _repository;

  AthleteProfileNotifier(this._repository)
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
    state = const AthleteProfileState.loading();
    final response = await _repository.updateAthleteProfile(
      athleteId: athleteId,
      data: data,
      profileImage: profileImage,
      coverImage: coverImage,
    );
    response.when(
      success: (data) {
        state = AthleteProfileState.loaded(profile: data);
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
