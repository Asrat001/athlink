import 'package:athlink/features/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/profile/presenation/providers/state/profile_state.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileNotifier(this._profileRepository) : super(ProfileState.initial());

  Future<void> getProfile() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _profileRepository.getProfile();

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          profileUser: data.user,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void resetState() {
    state = ProfileState.initial();
  }
}
