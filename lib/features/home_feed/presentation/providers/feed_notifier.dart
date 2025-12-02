import 'package:athlink/features/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/features/home_feed/presentation/providers/state/feed_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedNotifier extends StateNotifier<FeedState> {
  final FeedRepository _feedRepository;

  FeedNotifier(this._feedRepository) : super(FeedState.initial());

  Future<void> getFeed() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _feedRepository.getFeed();

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          feedData: data.data,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  void resetState() {
    state = FeedState.initial();
  }
}
