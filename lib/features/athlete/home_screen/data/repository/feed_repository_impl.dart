import 'package:athlink/features/athlete/home_screen/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/athlete/home_screen/domain/repository/feed_repository.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/api_response.dart';

class AthleteFeedRepositoryImpl implements AthleteFeedRepository {
  final AthleteFeedRemoteDataSource _remoteDataSource;

  AthleteFeedRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<FeedResponse>> getAthleteFeed() async {
    return await _remoteDataSource.getAthleteFeed();
  }
}
