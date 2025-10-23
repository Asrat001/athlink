// features/sports/presentation/providers/sports_state.dart
import 'package:athlink/features/sports/domain/models/sport_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sports_state.freezed.dart';

@freezed
abstract class SportsState with _$SportsState {
  const factory SportsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default([]) List<Sport> sports,
    String? errorMessage,
  }) = _SportsState;

  factory SportsState.initial() => const SportsState();
}