import 'dart:developer';
import 'dart:io';

import 'package:athlink/features/profile/data/datasource/profile_remote_datasource.dart';
import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/features/profile/domain/repository/profile_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter/cupertino.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<ProfileResponse>> getProfile() async {
    try {
      log("📡 Fetching profile from API...");
      final response = await _remoteDataSource.getProfile();
      debugPrint("✅ Profile API response received");
      debugPrint("   User ID: ${response.user.id}");
      debugPrint("   Email: ${response.user.email}");
      debugPrint("   Role: ${response.user.role}");
      log(
        "   Sponsor Profile: ${response.user.sponsorProfile?.name ?? 'null'}",
      );
      // log("   jobs: ${response.user.sponsorProfile!.jobPosts}");
      return ApiResponse.success(data: response);
    } catch (e, stackTrace) {
      log("❌ Get profile error: $e");
      log("   Stack trace: $stackTrace");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<UpdateSponsorProfileResponse>> updateSponsorProfile({
    String? name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
  }) async {
    try {
      final response = await _remoteDataSource.updateSponsorProfile(
        name: name,
        description: description,
        address: address,
        profileImage: profileImage,
        bannerImage: bannerImage,
      );
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Update sponsor profile error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
