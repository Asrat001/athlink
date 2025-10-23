// features/sports/data/repository/sports_repository_impl.dart
import 'dart:developer';
import 'package:athlink/features/sports/data/datasource/sports_remote_data_source.dart';
import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:athlink/features/sports/domain/models/sport_selection_model.dart';
import 'package:athlink/features/sports/domain/repository/sports_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class SportsRepositoryImpl implements ISportsRepository {
  final SportsRemoteDataSource remoteDataSource;
  SportsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<List<Sport>>> getSports() async {
    try {
      final response = await remoteDataSource.getSports();
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get sports error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<SportSelectionResponse>> selectSports({
    required List<String> sportIds,
  }) async {
    try {
      final response = await remoteDataSource.selectSports(sportIds: sportIds);
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Select sports error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
