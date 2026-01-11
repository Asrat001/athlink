import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/features/athlete/profile/data/datasource/athlete_profile_remote_data_source.dart';
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';

class AthleteProfileRepositoryImpl implements AthletProfileRepository {
  final AthleteProfileRemoteDataSource _remoteDataSource;

  AthleteProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<ProfileModel?>> getAthleteProfile({
    required String athleteId,
  }) async {
    return await _remoteDataSource.getAthleteProfile(athleteId: athleteId);
  }

  @override
  Future<ApiResponse<ProfileModel>> updateAthleteProfile({
    required String athleteId,
    required Map<String, dynamic> data,
  }) async {
    return await _remoteDataSource.updateAthleteProfile(
      athleteId: athleteId,
      data: data,
    );
  }
}
