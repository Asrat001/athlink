import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/features/auth/presentaion/providers/forgot_password/forgot_password_notifier.dart';
import 'package:athlink/features/auth/presentaion/providers/forgot_password/state/forgot_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../di.dart';

final forgotPasswordProvider =
StateNotifierProvider<ForgotPasswordNotifier, ForgotPasswordState>((ref) {
  return ForgotPasswordNotifier(sl<IAuthenticationRepository>());
});