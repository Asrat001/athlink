import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_model.freezed.dart';
part 'sport_model.g.dart';

@freezed
abstract class Sport with _$Sport {
  const factory Sport({
    @JsonKey(name: "_id") required String id,
    required String name,
    required bool isVisible,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(name: "sportCategory") required String sportCategoryId,
  }) = _Sport;

  factory Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);
}
