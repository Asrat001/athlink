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
mixin _$ProfileModel {

 String get name;@JsonKey(defaultValue: "") String get country;@JsonKey(defaultValue: "") String get location;@JsonKey(defaultValue: "") String get bio; String? get profilePhoto; String? get coverPhoto; List<Sport>? get sport; CampaignDetailModel? get latestActiveCampaign;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.location, location) || other.location == location)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.coverPhoto, coverPhoto) || other.coverPhoto == coverPhoto)&&const DeepCollectionEquality().equals(other.sport, sport)&&(identical(other.latestActiveCampaign, latestActiveCampaign) || other.latestActiveCampaign == latestActiveCampaign));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,location,bio,profilePhoto,coverPhoto,const DeepCollectionEquality().hash(sport),latestActiveCampaign);

@override
String toString() {
  return 'ProfileModel(name: $name, country: $country, location: $location, bio: $bio, profilePhoto: $profilePhoto, coverPhoto: $coverPhoto, sport: $sport, latestActiveCampaign: $latestActiveCampaign)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String name,@JsonKey(defaultValue: "") String country,@JsonKey(defaultValue: "") String location,@JsonKey(defaultValue: "") String bio, String? profilePhoto, String? coverPhoto, List<Sport>? sport, CampaignDetailModel? latestActiveCampaign
});


$CampaignDetailModelCopyWith<$Res>? get latestActiveCampaign;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? country = null,Object? location = null,Object? bio = null,Object? profilePhoto = freezed,Object? coverPhoto = freezed,Object? sport = freezed,Object? latestActiveCampaign = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,coverPhoto: freezed == coverPhoto ? _self.coverPhoto : coverPhoto // ignore: cast_nullable_to_non_nullable
as String?,sport: freezed == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as List<Sport>?,latestActiveCampaign: freezed == latestActiveCampaign ? _self.latestActiveCampaign : latestActiveCampaign // ignore: cast_nullable_to_non_nullable
as CampaignDetailModel?,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CampaignDetailModelCopyWith<$Res>? get latestActiveCampaign {
    if (_self.latestActiveCampaign == null) {
    return null;
  }

  return $CampaignDetailModelCopyWith<$Res>(_self.latestActiveCampaign!, (value) {
    return _then(_self.copyWith(latestActiveCampaign: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name, @JsonKey(defaultValue: "")  String country, @JsonKey(defaultValue: "")  String location, @JsonKey(defaultValue: "")  String bio,  String? profilePhoto,  String? coverPhoto,  List<Sport>? sport,  CampaignDetailModel? latestActiveCampaign)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.name,_that.country,_that.location,_that.bio,_that.profilePhoto,_that.coverPhoto,_that.sport,_that.latestActiveCampaign);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name, @JsonKey(defaultValue: "")  String country, @JsonKey(defaultValue: "")  String location, @JsonKey(defaultValue: "")  String bio,  String? profilePhoto,  String? coverPhoto,  List<Sport>? sport,  CampaignDetailModel? latestActiveCampaign)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.name,_that.country,_that.location,_that.bio,_that.profilePhoto,_that.coverPhoto,_that.sport,_that.latestActiveCampaign);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name, @JsonKey(defaultValue: "")  String country, @JsonKey(defaultValue: "")  String location, @JsonKey(defaultValue: "")  String bio,  String? profilePhoto,  String? coverPhoto,  List<Sport>? sport,  CampaignDetailModel? latestActiveCampaign)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.name,_that.country,_that.location,_that.bio,_that.profilePhoto,_that.coverPhoto,_that.sport,_that.latestActiveCampaign);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
  const _ProfileModel({required this.name, @JsonKey(defaultValue: "") required this.country, @JsonKey(defaultValue: "") required this.location, @JsonKey(defaultValue: "") required this.bio, this.profilePhoto, this.coverPhoto, final  List<Sport>? sport, this.latestActiveCampaign}): _sport = sport;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String name;
@override@JsonKey(defaultValue: "") final  String country;
@override@JsonKey(defaultValue: "") final  String location;
@override@JsonKey(defaultValue: "") final  String bio;
@override final  String? profilePhoto;
@override final  String? coverPhoto;
 final  List<Sport>? _sport;
@override List<Sport>? get sport {
  final value = _sport;
  if (value == null) return null;
  if (_sport is EqualUnmodifiableListView) return _sport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  CampaignDetailModel? latestActiveCampaign;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.location, location) || other.location == location)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.profilePhoto, profilePhoto) || other.profilePhoto == profilePhoto)&&(identical(other.coverPhoto, coverPhoto) || other.coverPhoto == coverPhoto)&&const DeepCollectionEquality().equals(other._sport, _sport)&&(identical(other.latestActiveCampaign, latestActiveCampaign) || other.latestActiveCampaign == latestActiveCampaign));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,location,bio,profilePhoto,coverPhoto,const DeepCollectionEquality().hash(_sport),latestActiveCampaign);

@override
String toString() {
  return 'ProfileModel(name: $name, country: $country, location: $location, bio: $bio, profilePhoto: $profilePhoto, coverPhoto: $coverPhoto, sport: $sport, latestActiveCampaign: $latestActiveCampaign)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String name,@JsonKey(defaultValue: "") String country,@JsonKey(defaultValue: "") String location,@JsonKey(defaultValue: "") String bio, String? profilePhoto, String? coverPhoto, List<Sport>? sport, CampaignDetailModel? latestActiveCampaign
});


@override $CampaignDetailModelCopyWith<$Res>? get latestActiveCampaign;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? country = null,Object? location = null,Object? bio = null,Object? profilePhoto = freezed,Object? coverPhoto = freezed,Object? sport = freezed,Object? latestActiveCampaign = freezed,}) {
  return _then(_ProfileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,profilePhoto: freezed == profilePhoto ? _self.profilePhoto : profilePhoto // ignore: cast_nullable_to_non_nullable
as String?,coverPhoto: freezed == coverPhoto ? _self.coverPhoto : coverPhoto // ignore: cast_nullable_to_non_nullable
as String?,sport: freezed == sport ? _self._sport : sport // ignore: cast_nullable_to_non_nullable
as List<Sport>?,latestActiveCampaign: freezed == latestActiveCampaign ? _self.latestActiveCampaign : latestActiveCampaign // ignore: cast_nullable_to_non_nullable
as CampaignDetailModel?,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CampaignDetailModelCopyWith<$Res>? get latestActiveCampaign {
    if (_self.latestActiveCampaign == null) {
    return null;
  }

  return $CampaignDetailModelCopyWith<$Res>(_self.latestActiveCampaign!, (value) {
    return _then(_self.copyWith(latestActiveCampaign: value));
  });
}
}

// dart format on
