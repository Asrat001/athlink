import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/shared/handlers/api_response.dart';

abstract class IAuthenticationRepository {
  Future<ApiResponse<LoginResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<ApiResponse<User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<void> signOut();
}
