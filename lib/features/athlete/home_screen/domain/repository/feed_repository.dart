import 'package:athlink/features/athlete/home_screen/domain/models/connection_models.dart';
import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:athlink/core/handlers/api_response.dart';

abstract class AthleteFeedRepository {
  Future<ApiResponse<FeedResponse>> getAthleteFeed();
  Future<ApiResponse<ConnectionResponse>> sendConnectionRequest(
    String athleteId,
  );
}
