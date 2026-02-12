// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileResponse {

 bool get success; ProfileUser get user;
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<ProfileResponse> get copyWith => _$ProfileResponseCopyWithImpl<ProfileResponse>(this as ProfileResponse, _$identity);

  /// Serializes this ProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,user);

@override
String toString() {
  return 'ProfileResponse(success: $success, user: $user)';
}


}

/// @nodoc
abstract mixin class $ProfileResponseCopyWith<$Res>  {
  factory $ProfileResponseCopyWith(ProfileResponse value, $Res Function(ProfileResponse) _then) = _$ProfileResponseCopyWithImpl;
@useResult
$Res call({
 bool success, ProfileUser user
});


$ProfileUserCopyWith<$Res> get user;

}
/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._self, this._then);

  final ProfileResponse _self;
  final $Res Function(ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? user = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileUser,
  ));
}
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileUserCopyWith<$Res> get user {
  
  return $ProfileUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileResponse].
extension ProfileResponsePatterns on ProfileResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  ProfileUser user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.success,_that.user);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  ProfileUser user)  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse():
return $default(_that.success,_that.user);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  ProfileUser user)?  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.success,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileResponse implements ProfileResponse {
  const _ProfileResponse({required this.success, required this.user});
  factory _ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

@override final  bool success;
@override final  ProfileUser user;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileResponseCopyWith<_ProfileResponse> get copyWith => __$ProfileResponseCopyWithImpl<_ProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,user);

@override
String toString() {
  return 'ProfileResponse(success: $success, user: $user)';
}


}

/// @nodoc
abstract mixin class _$ProfileResponseCopyWith<$Res> implements $ProfileResponseCopyWith<$Res> {
  factory _$ProfileResponseCopyWith(_ProfileResponse value, $Res Function(_ProfileResponse) _then) = __$ProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, ProfileUser user
});


@override $ProfileUserCopyWith<$Res> get user;

}
/// @nodoc
class __$ProfileResponseCopyWithImpl<$Res>
    implements _$ProfileResponseCopyWith<$Res> {
  __$ProfileResponseCopyWithImpl(this._self, this._then);

  final _ProfileResponse _self;
  final $Res Function(_ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? user = null,}) {
  return _then(_ProfileResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as ProfileUser,
  ));
}

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileUserCopyWith<$Res> get user {
  
  return $ProfileUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ProfileUser {

@JsonKey(name: "_id") String get id; String get email; String? get name; String? get role; String get authProvider; bool get isEmailVerified; List<ProfileSport> get sport; DateTime get createdAt; DateTime get updatedAt;@JsonKey(name: "__v") int get version; String? get googleId; SponsorProfile? get sponsorProfile; List<dynamic> get sponsoredBy;
/// Create a copy of ProfileUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileUserCopyWith<ProfileUser> get copyWith => _$ProfileUserCopyWithImpl<ProfileUser>(this as ProfileUser, _$identity);

  /// Serializes this ProfileUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&const DeepCollectionEquality().equals(other.sport, sport)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.googleId, googleId) || other.googleId == googleId)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile)&&const DeepCollectionEquality().equals(other.sponsoredBy, sponsoredBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,role,authProvider,isEmailVerified,const DeepCollectionEquality().hash(sport),createdAt,updatedAt,version,googleId,sponsorProfile,const DeepCollectionEquality().hash(sponsoredBy));

@override
String toString() {
  return 'ProfileUser(id: $id, email: $email, name: $name, role: $role, authProvider: $authProvider, isEmailVerified: $isEmailVerified, sport: $sport, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, googleId: $googleId, sponsorProfile: $sponsorProfile, sponsoredBy: $sponsoredBy)';
}


}

/// @nodoc
abstract mixin class $ProfileUserCopyWith<$Res>  {
  factory $ProfileUserCopyWith(ProfileUser value, $Res Function(ProfileUser) _then) = _$ProfileUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String email, String? name, String? role, String authProvider, bool isEmailVerified, List<ProfileSport> sport, DateTime createdAt, DateTime updatedAt,@JsonKey(name: "__v") int version, String? googleId, SponsorProfile? sponsorProfile, List<dynamic> sponsoredBy
});


$SponsorProfileCopyWith<$Res>? get sponsorProfile;

}
/// @nodoc
class _$ProfileUserCopyWithImpl<$Res>
    implements $ProfileUserCopyWith<$Res> {
  _$ProfileUserCopyWithImpl(this._self, this._then);

  final ProfileUser _self;
  final $Res Function(ProfileUser) _then;

/// Create a copy of ProfileUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? name = freezed,Object? role = freezed,Object? authProvider = null,Object? isEmailVerified = null,Object? sport = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,Object? googleId = freezed,Object? sponsorProfile = freezed,Object? sponsoredBy = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,authProvider: null == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as String,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as List<ProfileSport>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,googleId: freezed == googleId ? _self.googleId : googleId // ignore: cast_nullable_to_non_nullable
as String?,sponsorProfile: freezed == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as SponsorProfile?,sponsoredBy: null == sponsoredBy ? _self.sponsoredBy : sponsoredBy // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of ProfileUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorProfileCopyWith<$Res>? get sponsorProfile {
    if (_self.sponsorProfile == null) {
    return null;
  }

  return $SponsorProfileCopyWith<$Res>(_self.sponsorProfile!, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileUser].
extension ProfileUserPatterns on ProfileUser {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileUser() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileUser value)  $default,){
final _that = this;
switch (_that) {
case _ProfileUser():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileUser value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileUser() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String email,  String? name,  String? role,  String authProvider,  bool isEmailVerified,  List<ProfileSport> sport,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "__v")  int version,  String? googleId,  SponsorProfile? sponsorProfile,  List<dynamic> sponsoredBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileUser() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.role,_that.authProvider,_that.isEmailVerified,_that.sport,_that.createdAt,_that.updatedAt,_that.version,_that.googleId,_that.sponsorProfile,_that.sponsoredBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String email,  String? name,  String? role,  String authProvider,  bool isEmailVerified,  List<ProfileSport> sport,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "__v")  int version,  String? googleId,  SponsorProfile? sponsorProfile,  List<dynamic> sponsoredBy)  $default,) {final _that = this;
switch (_that) {
case _ProfileUser():
return $default(_that.id,_that.email,_that.name,_that.role,_that.authProvider,_that.isEmailVerified,_that.sport,_that.createdAt,_that.updatedAt,_that.version,_that.googleId,_that.sponsorProfile,_that.sponsoredBy);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String email,  String? name,  String? role,  String authProvider,  bool isEmailVerified,  List<ProfileSport> sport,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "__v")  int version,  String? googleId,  SponsorProfile? sponsorProfile,  List<dynamic> sponsoredBy)?  $default,) {final _that = this;
switch (_that) {
case _ProfileUser() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.role,_that.authProvider,_that.isEmailVerified,_that.sport,_that.createdAt,_that.updatedAt,_that.version,_that.googleId,_that.sponsorProfile,_that.sponsoredBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileUser implements ProfileUser {
  const _ProfileUser({@JsonKey(name: "_id") required this.id, required this.email, this.name, this.role, this.authProvider = 'google', this.isEmailVerified = false, final  List<ProfileSport> sport = const [], required this.createdAt, required this.updatedAt, @JsonKey(name: "__v") this.version = 0, this.googleId, this.sponsorProfile, final  List<dynamic> sponsoredBy = const []}): _sport = sport,_sponsoredBy = sponsoredBy;
  factory _ProfileUser.fromJson(Map<String, dynamic> json) => _$ProfileUserFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String email;
@override final  String? name;
@override final  String? role;
@override@JsonKey() final  String authProvider;
@override@JsonKey() final  bool isEmailVerified;
 final  List<ProfileSport> _sport;
@override@JsonKey() List<ProfileSport> get sport {
  if (_sport is EqualUnmodifiableListView) return _sport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sport);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey(name: "__v") final  int version;
@override final  String? googleId;
@override final  SponsorProfile? sponsorProfile;
 final  List<dynamic> _sponsoredBy;
@override@JsonKey() List<dynamic> get sponsoredBy {
  if (_sponsoredBy is EqualUnmodifiableListView) return _sponsoredBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sponsoredBy);
}


/// Create a copy of ProfileUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileUserCopyWith<_ProfileUser> get copyWith => __$ProfileUserCopyWithImpl<_ProfileUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&const DeepCollectionEquality().equals(other._sport, _sport)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.googleId, googleId) || other.googleId == googleId)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile)&&const DeepCollectionEquality().equals(other._sponsoredBy, _sponsoredBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,role,authProvider,isEmailVerified,const DeepCollectionEquality().hash(_sport),createdAt,updatedAt,version,googleId,sponsorProfile,const DeepCollectionEquality().hash(_sponsoredBy));

@override
String toString() {
  return 'ProfileUser(id: $id, email: $email, name: $name, role: $role, authProvider: $authProvider, isEmailVerified: $isEmailVerified, sport: $sport, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, googleId: $googleId, sponsorProfile: $sponsorProfile, sponsoredBy: $sponsoredBy)';
}


}

/// @nodoc
abstract mixin class _$ProfileUserCopyWith<$Res> implements $ProfileUserCopyWith<$Res> {
  factory _$ProfileUserCopyWith(_ProfileUser value, $Res Function(_ProfileUser) _then) = __$ProfileUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String email, String? name, String? role, String authProvider, bool isEmailVerified, List<ProfileSport> sport, DateTime createdAt, DateTime updatedAt,@JsonKey(name: "__v") int version, String? googleId, SponsorProfile? sponsorProfile, List<dynamic> sponsoredBy
});


@override $SponsorProfileCopyWith<$Res>? get sponsorProfile;

}
/// @nodoc
class __$ProfileUserCopyWithImpl<$Res>
    implements _$ProfileUserCopyWith<$Res> {
  __$ProfileUserCopyWithImpl(this._self, this._then);

  final _ProfileUser _self;
  final $Res Function(_ProfileUser) _then;

/// Create a copy of ProfileUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? name = freezed,Object? role = freezed,Object? authProvider = null,Object? isEmailVerified = null,Object? sport = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,Object? googleId = freezed,Object? sponsorProfile = freezed,Object? sponsoredBy = null,}) {
  return _then(_ProfileUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,authProvider: null == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as String,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,sport: null == sport ? _self._sport : sport // ignore: cast_nullable_to_non_nullable
as List<ProfileSport>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,googleId: freezed == googleId ? _self.googleId : googleId // ignore: cast_nullable_to_non_nullable
as String?,sponsorProfile: freezed == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as SponsorProfile?,sponsoredBy: null == sponsoredBy ? _self._sponsoredBy : sponsoredBy // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of ProfileUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorProfileCopyWith<$Res>? get sponsorProfile {
    if (_self.sponsorProfile == null) {
    return null;
  }

  return $SponsorProfileCopyWith<$Res>(_self.sponsorProfile!, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// @nodoc
mixin _$ProfileSport {

@JsonKey(name: "_id") String get id; String get name; SportCategory get categoryId; String get icon;
/// Create a copy of ProfileSport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSportCopyWith<ProfileSport> get copyWith => _$ProfileSportCopyWithImpl<ProfileSport>(this as ProfileSport, _$identity);

  /// Serializes this ProfileSport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,icon);

@override
String toString() {
  return 'ProfileSport(id: $id, name: $name, categoryId: $categoryId, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $ProfileSportCopyWith<$Res>  {
  factory $ProfileSportCopyWith(ProfileSport value, $Res Function(ProfileSport) _then) = _$ProfileSportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String name, SportCategory categoryId, String icon
});


$SportCategoryCopyWith<$Res> get categoryId;

}
/// @nodoc
class _$ProfileSportCopyWithImpl<$Res>
    implements $ProfileSportCopyWith<$Res> {
  _$ProfileSportCopyWithImpl(this._self, this._then);

  final ProfileSport _self;
  final $Res Function(ProfileSport) _then;

/// Create a copy of ProfileSport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? icon = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as SportCategory,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProfileSport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<$Res> get categoryId {
  
  return $SportCategoryCopyWith<$Res>(_self.categoryId, (value) {
    return _then(_self.copyWith(categoryId: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileSport].
extension ProfileSportPatterns on ProfileSport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSport value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSport value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  SportCategory categoryId,  String icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSport() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.icon);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  SportCategory categoryId,  String icon)  $default,) {final _that = this;
switch (_that) {
case _ProfileSport():
return $default(_that.id,_that.name,_that.categoryId,_that.icon);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name,  SportCategory categoryId,  String icon)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSport() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileSport implements ProfileSport {
  const _ProfileSport({@JsonKey(name: "_id") required this.id, required this.name, required this.categoryId, required this.icon});
  factory _ProfileSport.fromJson(Map<String, dynamic> json) => _$ProfileSportFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;
@override final  SportCategory categoryId;
@override final  String icon;

/// Create a copy of ProfileSport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSportCopyWith<_ProfileSport> get copyWith => __$ProfileSportCopyWithImpl<_ProfileSport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileSportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,icon);

@override
String toString() {
  return 'ProfileSport(id: $id, name: $name, categoryId: $categoryId, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$ProfileSportCopyWith<$Res> implements $ProfileSportCopyWith<$Res> {
  factory _$ProfileSportCopyWith(_ProfileSport value, $Res Function(_ProfileSport) _then) = __$ProfileSportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String name, SportCategory categoryId, String icon
});


@override $SportCategoryCopyWith<$Res> get categoryId;

}
/// @nodoc
class __$ProfileSportCopyWithImpl<$Res>
    implements _$ProfileSportCopyWith<$Res> {
  __$ProfileSportCopyWithImpl(this._self, this._then);

  final _ProfileSport _self;
  final $Res Function(_ProfileSport) _then;

/// Create a copy of ProfileSport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? icon = null,}) {
  return _then(_ProfileSport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as SportCategory,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProfileSport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<$Res> get categoryId {
  
  return $SportCategoryCopyWith<$Res>(_self.categoryId, (value) {
    return _then(_self.copyWith(categoryId: value));
  });
}
}


/// @nodoc
mixin _$SportCategory {

@JsonKey(name: "_id") String get id; String get name;
/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<SportCategory> get copyWith => _$SportCategoryCopyWithImpl<SportCategory>(this as SportCategory, _$identity);

  /// Serializes this SportCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SportCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SportCategoryCopyWith<$Res>  {
  factory $SportCategoryCopyWith(SportCategory value, $Res Function(SportCategory) _then) = _$SportCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String name
});




}
/// @nodoc
class _$SportCategoryCopyWithImpl<$Res>
    implements $SportCategoryCopyWith<$Res> {
  _$SportCategoryCopyWithImpl(this._self, this._then);

  final SportCategory _self;
  final $Res Function(SportCategory) _then;

/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SportCategory].
extension SportCategoryPatterns on SportCategory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportCategory value)  $default,){
final _that = this;
switch (_that) {
case _SportCategory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportCategory value)?  $default,){
final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _SportCategory():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportCategory implements SportCategory {
  const _SportCategory({@JsonKey(name: "_id") required this.id, required this.name});
  factory _SportCategory.fromJson(Map<String, dynamic> json) => _$SportCategoryFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;

/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportCategoryCopyWith<_SportCategory> get copyWith => __$SportCategoryCopyWithImpl<_SportCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SportCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SportCategoryCopyWith<$Res> implements $SportCategoryCopyWith<$Res> {
  factory _$SportCategoryCopyWith(_SportCategory value, $Res Function(_SportCategory) _then) = __$SportCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String name
});




}
/// @nodoc
class __$SportCategoryCopyWithImpl<$Res>
    implements _$SportCategoryCopyWith<$Res> {
  __$SportCategoryCopyWithImpl(this._self, this._then);

  final _SportCategory _self;
  final $Res Function(_SportCategory) _then;

/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_SportCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SponsorProfile {

 Stats get stats; String get address; String get bannerImageUrl; String get description; String get name; String get profileImageUrl; List<JobPost> get jobPosts; String get websiteUrl; Map<String, String> get socialLinks;
/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorProfileCopyWith<SponsorProfile> get copyWith => _$SponsorProfileCopyWithImpl<SponsorProfile>(this as SponsorProfile, _$identity);

  /// Serializes this SponsorProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorProfile&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.address, address) || other.address == address)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&const DeepCollectionEquality().equals(other.jobPosts, jobPosts)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stats,address,bannerImageUrl,description,name,profileImageUrl,const DeepCollectionEquality().hash(jobPosts),websiteUrl,const DeepCollectionEquality().hash(socialLinks));

@override
String toString() {
  return 'SponsorProfile(stats: $stats, address: $address, bannerImageUrl: $bannerImageUrl, description: $description, name: $name, profileImageUrl: $profileImageUrl, jobPosts: $jobPosts, websiteUrl: $websiteUrl, socialLinks: $socialLinks)';
}


}

/// @nodoc
abstract mixin class $SponsorProfileCopyWith<$Res>  {
  factory $SponsorProfileCopyWith(SponsorProfile value, $Res Function(SponsorProfile) _then) = _$SponsorProfileCopyWithImpl;
@useResult
$Res call({
 Stats stats, String address, String bannerImageUrl, String description, String name, String profileImageUrl, List<JobPost> jobPosts, String websiteUrl, Map<String, String> socialLinks
});


$StatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$SponsorProfileCopyWithImpl<$Res>
    implements $SponsorProfileCopyWith<$Res> {
  _$SponsorProfileCopyWithImpl(this._self, this._then);

  final SponsorProfile _self;
  final $Res Function(SponsorProfile) _then;

/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stats = null,Object? address = null,Object? bannerImageUrl = null,Object? description = null,Object? name = null,Object? profileImageUrl = null,Object? jobPosts = null,Object? websiteUrl = null,Object? socialLinks = null,}) {
  return _then(_self.copyWith(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Stats,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bannerImageUrl: null == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: null == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String,jobPosts: null == jobPosts ? _self.jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<JobPost>,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,socialLinks: null == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}
/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatsCopyWith<$Res> get stats {
  
  return $StatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorProfile].
extension SponsorProfilePatterns on SponsorProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorProfile value)  $default,){
final _that = this;
switch (_that) {
case _SponsorProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Stats stats,  String address,  String bannerImageUrl,  String description,  String name,  String profileImageUrl,  List<JobPost> jobPosts,  String websiteUrl,  Map<String, String> socialLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
return $default(_that.stats,_that.address,_that.bannerImageUrl,_that.description,_that.name,_that.profileImageUrl,_that.jobPosts,_that.websiteUrl,_that.socialLinks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Stats stats,  String address,  String bannerImageUrl,  String description,  String name,  String profileImageUrl,  List<JobPost> jobPosts,  String websiteUrl,  Map<String, String> socialLinks)  $default,) {final _that = this;
switch (_that) {
case _SponsorProfile():
return $default(_that.stats,_that.address,_that.bannerImageUrl,_that.description,_that.name,_that.profileImageUrl,_that.jobPosts,_that.websiteUrl,_that.socialLinks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Stats stats,  String address,  String bannerImageUrl,  String description,  String name,  String profileImageUrl,  List<JobPost> jobPosts,  String websiteUrl,  Map<String, String> socialLinks)?  $default,) {final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
return $default(_that.stats,_that.address,_that.bannerImageUrl,_that.description,_that.name,_that.profileImageUrl,_that.jobPosts,_that.websiteUrl,_that.socialLinks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorProfile implements SponsorProfile {
  const _SponsorProfile({this.stats = const Stats(), this.address = '', this.bannerImageUrl = '', this.description = '', this.name = '', this.profileImageUrl = '', final  List<JobPost> jobPosts = const [], this.websiteUrl = '', final  Map<String, String> socialLinks = const {}}): _jobPosts = jobPosts,_socialLinks = socialLinks;
  factory _SponsorProfile.fromJson(Map<String, dynamic> json) => _$SponsorProfileFromJson(json);

@override@JsonKey() final  Stats stats;
@override@JsonKey() final  String address;
@override@JsonKey() final  String bannerImageUrl;
@override@JsonKey() final  String description;
@override@JsonKey() final  String name;
@override@JsonKey() final  String profileImageUrl;
 final  List<JobPost> _jobPosts;
@override@JsonKey() List<JobPost> get jobPosts {
  if (_jobPosts is EqualUnmodifiableListView) return _jobPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobPosts);
}

@override@JsonKey() final  String websiteUrl;
 final  Map<String, String> _socialLinks;
@override@JsonKey() Map<String, String> get socialLinks {
  if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_socialLinks);
}


/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorProfileCopyWith<_SponsorProfile> get copyWith => __$SponsorProfileCopyWithImpl<_SponsorProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorProfile&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.address, address) || other.address == address)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&const DeepCollectionEquality().equals(other._jobPosts, _jobPosts)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stats,address,bannerImageUrl,description,name,profileImageUrl,const DeepCollectionEquality().hash(_jobPosts),websiteUrl,const DeepCollectionEquality().hash(_socialLinks));

@override
String toString() {
  return 'SponsorProfile(stats: $stats, address: $address, bannerImageUrl: $bannerImageUrl, description: $description, name: $name, profileImageUrl: $profileImageUrl, jobPosts: $jobPosts, websiteUrl: $websiteUrl, socialLinks: $socialLinks)';
}


}

/// @nodoc
abstract mixin class _$SponsorProfileCopyWith<$Res> implements $SponsorProfileCopyWith<$Res> {
  factory _$SponsorProfileCopyWith(_SponsorProfile value, $Res Function(_SponsorProfile) _then) = __$SponsorProfileCopyWithImpl;
@override @useResult
$Res call({
 Stats stats, String address, String bannerImageUrl, String description, String name, String profileImageUrl, List<JobPost> jobPosts, String websiteUrl, Map<String, String> socialLinks
});


@override $StatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$SponsorProfileCopyWithImpl<$Res>
    implements _$SponsorProfileCopyWith<$Res> {
  __$SponsorProfileCopyWithImpl(this._self, this._then);

  final _SponsorProfile _self;
  final $Res Function(_SponsorProfile) _then;

/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stats = null,Object? address = null,Object? bannerImageUrl = null,Object? description = null,Object? name = null,Object? profileImageUrl = null,Object? jobPosts = null,Object? websiteUrl = null,Object? socialLinks = null,}) {
  return _then(_SponsorProfile(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Stats,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,bannerImageUrl: null == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: null == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String,jobPosts: null == jobPosts ? _self._jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<JobPost>,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,socialLinks: null == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatsCopyWith<$Res> get stats {
  
  return $StatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$Stats {

 int get athletesSponsored; int get globalPartners; int get sponsorshipCampaigns;
/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsCopyWith<Stats> get copyWith => _$StatsCopyWithImpl<Stats>(this as Stats, _$identity);

  /// Serializes this Stats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Stats&&(identical(other.athletesSponsored, athletesSponsored) || other.athletesSponsored == athletesSponsored)&&(identical(other.globalPartners, globalPartners) || other.globalPartners == globalPartners)&&(identical(other.sponsorshipCampaigns, sponsorshipCampaigns) || other.sponsorshipCampaigns == sponsorshipCampaigns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athletesSponsored,globalPartners,sponsorshipCampaigns);

@override
String toString() {
  return 'Stats(athletesSponsored: $athletesSponsored, globalPartners: $globalPartners, sponsorshipCampaigns: $sponsorshipCampaigns)';
}


}

/// @nodoc
abstract mixin class $StatsCopyWith<$Res>  {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) _then) = _$StatsCopyWithImpl;
@useResult
$Res call({
 int athletesSponsored, int globalPartners, int sponsorshipCampaigns
});




}
/// @nodoc
class _$StatsCopyWithImpl<$Res>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._self, this._then);

  final Stats _self;
  final $Res Function(Stats) _then;

/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athletesSponsored = null,Object? globalPartners = null,Object? sponsorshipCampaigns = null,}) {
  return _then(_self.copyWith(
athletesSponsored: null == athletesSponsored ? _self.athletesSponsored : athletesSponsored // ignore: cast_nullable_to_non_nullable
as int,globalPartners: null == globalPartners ? _self.globalPartners : globalPartners // ignore: cast_nullable_to_non_nullable
as int,sponsorshipCampaigns: null == sponsorshipCampaigns ? _self.sponsorshipCampaigns : sponsorshipCampaigns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Stats].
extension StatsPatterns on Stats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Stats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Stats value)  $default,){
final _that = this;
switch (_that) {
case _Stats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Stats value)?  $default,){
final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int athletesSponsored,  int globalPartners,  int sponsorshipCampaigns)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that.athletesSponsored,_that.globalPartners,_that.sponsorshipCampaigns);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int athletesSponsored,  int globalPartners,  int sponsorshipCampaigns)  $default,) {final _that = this;
switch (_that) {
case _Stats():
return $default(_that.athletesSponsored,_that.globalPartners,_that.sponsorshipCampaigns);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int athletesSponsored,  int globalPartners,  int sponsorshipCampaigns)?  $default,) {final _that = this;
switch (_that) {
case _Stats() when $default != null:
return $default(_that.athletesSponsored,_that.globalPartners,_that.sponsorshipCampaigns);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Stats implements Stats {
  const _Stats({this.athletesSponsored = 0, this.globalPartners = 0, this.sponsorshipCampaigns = 0});
  factory _Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

@override@JsonKey() final  int athletesSponsored;
@override@JsonKey() final  int globalPartners;
@override@JsonKey() final  int sponsorshipCampaigns;

/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsCopyWith<_Stats> get copyWith => __$StatsCopyWithImpl<_Stats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Stats&&(identical(other.athletesSponsored, athletesSponsored) || other.athletesSponsored == athletesSponsored)&&(identical(other.globalPartners, globalPartners) || other.globalPartners == globalPartners)&&(identical(other.sponsorshipCampaigns, sponsorshipCampaigns) || other.sponsorshipCampaigns == sponsorshipCampaigns));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athletesSponsored,globalPartners,sponsorshipCampaigns);

@override
String toString() {
  return 'Stats(athletesSponsored: $athletesSponsored, globalPartners: $globalPartners, sponsorshipCampaigns: $sponsorshipCampaigns)';
}


}

/// @nodoc
abstract mixin class _$StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$StatsCopyWith(_Stats value, $Res Function(_Stats) _then) = __$StatsCopyWithImpl;
@override @useResult
$Res call({
 int athletesSponsored, int globalPartners, int sponsorshipCampaigns
});




}
/// @nodoc
class __$StatsCopyWithImpl<$Res>
    implements _$StatsCopyWith<$Res> {
  __$StatsCopyWithImpl(this._self, this._then);

  final _Stats _self;
  final $Res Function(_Stats) _then;

/// Create a copy of Stats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athletesSponsored = null,Object? globalPartners = null,Object? sponsorshipCampaigns = null,}) {
  return _then(_Stats(
athletesSponsored: null == athletesSponsored ? _self.athletesSponsored : athletesSponsored // ignore: cast_nullable_to_non_nullable
as int,globalPartners: null == globalPartners ? _self.globalPartners : globalPartners // ignore: cast_nullable_to_non_nullable
as int,sponsorshipCampaigns: null == sponsorshipCampaigns ? _self.sponsorshipCampaigns : sponsorshipCampaigns // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$JobPost {

@JsonKey(name: "_id") String get id; Timeline get timeline; String get title;@JsonKey(name: "sport_id") String get category; String get location; String get description; String get requirements; DateTime get createdAt; List<String> get mediaUrls; List<dynamic> get applicants;@JsonKey(name: "price") dynamic get price; String get currency;
/// Create a copy of JobPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPostCopyWith<JobPost> get copyWith => _$JobPostCopyWithImpl<JobPost>(this as JobPost, _$identity);

  /// Serializes this JobPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPost&&(identical(other.id, id) || other.id == id)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.applicants, applicants)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeline,title,category,location,description,requirements,createdAt,const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(applicants),const DeepCollectionEquality().hash(price),currency);

@override
String toString() {
  return 'JobPost(id: $id, timeline: $timeline, title: $title, category: $category, location: $location, description: $description, requirements: $requirements, createdAt: $createdAt, mediaUrls: $mediaUrls, applicants: $applicants, price: $price, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $JobPostCopyWith<$Res>  {
  factory $JobPostCopyWith(JobPost value, $Res Function(JobPost) _then) = _$JobPostCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, Timeline timeline, String title,@JsonKey(name: "sport_id") String category, String location, String description, String requirements, DateTime createdAt, List<String> mediaUrls, List<dynamic> applicants,@JsonKey(name: "price") dynamic price, String currency
});


$TimelineCopyWith<$Res> get timeline;

}
/// @nodoc
class _$JobPostCopyWithImpl<$Res>
    implements $JobPostCopyWith<$Res> {
  _$JobPostCopyWithImpl(this._self, this._then);

  final JobPost _self;
  final $Res Function(JobPost) _then;

/// Create a copy of JobPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timeline = null,Object? title = null,Object? category = null,Object? location = null,Object? description = null,Object? requirements = null,Object? createdAt = null,Object? mediaUrls = null,Object? applicants = null,Object? price = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as Timeline,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,applicants: null == applicants ? _self.applicants : applicants // ignore: cast_nullable_to_non_nullable
as List<dynamic>,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of JobPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimelineCopyWith<$Res> get timeline {
  
  return $TimelineCopyWith<$Res>(_self.timeline, (value) {
    return _then(_self.copyWith(timeline: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobPost].
extension JobPostPatterns on JobPost {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPost() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPost value)  $default,){
final _that = this;
switch (_that) {
case _JobPost():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPost value)?  $default,){
final _that = this;
switch (_that) {
case _JobPost() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  String category,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls,  List<dynamic> applicants, @JsonKey(name: "price")  dynamic price,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPost() when $default != null:
return $default(_that.id,_that.timeline,_that.title,_that.category,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applicants,_that.price,_that.currency);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  String category,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls,  List<dynamic> applicants, @JsonKey(name: "price")  dynamic price,  String currency)  $default,) {final _that = this;
switch (_that) {
case _JobPost():
return $default(_that.id,_that.timeline,_that.title,_that.category,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applicants,_that.price,_that.currency);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  String category,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls,  List<dynamic> applicants, @JsonKey(name: "price")  dynamic price,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _JobPost() when $default != null:
return $default(_that.id,_that.timeline,_that.title,_that.category,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applicants,_that.price,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPost implements JobPost {
  const _JobPost({@JsonKey(name: "_id") required this.id, required this.timeline, required this.title, @JsonKey(name: "sport_id") required this.category, this.location = '', this.description = '', this.requirements = '', required this.createdAt, final  List<String> mediaUrls = const [], final  List<dynamic> applicants = const [], @JsonKey(name: "price") this.price = 0, this.currency = 'USD'}): _mediaUrls = mediaUrls,_applicants = applicants;
  factory _JobPost.fromJson(Map<String, dynamic> json) => _$JobPostFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  Timeline timeline;
@override final  String title;
@override@JsonKey(name: "sport_id") final  String category;
@override@JsonKey() final  String location;
@override@JsonKey() final  String description;
@override@JsonKey() final  String requirements;
@override final  DateTime createdAt;
 final  List<String> _mediaUrls;
@override@JsonKey() List<String> get mediaUrls {
  if (_mediaUrls is EqualUnmodifiableListView) return _mediaUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mediaUrls);
}

 final  List<dynamic> _applicants;
@override@JsonKey() List<dynamic> get applicants {
  if (_applicants is EqualUnmodifiableListView) return _applicants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applicants);
}

@override@JsonKey(name: "price") final  dynamic price;
@override@JsonKey() final  String currency;

/// Create a copy of JobPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPostCopyWith<_JobPost> get copyWith => __$JobPostCopyWithImpl<_JobPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPost&&(identical(other.id, id) || other.id == id)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._applicants, _applicants)&&const DeepCollectionEquality().equals(other.price, price)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeline,title,category,location,description,requirements,createdAt,const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_applicants),const DeepCollectionEquality().hash(price),currency);

@override
String toString() {
  return 'JobPost(id: $id, timeline: $timeline, title: $title, category: $category, location: $location, description: $description, requirements: $requirements, createdAt: $createdAt, mediaUrls: $mediaUrls, applicants: $applicants, price: $price, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$JobPostCopyWith<$Res> implements $JobPostCopyWith<$Res> {
  factory _$JobPostCopyWith(_JobPost value, $Res Function(_JobPost) _then) = __$JobPostCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, Timeline timeline, String title,@JsonKey(name: "sport_id") String category, String location, String description, String requirements, DateTime createdAt, List<String> mediaUrls, List<dynamic> applicants,@JsonKey(name: "price") dynamic price, String currency
});


@override $TimelineCopyWith<$Res> get timeline;

}
/// @nodoc
class __$JobPostCopyWithImpl<$Res>
    implements _$JobPostCopyWith<$Res> {
  __$JobPostCopyWithImpl(this._self, this._then);

  final _JobPost _self;
  final $Res Function(_JobPost) _then;

/// Create a copy of JobPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timeline = null,Object? title = null,Object? category = null,Object? location = null,Object? description = null,Object? requirements = null,Object? createdAt = null,Object? mediaUrls = null,Object? applicants = null,Object? price = freezed,Object? currency = null,}) {
  return _then(_JobPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as Timeline,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,applicants: null == applicants ? _self._applicants : applicants // ignore: cast_nullable_to_non_nullable
as List<dynamic>,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as dynamic,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of JobPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimelineCopyWith<$Res> get timeline {
  
  return $TimelineCopyWith<$Res>(_self.timeline, (value) {
    return _then(_self.copyWith(timeline: value));
  });
}
}


/// @nodoc
mixin _$Timeline {

 DateTime? get startDate; DateTime? get endDate;
/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineCopyWith<Timeline> get copyWith => _$TimelineCopyWithImpl<Timeline>(this as Timeline, _$identity);

  /// Serializes this Timeline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timeline&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'Timeline(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $TimelineCopyWith<$Res>  {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) _then) = _$TimelineCopyWithImpl;
@useResult
$Res call({
 DateTime? startDate, DateTime? endDate
});




}
/// @nodoc
class _$TimelineCopyWithImpl<$Res>
    implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._self, this._then);

  final Timeline _self;
  final $Res Function(Timeline) _then;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Timeline].
extension TimelinePatterns on Timeline {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Timeline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Timeline() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Timeline value)  $default,){
final _that = this;
switch (_that) {
case _Timeline():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Timeline value)?  $default,){
final _that = this;
switch (_that) {
case _Timeline() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Timeline() when $default != null:
return $default(_that.startDate,_that.endDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? startDate,  DateTime? endDate)  $default,) {final _that = this;
switch (_that) {
case _Timeline():
return $default(_that.startDate,_that.endDate);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? startDate,  DateTime? endDate)?  $default,) {final _that = this;
switch (_that) {
case _Timeline() when $default != null:
return $default(_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Timeline implements Timeline {
  const _Timeline({this.startDate, this.endDate});
  factory _Timeline.fromJson(Map<String, dynamic> json) => _$TimelineFromJson(json);

@override final  DateTime? startDate;
@override final  DateTime? endDate;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineCopyWith<_Timeline> get copyWith => __$TimelineCopyWithImpl<_Timeline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timeline&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'Timeline(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$TimelineCopyWith<$Res> implements $TimelineCopyWith<$Res> {
  factory _$TimelineCopyWith(_Timeline value, $Res Function(_Timeline) _then) = __$TimelineCopyWithImpl;
@override @useResult
$Res call({
 DateTime? startDate, DateTime? endDate
});




}
/// @nodoc
class __$TimelineCopyWithImpl<$Res>
    implements _$TimelineCopyWith<$Res> {
  __$TimelineCopyWithImpl(this._self, this._then);

  final _Timeline _self;
  final $Res Function(_Timeline) _then;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_Timeline(
startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$UpdateSponsorProfileResponse {

 bool get success; String get message; UpdatedSponsorProfile get sponsorProfile;
/// Create a copy of UpdateSponsorProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSponsorProfileResponseCopyWith<UpdateSponsorProfileResponse> get copyWith => _$UpdateSponsorProfileResponseCopyWithImpl<UpdateSponsorProfileResponse>(this as UpdateSponsorProfileResponse, _$identity);

  /// Serializes this UpdateSponsorProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSponsorProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,sponsorProfile);

@override
String toString() {
  return 'UpdateSponsorProfileResponse(success: $success, message: $message, sponsorProfile: $sponsorProfile)';
}


}

/// @nodoc
abstract mixin class $UpdateSponsorProfileResponseCopyWith<$Res>  {
  factory $UpdateSponsorProfileResponseCopyWith(UpdateSponsorProfileResponse value, $Res Function(UpdateSponsorProfileResponse) _then) = _$UpdateSponsorProfileResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, UpdatedSponsorProfile sponsorProfile
});


$UpdatedSponsorProfileCopyWith<$Res> get sponsorProfile;

}
/// @nodoc
class _$UpdateSponsorProfileResponseCopyWithImpl<$Res>
    implements $UpdateSponsorProfileResponseCopyWith<$Res> {
  _$UpdateSponsorProfileResponseCopyWithImpl(this._self, this._then);

  final UpdateSponsorProfileResponse _self;
  final $Res Function(UpdateSponsorProfileResponse) _then;

/// Create a copy of UpdateSponsorProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? sponsorProfile = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sponsorProfile: null == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as UpdatedSponsorProfile,
  ));
}
/// Create a copy of UpdateSponsorProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdatedSponsorProfileCopyWith<$Res> get sponsorProfile {
  
  return $UpdatedSponsorProfileCopyWith<$Res>(_self.sponsorProfile, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateSponsorProfileResponse].
extension UpdateSponsorProfileResponsePatterns on UpdateSponsorProfileResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSponsorProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSponsorProfileResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSponsorProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSponsorProfileResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSponsorProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSponsorProfileResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  UpdatedSponsorProfile sponsorProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSponsorProfileResponse() when $default != null:
return $default(_that.success,_that.message,_that.sponsorProfile);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  UpdatedSponsorProfile sponsorProfile)  $default,) {final _that = this;
switch (_that) {
case _UpdateSponsorProfileResponse():
return $default(_that.success,_that.message,_that.sponsorProfile);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  UpdatedSponsorProfile sponsorProfile)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSponsorProfileResponse() when $default != null:
return $default(_that.success,_that.message,_that.sponsorProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateSponsorProfileResponse implements UpdateSponsorProfileResponse {
  const _UpdateSponsorProfileResponse({required this.success, required this.message, required this.sponsorProfile});
  factory _UpdateSponsorProfileResponse.fromJson(Map<String, dynamic> json) => _$UpdateSponsorProfileResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  UpdatedSponsorProfile sponsorProfile;

/// Create a copy of UpdateSponsorProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSponsorProfileResponseCopyWith<_UpdateSponsorProfileResponse> get copyWith => __$UpdateSponsorProfileResponseCopyWithImpl<_UpdateSponsorProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSponsorProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSponsorProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,sponsorProfile);

@override
String toString() {
  return 'UpdateSponsorProfileResponse(success: $success, message: $message, sponsorProfile: $sponsorProfile)';
}


}

/// @nodoc
abstract mixin class _$UpdateSponsorProfileResponseCopyWith<$Res> implements $UpdateSponsorProfileResponseCopyWith<$Res> {
  factory _$UpdateSponsorProfileResponseCopyWith(_UpdateSponsorProfileResponse value, $Res Function(_UpdateSponsorProfileResponse) _then) = __$UpdateSponsorProfileResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, UpdatedSponsorProfile sponsorProfile
});


@override $UpdatedSponsorProfileCopyWith<$Res> get sponsorProfile;

}
/// @nodoc
class __$UpdateSponsorProfileResponseCopyWithImpl<$Res>
    implements _$UpdateSponsorProfileResponseCopyWith<$Res> {
  __$UpdateSponsorProfileResponseCopyWithImpl(this._self, this._then);

  final _UpdateSponsorProfileResponse _self;
  final $Res Function(_UpdateSponsorProfileResponse) _then;

/// Create a copy of UpdateSponsorProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? sponsorProfile = null,}) {
  return _then(_UpdateSponsorProfileResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,sponsorProfile: null == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as UpdatedSponsorProfile,
  ));
}

/// Create a copy of UpdateSponsorProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdatedSponsorProfileCopyWith<$Res> get sponsorProfile {
  
  return $UpdatedSponsorProfileCopyWith<$Res>(_self.sponsorProfile, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// @nodoc
mixin _$UpdatedSponsorProfile {

 String? get name; String? get description; String? get address; String? get profileImageUrl; String? get bannerImageUrl; String? get websiteUrl; Map<String, String>? get socialLinks;
/// Create a copy of UpdatedSponsorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatedSponsorProfileCopyWith<UpdatedSponsorProfile> get copyWith => _$UpdatedSponsorProfileCopyWithImpl<UpdatedSponsorProfile>(this as UpdatedSponsorProfile, _$identity);

  /// Serializes this UpdatedSponsorProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatedSponsorProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,address,profileImageUrl,bannerImageUrl,websiteUrl,const DeepCollectionEquality().hash(socialLinks));

@override
String toString() {
  return 'UpdatedSponsorProfile(name: $name, description: $description, address: $address, profileImageUrl: $profileImageUrl, bannerImageUrl: $bannerImageUrl, websiteUrl: $websiteUrl, socialLinks: $socialLinks)';
}


}

/// @nodoc
abstract mixin class $UpdatedSponsorProfileCopyWith<$Res>  {
  factory $UpdatedSponsorProfileCopyWith(UpdatedSponsorProfile value, $Res Function(UpdatedSponsorProfile) _then) = _$UpdatedSponsorProfileCopyWithImpl;
@useResult
$Res call({
 String? name, String? description, String? address, String? profileImageUrl, String? bannerImageUrl, String? websiteUrl, Map<String, String>? socialLinks
});




}
/// @nodoc
class _$UpdatedSponsorProfileCopyWithImpl<$Res>
    implements $UpdatedSponsorProfileCopyWith<$Res> {
  _$UpdatedSponsorProfileCopyWithImpl(this._self, this._then);

  final UpdatedSponsorProfile _self;
  final $Res Function(UpdatedSponsorProfile) _then;

/// Create a copy of UpdatedSponsorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? description = freezed,Object? address = freezed,Object? profileImageUrl = freezed,Object? bannerImageUrl = freezed,Object? websiteUrl = freezed,Object? socialLinks = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerImageUrl: freezed == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatedSponsorProfile].
extension UpdatedSponsorProfilePatterns on UpdatedSponsorProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatedSponsorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatedSponsorProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatedSponsorProfile value)  $default,){
final _that = this;
switch (_that) {
case _UpdatedSponsorProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatedSponsorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatedSponsorProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? description,  String? address,  String? profileImageUrl,  String? bannerImageUrl,  String? websiteUrl,  Map<String, String>? socialLinks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatedSponsorProfile() when $default != null:
return $default(_that.name,_that.description,_that.address,_that.profileImageUrl,_that.bannerImageUrl,_that.websiteUrl,_that.socialLinks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? description,  String? address,  String? profileImageUrl,  String? bannerImageUrl,  String? websiteUrl,  Map<String, String>? socialLinks)  $default,) {final _that = this;
switch (_that) {
case _UpdatedSponsorProfile():
return $default(_that.name,_that.description,_that.address,_that.profileImageUrl,_that.bannerImageUrl,_that.websiteUrl,_that.socialLinks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? description,  String? address,  String? profileImageUrl,  String? bannerImageUrl,  String? websiteUrl,  Map<String, String>? socialLinks)?  $default,) {final _that = this;
switch (_that) {
case _UpdatedSponsorProfile() when $default != null:
return $default(_that.name,_that.description,_that.address,_that.profileImageUrl,_that.bannerImageUrl,_that.websiteUrl,_that.socialLinks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatedSponsorProfile implements UpdatedSponsorProfile {
  const _UpdatedSponsorProfile({this.name, this.description, this.address, this.profileImageUrl, this.bannerImageUrl, this.websiteUrl, final  Map<String, String>? socialLinks}): _socialLinks = socialLinks;
  factory _UpdatedSponsorProfile.fromJson(Map<String, dynamic> json) => _$UpdatedSponsorProfileFromJson(json);

@override final  String? name;
@override final  String? description;
@override final  String? address;
@override final  String? profileImageUrl;
@override final  String? bannerImageUrl;
@override final  String? websiteUrl;
 final  Map<String, String>? _socialLinks;
@override Map<String, String>? get socialLinks {
  final value = _socialLinks;
  if (value == null) return null;
  if (_socialLinks is EqualUnmodifiableMapView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UpdatedSponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedSponsorProfileCopyWith<_UpdatedSponsorProfile> get copyWith => __$UpdatedSponsorProfileCopyWithImpl<_UpdatedSponsorProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatedSponsorProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatedSponsorProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,address,profileImageUrl,bannerImageUrl,websiteUrl,const DeepCollectionEquality().hash(_socialLinks));

@override
String toString() {
  return 'UpdatedSponsorProfile(name: $name, description: $description, address: $address, profileImageUrl: $profileImageUrl, bannerImageUrl: $bannerImageUrl, websiteUrl: $websiteUrl, socialLinks: $socialLinks)';
}


}

/// @nodoc
abstract mixin class _$UpdatedSponsorProfileCopyWith<$Res> implements $UpdatedSponsorProfileCopyWith<$Res> {
  factory _$UpdatedSponsorProfileCopyWith(_UpdatedSponsorProfile value, $Res Function(_UpdatedSponsorProfile) _then) = __$UpdatedSponsorProfileCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? description, String? address, String? profileImageUrl, String? bannerImageUrl, String? websiteUrl, Map<String, String>? socialLinks
});




}
/// @nodoc
class __$UpdatedSponsorProfileCopyWithImpl<$Res>
    implements _$UpdatedSponsorProfileCopyWith<$Res> {
  __$UpdatedSponsorProfileCopyWithImpl(this._self, this._then);

  final _UpdatedSponsorProfile _self;
  final $Res Function(_UpdatedSponsorProfile) _then;

/// Create a copy of UpdatedSponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? description = freezed,Object? address = freezed,Object? profileImageUrl = freezed,Object? bannerImageUrl = freezed,Object? websiteUrl = freezed,Object? socialLinks = freezed,}) {
  return _then(_UpdatedSponsorProfile(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerImageUrl: freezed == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,socialLinks: freezed == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}

// dart format on
