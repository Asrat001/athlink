import 'dart:io';

import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:athlink/core/handlers/dio_client.dart';
import 'package:athlink/core/repository/base_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSource extends BaseRepository {
  final DioHttpClient _httpClient;

  ProfileRemoteDataSource(this._httpClient);

  Future<ApiResponse<ProfileResponse>> getProfile() async {
    return await safeApiCall(
      apiCall: () async {
        return await _httpClient.client(requireAuth: true).get("/auth/profile");
      },
      fromData: (data) {
        // print("📦 Raw profile API data: $data");
        try {
          final result = ProfileResponse.fromJson(data);
          // print("✅ Successfully parsed ProfileResponse");
          return result;
        } catch (e, stackTrace) {
          // print("❌ Failed to parse ProfileResponse: $e");
          // print("   Stack trace: $stackTrace");
          rethrow;
        }
      },
    );
  }

  Future<ApiResponse<UpdateSponsorProfileResponse>> updateSponsorProfile({
    String? name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
    String? websiteUrl,
    Map<String, String>? socialLinks,
  }) async {
    return await safeApiCall(
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
        if (websiteUrl != null) {
          formData.fields.add(MapEntry('websiteUrl', websiteUrl));
        }
        if (socialLinks != null) {
          socialLinks.forEach((key, value) {
            if (value.isNotEmpty) {
              formData.fields.add(MapEntry('socialLinks[$key]', value));
            }
          });
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
