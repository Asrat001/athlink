import 'dart:io';

import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse<ProfileResponse>> getProfile();

  Future<ApiResponse<UpdateSponsorProfileResponse>> updateSponsorProfile({
    String name,
    String? description,
    String? address,
    File? profileImage,
    File? bannerImage,
  });
}
