// features/sports/data/repository/sports_repository_impl.dart
import 'package:athlink/features/sports/data/datasource/sports_remote_data_source.dart';
import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:athlink/features/sports/domain/models/sport_selection_model.dart';
import 'package:athlink/features/sports/domain/repository/sports_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class SportsRepositoryImpl implements ISportsRepository {
  final SportsRemoteDataSource remoteDataSource;
  SportsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResponse<List<Sport>>> getSports() async {
    return await remoteDataSource.getSports();
  }

  @override
  Future<ApiResponse<SportSelectionResponse>> selectSports({
    required List<String> sportIds,
  }) async {
    return await remoteDataSource.selectSports(sportIds: sportIds);
  }
}
