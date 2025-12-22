import 'package:athlink/features/home_feed/domain/models/feed_models.dart';
import 'package:athlink/features/home_feed/domain/repository/feed_repository.dart';
import 'package:athlink/features/home_feed/presentation/providers/state/feed_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/foundation.dart';

class FeedNotifier extends StateNotifier<FeedState> {
  final FeedRepository _feedRepository;

  FeedNotifier(this._feedRepository) : super(FeedState.initial());

  Future<void> getFeed() async {
    state = FeedState.loading();

    final response = await _feedRepository.getFeed();

    response.when(
      success: (data) async {
        if (data.data != null) {
          // Run grouping in background isolate to prevent UI freeze
          final groupedAthletes = await compute(
            groupAthletesBySport,
            data.data!.athletes,
          );

          state = FeedState.success(
            feedData: data.data!,
            athletesBySport: groupedAthletes,
          );
        } else {
          state = FeedState.error(errorMessage: "No data found");
        }
      },
      failure: (error) {
        state = FeedState.error(
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  /// Groups athletes by their sports
  /// Returns a Map where key is sport name and value is list of {athlete, sport} pairs
  static Map<String, List<Athlete>> groupAthletesBySport(
    List<Athlete> athletes,
  ) {
    final Map<String, List<Athlete>> athletesBySport = {};

    for (var athlete in athletes) {
      // Each athlete can have multiple sports
      for (var sport in athlete.sport) {
        final sportName = sport.name ?? 'Unknown Sport';

        // Create the sport group if it doesn't exist
        if (!athletesBySport.containsKey(sportName)) {
          athletesBySport[sportName] = [];
        }

        // Add athlete-sport pair to the group
        athletesBySport[sportName]!.add(athlete);
      }
    }

    return athletesBySport;
  }

  void resetState() {
    state = FeedState.initial();
  }
}
