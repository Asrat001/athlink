import 'dart:developer';

import 'package:athlink/features/home_feed/data/datasource/feed_remote_datasource.dart';
import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedRemoteDataSource _remoteDataSource;

  FeedRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<FeedResponse>> getFeed() async {
    try {
      final response = await _remoteDataSource.getFeed();
      return ApiResponse.success(data: response);
    } catch (e) {
      log("Get feed error: $e");
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
