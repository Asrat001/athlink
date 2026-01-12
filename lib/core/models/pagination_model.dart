import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
abstract class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required int currentPage,
    required int totalPages,
    required int totalCount,
    required int limit,
    required bool hasNextPage,
    required bool hasPrevPage,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
