
import 'package:athlink/shared/extensions/account_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isSocialSignIn,
    @Default(true) bool isNewUser,
    @Default(null)
    String? errorMessage,
    AccountType? selectedAccountType,
})= _RegisterState;

  const RegisterState._();
}