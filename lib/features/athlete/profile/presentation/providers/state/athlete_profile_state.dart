
import 'package:athlink/features/athlete/profile/domain/models/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'athlete_profile_state.freezed.dart';

@freezed
class AthleteProfileState with _$AthleteProfileState {
  const factory AthleteProfileState.loading() = _Loading;
  const factory AthleteProfileState.loaded({required ProfileModel profile}) = _Loaded;
  const factory AthleteProfileState.error({required String error}) = _Error;
  const factory AthleteProfileState.hasNoData() = _HasNoData;
}
