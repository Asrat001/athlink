import 'package:athlink/features/profile/domain/models/profile_model.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class ProfileRepository {
  Future<ApiResponse<ProfileResponse>> getProfile();
}
