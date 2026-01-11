import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String name,
    @JsonKey(defaultValue: "") required String country,
    @JsonKey(defaultValue: "") required String location,
    @JsonKey(defaultValue: "") required String bio,
    String? profilePhoto,
    String? coverPhoto,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
