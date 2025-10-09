
import 'package:athlink/features/auth/presentaion/providers/login/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../di.dart';
import '../../../domain/repository/authentication_repository.dart';
import 'login_notifer.dart';

final loginProvider = StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (ref) {
    final authRepository = sl<IAuthenticationRepository>();
    return LoginNotifier(authRepository);
  },
);