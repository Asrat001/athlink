import 'package:athlink/features/auth/domain/models/login_model.dart';
import 'package:athlink/features/auth/domain/repository/authentication_repository.dart';
import 'package:athlink/core/handlers/api_response.dart';
import 'package:athlink/core/services/local_storage_service.dart';
import 'package:athlink/di.dart';
import 'package:athlink/core/handlers/network_exceptions.dart';
import 'package:athlink/core/services/google_sign_in_service.dart';
import 'package:athlink/features/auth/domain/models/registration_response.dart'
    hide User;
import 'package:athlink/features/auth/data/datasource/authentication_remote_data_source.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  final AuthenticationRemoteDataSource remoteDataSource;
  final GoogleAuthService googleAuthService;
  AuthenticationRepositoryImpl({
    required this.remoteDataSource,
    required this.googleAuthService,
  });

  @override
  Future<ApiResponse<LoginResponse>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<ApiResponse<bool>> signOut() async {
    try {
      final storageService = sl<LocalStorageService>();
      storageService.deleteAccessToken();
      storageService.deleteRefreshToken();
      storageService.deleteUserData();
      return ApiResponse.success(data: true);
    } catch (error) {
      return ApiResponse.failure(
        error: NetworkExceptions.defaultError("error logging out"),
      );
    }
  }

  @override
  Future<ApiResponse<RegistrationResponse>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    // required String name,
    required String accountType,
  }) async {
    return await remoteDataSource.register(
      email: email,
      password: password,
      // name: name,
      accountType: accountType,
    );
  }

  @override
  Future<ApiResponse<LoginResponse>> googleSignIn() async {
    try {
      // Step 1: Attempt Google Sign-In
      final result = await googleAuthService.signInWithGoogle();

      // Handle Google sign-in result
      return await result.when(
        success: (account) async {
          // Step 2: Retrieve ID token from Google account
          final authentication = await account.authentication;
          final idToken = authentication.idToken;
          if (idToken == null) {
            return const ApiResponse.failure(
              error: NetworkExceptions.defaultError("Missing Google ID token"),
            );
          }

          // Step 3: Send ID token to your backend for verification / login
          return await remoteDataSource.loginWithGoogle(idToken: idToken);
        },
        failure: (error) {
          // Google sign-in failed (user canceled or other issue)
          return ApiResponse.failure(
            error: NetworkExceptions.defaultError(error.toString()),
          );
        },
      );
    } catch (e) {
      // Outer failure (Google sign-in threw exception)
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResponse<User>> changeRole({required String role}) async {
    return await remoteDataSource.changeRole(role: role);
  }

  @override
  Future<ApiResponse<bool>> forgotPassword({required String email}) async {
    return await remoteDataSource.forgotPassword(email: email);
  }

  @override
  Future<ApiResponse<bool>> resetPassword({
    required String password,
    required String otp,
  }) async {
    return await remoteDataSource.resetPassword(password: password, otp: otp);
  }

  @override
  Future<ApiResponse<LoginResponse>> verifyAccount({
    required String otp,
  }) async {
    return await remoteDataSource.verifyAccount(otp: otp);
  }
}
