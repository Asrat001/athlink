import 'dart:io';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/competition_results_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompetitionResultsNotifier
    extends StateNotifier<CompetitionResultsState> {
  final AthletProfileRepository _repository;

  CompetitionResultsNotifier(this._repository)
    : super(const CompetitionResultsState.loading());

  Future<void> loadResults(
    String athleteId, {
    int page = 1,
    int limit = 10,
  }) async {
    state = const CompetitionResultsState.loading();
    final response = await _repository.getAthleteCompetitionResults(
      athleteId: athleteId,
      page: page,
      limit: limit,
    );

    response.when(
      success: (data) {
        state = CompetitionResultsState.loaded(data: data);
      },
      failure: (error) {
        state = CompetitionResultsState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> createResult({
    required String athleteId,
    required Map<String, dynamic> data,
    List<File>? media,
    required void Function() onSuccess,
  }) async {
    final response = await _repository.createCompetitionResult(
      athleteId: athleteId,
      competitionResult: data,
      media: media,
    );

    response.when(
      success: (newResult) {
        // Reload the list after successful creation
        loadResults(athleteId);
        onSuccess();
      },
      failure: (error) {
        state = CompetitionResultsState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> updateResult({
    required String athleteId,
    required String resultId,
    required Map<String, dynamic> data,
    List<File>? media,
    required void Function() onSuccess,
  }) async {
    final response = await _repository.updateCompetitionResult(
      athleteId: athleteId,
      resultId: resultId,
      competitionResult: data,
      media: media,
    );

    response.when(
      success: (updatedResult) {
        // Reload the list after successful update
        loadResults(athleteId);
        onSuccess();
      },
      failure: (error) {
        state = CompetitionResultsState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }
}
