// features/sports/presentation/providers/sports_provider.dart
import 'dart:ui';

import 'package:athlink/di.dart';
import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:athlink/features/sports/presentaion/providers/state/sports_state.dart';
import 'package:athlink/shared/services/internet_connection_service.dart';
import 'package:athlink/shared/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:athlink/features/sports/domain/repository/sports_repository.dart';
import 'package:athlink/shared/handlers/api_response.dart';
import 'package:athlink/shared/handlers/network_exceptions.dart';

class SportsNotifier extends StateNotifier<SportsState> {
  final ISportsRepository _sportsRepository;
  SportsNotifier(this._sportsRepository) : super(SportsState.initial());

  Future<void> getSports() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final response = await _sportsRepository.getSports();

    // Use Freezed union pattern with when method
    response.when(
      success: (sports) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          sports: sports,
          errorMessage: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
          sports: [],
        );
      },
    );
  }

  void shuffleSportsFromIndex(int index) {
    final List<Sport> updatedSports = List.from(state.sports);
    final top = updatedSports.sublist(0, index);
    final bottom = updatedSports.sublist(index);
    bottom.shuffle();
    updatedSports
      ..clear()
      ..addAll([...top, ...bottom]);

    state = state.copyWith(sports: updatedSports);
  }

  void updateSportsOrder(List<Sport> newOrder) {
    state = state.copyWith(sports: newOrder);
  }

  void resetState() {
    state = SportsState.initial();
  }
}

final sportSelectionProvider =
    StateNotifierProvider<SportSelectionNotifier, SportSelectionState>((ref) {
      return SportSelectionNotifier(sl<ISportsRepository>());
    });

class SportSelectionState {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  const SportSelectionState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  SportSelectionState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return SportSelectionState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory SportSelectionState.initial() => const SportSelectionState();
}

class SportSelectionNotifier extends StateNotifier<SportSelectionState> {
  final ISportsRepository _iSportsRepository;

  // Navigation callback
  VoidCallback? _onSuccessCallback;

  SportSelectionNotifier(this._iSportsRepository)
    : super(SportSelectionState.initial());

  // Set success callback from UI
  void setSuccessCallback(VoidCallback onSuccess) {
    _onSuccessCallback = onSuccess;
  }

  Future<void> submitSelectedSports({
    required List<String> sportIds,
    required BuildContext context,
  }) async {
    // final connected = await sl<AppConnectivity>().connectivity();
    // if (!connected) {
    //   if (context.mounted) {
    //     AppHelpers.showErrorFlash(
    //       context,
    //       "You are currently offline, Please check your internet connection",
    //     );
    //   }
    //   return;
    // }

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    final response = await _iSportsRepository.selectSports(sportIds: sportIds);

    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
        );

        if (context.mounted) {
          AppHelpers.showSuccessToast(context, data.message);
        }

        // Trigger success callback after delay
        Future.delayed(const Duration(milliseconds: 1500), () {
          _onSuccessCallback?.call();
        });
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: NetworkExceptions.getErrorMessage(error),
        );

        if (context.mounted) {
          AppHelpers.showErrorFlash(
            context,
            NetworkExceptions.getErrorMessage(error),
          );
        }
      },
    );
  }

  void resetState() {
    _onSuccessCallback = null;
    state = SportSelectionState.initial();
  }
}
