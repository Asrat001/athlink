import 'dart:io';

import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/handlers/dio_client.dart';
import 'package:athlink/shared/repository/base_repository.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  ProfileRemoteDataSource(this._httpClient);

  Future<ProfileResponse> getProfile() async {
    return await safeApiCall(
      path: "/auth/profile",
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/auth/profile");
      },
      fromData: (data) {
        print("📦 Raw profile API data: $data");
        try {
          final result = ProfileResponse.fromJson(data);
          print("✅ Successfully parsed ProfileResponse");
          return result;
        } catch (e, stackTrace) {
          print("❌ Failed to parse ProfileResponse: $e");
          print("   Stack trace: $stackTrace");
          rethrow;
        }
      },
    );
  }

  Future<UpdateSponsorProfileResponse> updateSponsorProfile({
    String? name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
  }) async {
    return await safeApiCall(
      path: "/sponsors/profile",
      apiCall: () async {
        final formData = FormData();

        // Add text fields only if provided
        if (name != null) {
          formData.fields.add(MapEntry('name', name));
        }
        if (description != null) {
          formData.fields.add(MapEntry('description', description));
        }
        if (address != null) {
          formData.fields.add(MapEntry('address', address));
        }

        // Add image files only if provided
        if (profileImage != null) {
          formData.files.add(
            MapEntry(
              'profileImage',
              await MultipartFile.fromFile(
                profileImage.path,
                filename: profileImage.path.split('/').last,
              ),
            ),
          );
        }

        if (bannerImage != null) {
          formData.files.add(
            MapEntry(
              'bannerImage',
              await MultipartFile.fromFile(
                bannerImage.path,
                filename: bannerImage.path.split('/').last,
              ),
            ),
          );
        }

        return await _httpClient
            .client(requireAuth: true)
            .put("/sponsors/profile", data: formData);
      },
      fromData: (data) => UpdateSponsorProfileResponse.fromJson(data),
    );
  }
}
