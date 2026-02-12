import 'dart:io';

import 'package:athlink/features/sponsor/profile/domain/repository/profile_repository.dart';
import 'package:athlink/features/sponsor/profile/presenation/providers/state/profile_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileNotifier(this._profileRepository) : super(ProfileState.initial());

  Future<void> getProfile(String sponsorId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _profileRepository.getProfile(sponsorId);

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

  Future<bool> updateSponsorProfile({
    required String sponsorId,
    required String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
    String? websiteUrl,
    Map<String, String>? socialLinks,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _profileRepository.updateSponsorProfile(
      name: name,
      description: description,
      address: address,
      profileImage: profileImage,
      bannerImage: bannerImage,
      websiteUrl: websiteUrl,
      socialLinks: socialLinks,
    );

    return response.when(
      success: (data) async {
        // Refresh profile data after successful update
        await getProfile(sponsorId);
        return true;
      },
      failure: (error) {
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
