import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_state.freezed.dart';

@freezed
abstract class FeedState with _$FeedState {
  const factory FeedState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    FeedData? feedData,
    String? errorMessage,
  }) = _FeedState;

  factory FeedState.initial() => const FeedState();
}
