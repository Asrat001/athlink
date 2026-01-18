// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConnectionData _$ConnectionDataFromJson(Map<String, dynamic> json) =>
    _ConnectionData(
      id: json['_id'] as String,
      requester: json['requester'] as String,
      recipient: json['recipient'] as String,
      status: json['status'] as String,
      requestedAt: json['requestedAt'] as String,
    );

Map<String, dynamic> _$ConnectionDataToJson(_ConnectionData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requester': instance.requester,
      'recipient': instance.recipient,
      'status': instance.status,
      'requestedAt': instance.requestedAt,
    };

_ConnectionResponse _$ConnectionResponseFromJson(Map<String, dynamic> json) =>
    _ConnectionResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      connection: json['connection'] == null
          ? null
          : ConnectionData.fromJson(json['connection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConnectionResponseToJson(_ConnectionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'connection': instance.connection,
    };
