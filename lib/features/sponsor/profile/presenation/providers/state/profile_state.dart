import 'package:athlink/features/sponsor/profile/domain/models/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    ProfileUser? profileUser,
    String? errorMessage,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();
}
