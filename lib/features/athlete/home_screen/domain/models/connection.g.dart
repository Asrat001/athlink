// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Connection _$ConnectionFromJson(Map<String, dynamic> json) => _Connection(
  id: json['_id'] as String,
  requester: json['requester'] as String,
  recipient: json['recipient'] as String,
  status: json['status'] as String,
  requestedAt: DateTime.parse(json['requestedAt'] as String),
  respondedAt: json['respondedAt'] == null
      ? null
      : DateTime.parse(json['respondedAt'] as String),
  requesterProfile: json['requesterProfile'] == null
      ? null
      : AthleteProfile.fromJson(
          json['requesterProfile'] as Map<String, dynamic>,
        ),
  recipientProfile: json['recipientProfile'] == null
      ? null
      : AthleteProfile.fromJson(
          json['recipientProfile'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ConnectionToJson(_Connection instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requester': instance.requester,
      'recipient': instance.recipient,
      'status': instance.status,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'respondedAt': instance.respondedAt?.toIso8601String(),
      'requesterProfile': instance.requesterProfile,
      'recipientProfile': instance.recipientProfile,
    };

_ConnectionRequest _$ConnectionRequestFromJson(Map<String, dynamic> json) =>
    _ConnectionRequest(
      id: json['_id'] as String,
      requester: AthleteProfile.fromJson(
        json['requester'] as Map<String, dynamic>,
      ),
      status: json['status'] as String,
      requestedAt: DateTime.parse(json['requestedAt'] as String),
    );

Map<String, dynamic> _$ConnectionRequestToJson(_ConnectionRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requester': instance.requester,
      'status': instance.status,
      'requestedAt': instance.requestedAt.toIso8601String(),
    };

_FriendRequest _$FriendRequestFromJson(Map<String, dynamic> json) =>
    _FriendRequest(
      id: json['_id'] as String,
      requester: json['requester'] == null
          ? null
          : Requester.fromJson(json['requester'] as Map<String, dynamic>),
      recipient: json['recipient'] as String,
      status: json['status'] as String,
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$FriendRequestToJson(_FriendRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requester': instance.requester,
      'recipient': instance.recipient,
      'status': instance.status,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.version,
    };

_Requester _$RequesterFromJson(Map<String, dynamic> json) => _Requester(
  id: json['_id'] as String,
  athleteProfile: json['athleteProfile'] == null
      ? null
      : AthleteProfile.fromJson(json['athleteProfile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RequesterToJson(_Requester instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'athleteProfile': instance.athleteProfile,
    };

_AthleteProfile _$AthleteProfileFromJson(Map<String, dynamic> json) =>
    _AthleteProfile(
      name: json['name'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$AthleteProfileToJson(_AthleteProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profileImageUrl': instance.profileImageUrl,
    };

_Recipient _$RecipientFromJson(Map<String, dynamic> json) =>
    _Recipient(id: json['_id'] as String);

Map<String, dynamic> _$RecipientToJson(_Recipient instance) =>
    <String, dynamic>{'_id': instance.id};

_SendFriendRequest _$SendFriendRequestFromJson(Map<String, dynamic> json) =>
    _SendFriendRequest(
      id: json['_id'] as String,
      requester: json['requester'] as String,
      recipient: FriendRecipient.fromJson(
        json['recipient'] as Map<String, dynamic>,
      ),
      status: json['status'] as String,
      requestedAt: DateTime.parse(json['requestedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$SendFriendRequestToJson(_SendFriendRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'requester': instance.requester,
      'recipient': instance.recipient,
      'status': instance.status,
      'requestedAt': instance.requestedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.version,
    };

_FriendRecipient _$FriendRecipientFromJson(Map<String, dynamic> json) =>
    _FriendRecipient(id: json['_id'] as String);

Map<String, dynamic> _$FriendRecipientToJson(_FriendRecipient instance) =>
    <String, dynamic>{'_id': instance.id};

_ConnectionStatus _$ConnectionStatusFromJson(Map<String, dynamic> json) =>
    _ConnectionStatus(
      status: json['status'] as String,
      connectionId: json['connectionId'] as String?,
      isRequester: json['isRequester'] as bool? ?? false,
    );

Map<String, dynamic> _$ConnectionStatusToJson(_ConnectionStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'connectionId': instance.connectionId,
      'isRequester': instance.isRequester,
    };

_ConnectedAthlete _$ConnectedAthleteFromJson(Map<String, dynamic> json) =>
    _ConnectedAthlete(
      connectionId: json['connectionId'] as String,
      connectedAt: DateTime.parse(json['connectedAt'] as String),
      user: AthleteProfile.fromJson(json['user'] as Map<String, dynamic>),
      isOnline: json['isOnline'] as bool? ?? false,
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
    );

Map<String, dynamic> _$ConnectedAthleteToJson(_ConnectedAthlete instance) =>
    <String, dynamic>{
      'connectionId': instance.connectionId,
      'connectedAt': instance.connectedAt.toIso8601String(),
      'user': instance.user,
      'isOnline': instance.isOnline,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
    };

_ConnectedUser _$ConnectedUserFromJson(Map<String, dynamic> json) =>
    _ConnectedUser(
      connectionId: json['connectionId'] as String,
      connectedAt: DateTime.parse(json['connectedAt'] as String),
      user: ConnectionUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConnectedUserToJson(_ConnectedUser instance) =>
    <String, dynamic>{
      'connectionId': instance.connectionId,
      'connectedAt': instance.connectedAt.toIso8601String(),
      'user': instance.user,
    };

_ConnectionUser _$ConnectionUserFromJson(Map<String, dynamic> json) =>
    _ConnectionUser(
      id: json['_id'] as String,
      isOnline: json['isOnline'] as bool,
      lastSeenAt: json['lastSeenAt'] == null
          ? null
          : DateTime.parse(json['lastSeenAt'] as String),
      athleteProfile: AthleteProfile.fromJson(
        json['athleteProfile'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ConnectionUserToJson(_ConnectionUser instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'isOnline': instance.isOnline,
      'lastSeenAt': instance.lastSeenAt?.toIso8601String(),
      'athleteProfile': instance.athleteProfile,
    };

_ConnectionRequestsResponse _$ConnectionRequestsResponseFromJson(
  Map<String, dynamic> json,
) => _ConnectionRequestsResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : ConnectionRequestsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConnectionRequestsResponseToJson(
  _ConnectionRequestsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ConnectionRequestsData _$ConnectionRequestsDataFromJson(
  Map<String, dynamic> json,
) => _ConnectionRequestsData(
  requests:
      (json['requests'] as List<dynamic>?)
          ?.map((e) => ConnectionRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ConnectionRequestsDataToJson(
  _ConnectionRequestsData instance,
) => <String, dynamic>{'requests': instance.requests, 'count': instance.count};

_ConnectionsListResponse _$ConnectionsListResponseFromJson(
  Map<String, dynamic> json,
) => _ConnectionsListResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : ConnectionsListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConnectionsListResponseToJson(
  _ConnectionsListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_ConnectionsListData _$ConnectionsListDataFromJson(Map<String, dynamic> json) =>
    _ConnectionsListData(
      connections:
          (json['connections'] as List<dynamic>?)
              ?.map((e) => ConnectedAthlete.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ConnectionsListDataToJson(
  _ConnectionsListData instance,
) => <String, dynamic>{
  'connections': instance.connections,
  'count': instance.count,
};

_ConnectionStatusResponse _$ConnectionStatusResponseFromJson(
  Map<String, dynamic> json,
) => _ConnectionStatusResponse(
  success: json['success'] as bool? ?? false,
  data: json['data'] == null
      ? null
      : ConnectionStatus.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConnectionStatusResponseToJson(
  _ConnectionStatusResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

_ConnectionActionResponse _$ConnectionActionResponseFromJson(
  Map<String, dynamic> json,
) => _ConnectionActionResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : Connection.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ConnectionActionResponseToJson(
  _ConnectionActionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
