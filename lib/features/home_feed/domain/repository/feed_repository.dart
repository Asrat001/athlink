import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class FeedRepository {
  Future<ApiResponse<FeedResponse>> getFeed();
}
