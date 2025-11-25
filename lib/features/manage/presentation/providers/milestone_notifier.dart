import 'package:athlink/features/manage/domain/models/milestone_model.dart';
import 'package:athlink/features/manage/domain/repository/milestone_repository.dart';
import 'package:athlink/features/manage/presentation/providers/state/milestone_state.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MilestoneNotifier extends StateNotifier<MilestoneState> {
  final MilestoneRepository _milestoneRepository;

  MilestoneNotifier(this._milestoneRepository)
    : super(MilestoneState.initial());

  Future<void> createMilestone({
    required String athleteId,
    required String jobId,
    required CreateMilestoneRequest request,
  }) async {
    state = state.copyWith(
      isLoading: true,
      isSuccess: false,
      errorMessage: null,
      successMessage: null,
    );

    final response = await _milestoneRepository.createMilestone(
      athleteId: athleteId,
      jobId: jobId,
      request: request,
    );
    // debugPrint("milestone $response");
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          milestone: data.milestone,
          successMessage: data.message,
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

  Future<void> getMilestones({String? status}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _milestoneRepository.getMilestones(status: status);

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          milestones: data.data.milestones,
          milestonesCount: data.data.count,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> getAthleteMilestones({String? status}) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _milestoneRepository.getAthleteMilestones(
      status: status,
    );

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          milestones: data.data.milestones,
          milestonesCount: data.data.count,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> getMilestoneById({required String milestoneId}) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      milestone: null,
    );

    final response = await _milestoneRepository.getMilestoneById(
      milestoneId: milestoneId,
    );

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          milestone: data.milestone,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  Future<void> updateMilestoneStatus({
    required String milestoneId,
    required UpdateMilestoneStatusRequest request,
  }) async {
    state = state.copyWith(
      isLoading: true,
      isSuccess: false,
      errorMessage: null,
      successMessage: null,
    );

    final response = await _milestoneRepository.updateMilestoneStatus(
      milestoneId: milestoneId,
      request: request,
    );

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          milestone: data.milestone,
          successMessage: data.message,
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
    state = MilestoneState.initial();
  }
}
