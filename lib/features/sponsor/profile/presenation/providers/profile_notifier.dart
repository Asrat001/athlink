import 'dart:io';

import 'package:athlink/features/sponsor/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/state/profile_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileNotifier(this._profileRepository) : super(ProfileState.initial());

  Future<void> getProfile() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _profileRepository.getProfile();

    response.when(
      success: (data) {
        print('✅ Profile loaded successfully');
        print('   Name: ${data.user.sponsorProfile?.name}');
        print('   Description: ${data.user.sponsorProfile?.description}');
        print('   Address: ${data.user.sponsorProfile?.address}');
        // print('   user: ${data.user}');
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          profileUser: data.user,
          errorMessage: null,
        );
      },
      failure: (error) {
        print(
          '❌ Profile load failed: ${NetworkExceptions.getErrorMessage(error)}',
        );
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<bool> updateSponsorProfile({
    required String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
  }) async {
    print(
      '📝 Updating profile with: name=$name, desc=$description, addr=$address',
    );
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _profileRepository.updateSponsorProfile(
      name: name,
      description: description,
      address: address,
      profileImage: profileImage,
      bannerImage: bannerImage,
    );

    return response.when(
      success: (data) async {
        print('✅ Profile update successful: ${data.message}');
        // Refresh profile data after successful update
        await getProfile();
        // Don't overwrite state here - getProfile() already sets it correctly
        print('✅ Profile refresh completed');
        return true;
      },
      failure: (error) {
        print(
          '❌ Profile update failed: ${NetworkExceptions.getErrorMessage(error)}',
        );
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
        return false;
      },
    );
  }

  void resetState() {
    state = ProfileState.initial();
  }
}
