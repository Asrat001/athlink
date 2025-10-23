import 'package:freezed_annotation/freezed_annotation.dart';

part 'sport_selection_model.freezed.dart';
part 'sport_selection_model.g.dart';

@freezed
abstract class SportSelectionRequest with _$SportSelectionRequest {
  const factory SportSelectionRequest({required List<String> sportIds}) =
      _SportSelectionRequest;

  factory SportSelectionRequest.fromJson(Map<String, dynamic> json) =>
      _$SportSelectionRequestFromJson(json);
}

@freezed
abstract class SportSelectionResponse with _$SportSelectionResponse {
  const factory SportSelectionResponse({
    required String message,
    required bool success,
  }) = _SportSelectionResponse;

  factory SportSelectionResponse.fromJson(Map<String, dynamic> json) =>
      _$SportSelectionResponseFromJson(json);
}
