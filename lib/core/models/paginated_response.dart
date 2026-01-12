import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:athlink/core/models/pagination_model.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract  class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required PaginationModel pagination,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);
}
