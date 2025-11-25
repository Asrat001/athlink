import 'package:athlink/di.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/features/auth/presentation/providers/reset_password/reset_password_notifier.dart';
import 'package:athlink/features/auth/presentation/providers/reset_password/state/reset_password_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
      return ResetPasswordNotifier(sl<IAuthenticationRepository>());
    });
