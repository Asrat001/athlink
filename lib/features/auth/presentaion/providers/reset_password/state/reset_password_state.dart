// features/auth/presentation/providers/reset_password/reset_password_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? email,
    String? token,
    String? otp,
  }) = _ResetPasswordState;

  factory ResetPasswordState.initial() => const ResetPasswordState();
}
