import 'dart:io';

import 'package:athlink/features/sponsor/profile/data/datasource/profile_remote_datasource.dart';
import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/features/sponsor/profile/domain/repository/profile_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<ProfileResponse>> getProfile() async {
    return await _remoteDataSource.getProfile();
  }

  @override
  Future<ApiResponse<UpdateSponsorProfileResponse>> updateSponsorProfile({
    String? name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
    String? websiteUrl,
    Map<String, String>? socialLinks,
  }) async {
    return await _remoteDataSource.updateSponsorProfile(
      name: name,
      description: description,
      address: address,
      profileImage: profileImage,
      bannerImage: bannerImage,
      websiteUrl: websiteUrl,
      socialLinks: socialLinks,
    );
  }
}
