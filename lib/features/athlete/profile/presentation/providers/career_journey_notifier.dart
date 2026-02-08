import 'dart:io';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/features/athlete/profile/domain/repository/athlet_profile_repository.dart';
import 'package:athlink/features/athlete/profile/presentation/providers/state/career_journey_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CareerJourneyNotifier extends StateNotifier<CareerJourneyState> {
  final AthletProfileRepository _repository;

  CareerJourneyNotifier(this._repository)
    : super(const CareerJourneyState.loading());

  Future<void> loadCareerJourney(
    String athleteId, {
    int page = 1,
    int limit = 10,
  }) async {
    state = const CareerJourneyState.loading();
    final response = await _repository.getAthleteCareerJourney(
      athleteId: athleteId,
      page: page,
      limit: limit,
    );

    response.when(
      success: (data) {
        state = CareerJourneyState.loaded(data: data);
      },
      failure: (error) {
        state = CareerJourneyState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> createCareer({
    required String athleteId,
    required Map<String, dynamic> data,
    File? logo,
    required void Function() onSuccess,
  }) async {
    final response = await _repository.createCareerJourney(
      athleteId: athleteId,
      careerJourney: data,
      logo: logo,
    );

    response.when(
      success: (newCareer) {
        // Reload the list after successful creation
        loadCareerJourney(athleteId);
        onSuccess();
      },
      failure: (error) {
        state = CareerJourneyState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> updateCareer({
    required String athleteId,
    required String careerId,
    required Map<String, dynamic> data,
    File? logo,
    required void Function() onSuccess,
  }) async {
    final response = await _repository.updateCareerJourney(
      athleteId: athleteId,
      careerJourneyId: careerId,
      careerJourney: data,
      logo: logo,
    );

    response.when(
      success: (updatedCareer) {
        // Reload the list after successful update
        loadCareerJourney(athleteId);
        onSuccess();
      },
      failure: (error) {
        state = CareerJourneyState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> deleteCareer({
    required String athleteId,
    required String careerId,
    required void Function() onSuccess,
  }) async {
    final response = await _repository.deleteCareerJourney(
      athleteId: athleteId,
      careerJourneyId: careerId,
    );

    response.when(
      success: (deleted) {
        if (deleted) {
          // Reload the list after successful deletion
          loadCareerJourney(athleteId);
          onSuccess();
        } else {
          state = const CareerJourneyState.error(
            message: "Failed to delete career record",
          );
        }
      },
      failure: (error) {
        state = CareerJourneyState.error(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }
}
