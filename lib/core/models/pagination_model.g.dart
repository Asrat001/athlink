// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    _PaginationModel(
      currentPage: (json['currentPage'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      hasNextPage: json['hasNextPage'] as bool,
      hasPrevPage: json['hasPrevPage'] as bool,
    );

Map<String, dynamic> _$PaginationModelToJson(_PaginationModel instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalCount': instance.totalCount,
      'limit': instance.limit,
      'hasNextPage': instance.hasNextPage,
      'hasPrevPage': instance.hasPrevPage,
    };
