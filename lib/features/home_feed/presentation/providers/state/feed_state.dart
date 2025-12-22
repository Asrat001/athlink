import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.freezed.dart';

@freezed
abstract class FeedState with _$FeedState {
  const factory FeedState.loading() = _FeedStateLoading;
  const factory FeedState.success({
    required FeedData feedData,
    required Map<String, List<Athlete>> athletesBySport,
  }) = _FeedStateSuccess;
  const factory FeedState.error({required String errorMessage}) =
      _FeedStateError;

  factory FeedState.initial() = Initial;
}
