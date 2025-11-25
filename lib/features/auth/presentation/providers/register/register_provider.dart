
import 'package:athlink/features/auth/presentation/providers/register/register_notifer.dart';
import 'package:athlink/features/auth/presentation/providers/register/state/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../di.dart';
import '../../../domain/repository/authentication_repository.dart';

final registartionProvider = StateNotifierProvider.autoDispose<RegisterStateNotifier, RegisterState>(
  (ref) {
    final authRepository = sl<IAuthenticationRepository>();
    return RegisterStateNotifier(authRepository);
  },
);
