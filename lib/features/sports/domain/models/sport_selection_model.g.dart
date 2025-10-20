// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_selection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SportSelectionRequest _$SportSelectionRequestFromJson(
  Map<String, dynamic> json,
) => _SportSelectionRequest(
  sportIds: (json['sportIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SportSelectionRequestToJson(
  _SportSelectionRequest instance,
) => <String, dynamic>{'sportIds': instance.sportIds};

_SportSelectionResponse _$SportSelectionResponseFromJson(
  Map<String, dynamic> json,
) => _SportSelectionResponse(
  message: json['message'] as String,
  success: json['success'] as bool,
);

Map<String, dynamic> _$SportSelectionResponseToJson(
  _SportSelectionResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
