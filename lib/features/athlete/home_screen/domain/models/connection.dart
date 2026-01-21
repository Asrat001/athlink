import 'package:athlink/features/sponsor/home_feed/domain/models/feed_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection.freezed.dart';
part 'connection.g.dart';

/// Complete connection model with all fields from API responses
@freezed
abstract class Connection with _$Connection {
  const factory Connection({
    @JsonKey(name: '_id') required String id,
    required String requester,
    required String recipient,
    required String status, // pending, accepted, rejected
    required DateTime requestedAt,
    DateTime? respondedAt,
    AthleteProfile? requesterProfile,
    AthleteProfile? recipientProfile,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}

/// Model for received/sent connection requests
@freezed
abstract class ConnectionRequest with _$ConnectionRequest {
  const factory ConnectionRequest({
    @JsonKey(name: '_id') required String id,
    required AthleteProfile requester,
    required String status,
    required DateTime requestedAt,
  }) = _ConnectionRequest;

  factory ConnectionRequest.fromJson(Map<String, dynamic> json) =>
      _$ConnectionRequestFromJson(json);
}

@freezed
abstract class FriendRequest with _$FriendRequest {
  const factory FriendRequest({
    @JsonKey(name: '_id') required String id,
    Requester? requester,
    required String recipient,
    required String status,
    required DateTime requestedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(name: '__v') required int version,
  }) = _FriendRequest;

  factory FriendRequest.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestFromJson(json);
}

@freezed
abstract class Requester with _$Requester {
  const factory Requester({
    @JsonKey(name: '_id') required String id,
    AthleteProfile? athleteProfile,
  }) = _Requester;

  factory Requester.fromJson(Map<String, dynamic> json) =>
      _$RequesterFromJson(json);
}

@freezed
abstract class AthleteProfile with _$AthleteProfile {
  const factory AthleteProfile({String? name, String? profileImageUrl}) =
      _AthleteProfile;

  factory AthleteProfile.fromJson(Map<String, dynamic> json) =>
      _$AthleteProfileFromJson(json);
}

@freezed
abstract class Recipient with _$Recipient {
  const factory Recipient({@JsonKey(name: '_id') required String id}) =
      _Recipient;

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);
}

@freezed
abstract class SendFriendRequest with _$SendFriendRequest {
  const factory SendFriendRequest({
    @JsonKey(name: '_id') required String id,
    required String requester, // sender user ID
    required FriendRecipient recipient,
    required String status, // pending / accepted / rejected
    required DateTime requestedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @JsonKey(name: '__v') required int version,
  }) = _SendFriendRequest;

  factory SendFriendRequest.fromJson(Map<String, dynamic> json) =>
      _$SendFriendRequestFromJson(json);
}

@freezed
abstract class FriendRecipient with _$FriendRecipient {
  const factory FriendRecipient({@JsonKey(name: '_id') required String id}) =
      _FriendRecipient;

  factory FriendRecipient.fromJson(Map<String, dynamic> json) =>
      _$FriendRecipientFromJson(json);
}

/// Model for connection status checks
@freezed
abstract class ConnectionStatus with _$ConnectionStatus {
  const factory ConnectionStatus({
    required String status, // none, pending, accepted, rejected
    String? connectionId,
    @Default(false) bool isRequester,
  }) = _ConnectionStatus;

  factory ConnectionStatus.fromJson(Map<String, dynamic> json) =>
      _$ConnectionStatusFromJson(json);
}

/// Model for friends list (connected athletes)
@freezed
abstract class ConnectedAthlete with _$ConnectedAthlete {
  const factory ConnectedAthlete({
    required String connectionId,
    required DateTime connectedAt,
    required AthleteProfile user,
    @Default(false) bool isOnline,
    DateTime? lastSeenAt,
  }) = _ConnectedAthlete;

  factory ConnectedAthlete.fromJson(Map<String, dynamic> json) =>
      _$ConnectedAthleteFromJson(json);
}

@freezed
abstract class ConnectedUser with _$ConnectedUser {
  const factory ConnectedUser({
    required String connectionId,
    required DateTime connectedAt,
    required ConnectionUser user,
  }) = _ConnectedUser;

  factory ConnectedUser.fromJson(Map<String, dynamic> json) =>
      _$ConnectedUserFromJson(json);
}

@freezed
abstract class ConnectionUser with _$ConnectionUser {
  const factory ConnectionUser({
    @JsonKey(name: '_id') required String id,
    required bool isOnline,
    DateTime? lastSeenAt,
    required AthleteProfile athleteProfile,
  }) = _ConnectionUser;

  factory ConnectionUser.fromJson(Map<String, dynamic> json) =>
      _$ConnectionUserFromJson(json);
}

/// API response wrapper for connection requests list
@freezed
abstract class ConnectionRequestsResponse with _$ConnectionRequestsResponse {
  const factory ConnectionRequestsResponse({
    @Default(false) bool success,
    @Default('') String message,
    ConnectionRequestsData? data,
  }) = _ConnectionRequestsResponse;

  factory ConnectionRequestsResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectionRequestsResponseFromJson(json);
}

@freezed
abstract class ConnectionRequestsData with _$ConnectionRequestsData {
  const factory ConnectionRequestsData({
    @Default([]) List<ConnectionRequest> requests,
    @Default(0) int count,
  }) = _ConnectionRequestsData;

  factory ConnectionRequestsData.fromJson(Map<String, dynamic> json) =>
      _$ConnectionRequestsDataFromJson(json);
}

/// API response wrapper for connections list
@freezed
abstract class ConnectionsListResponse with _$ConnectionsListResponse {
  const factory ConnectionsListResponse({
    @Default(false) bool success,
    @Default('') String message,
    ConnectionsListData? data,
  }) = _ConnectionsListResponse;

  factory ConnectionsListResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsListResponseFromJson(json);
}

@freezed
abstract class ConnectionsListData with _$ConnectionsListData {
  const factory ConnectionsListData({
    @Default([]) List<ConnectedAthlete> connections,
    @Default(0) int count,
  }) = _ConnectionsListData;

  factory ConnectionsListData.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsListDataFromJson(json);
}

/// API response wrapper for connection status
@freezed
abstract class ConnectionStatusResponse with _$ConnectionStatusResponse {
  const factory ConnectionStatusResponse({
    @Default(false) bool success,
    ConnectionStatus? data,
  }) = _ConnectionStatusResponse;

  factory ConnectionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectionStatusResponseFromJson(json);
}

/// API response wrapper for single connection
@freezed
abstract class ConnectionActionResponse with _$ConnectionActionResponse {
  const factory ConnectionActionResponse({
    @Default(false) bool success,
    @Default('') String message,
    Connection? data,
  }) = _ConnectionActionResponse;

  factory ConnectionActionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConnectionActionResponseFromJson(json);
}
