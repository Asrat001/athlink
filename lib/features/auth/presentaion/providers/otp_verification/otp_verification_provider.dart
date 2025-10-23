import 'package:athlink/di.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/features/auth/presentaion/providers/otp_verification/otp_verification_notifier.dart';
import 'package:athlink/features/auth/presentaion/providers/otp_verification/state/otp_verification_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpVerificationProvider =
    StateNotifierProvider<OtpVerificationNotifier, OtpVerificationState>((ref) {
      return OtpVerificationNotifier(sl<IAuthenticationRepository>());
    });
