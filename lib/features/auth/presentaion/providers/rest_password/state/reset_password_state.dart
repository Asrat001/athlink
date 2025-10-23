
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _ResetPasswordState;

  factory ResetPasswordState.initial() => const ResetPasswordState();
}