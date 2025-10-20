// features/auth/presentation/providers/otp_verification/otp_verification_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_verification_state.freezed.dart';

@freezed
abstract class OtpVerificationState with _$OtpVerificationState {
  const factory OtpVerificationState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isResending,
    String? errorMessage,
    String? email,
    String? purpose,
    @Default(0) int resendCooldown,
  }) = _OtpVerificationState;

  factory OtpVerificationState.initial() => const OtpVerificationState();
}
