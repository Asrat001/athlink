import 'package:athlink/features/sponsor/home_feed/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/sponsor/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource _remoteDataSource;

  FeedRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<FeedResponse>> getFeed() async {
    return await _remoteDataSource.getFeed();
  }
}
