import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_password_state.freezed.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    String? email,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() => const ForgotPasswordState();
}