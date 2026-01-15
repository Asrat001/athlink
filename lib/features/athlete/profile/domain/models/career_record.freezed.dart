// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerJourneyModel {

@JsonKey(name: '_id') String get id;@JsonKey(name: 'athlete') String get athleteId; String? get logo; String get position; String get teamName; String get year; String get achievements; String? get location; String get description;
/// Create a copy of CareerJourneyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerJourneyModelCopyWith<CareerJourneyModel> get copyWith => _$CareerJourneyModelCopyWithImpl<CareerJourneyModel>(this as CareerJourneyModel, _$identity);

  /// Serializes this CareerJourneyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerJourneyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.position, position) || other.position == position)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.year, year) || other.year == year)&&(identical(other.achievements, achievements) || other.achievements == achievements)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athleteId,logo,position,teamName,year,achievements,location,description);

@override
String toString() {
  return 'CareerJourneyModel(id: $id, athleteId: $athleteId, logo: $logo, position: $position, teamName: $teamName, year: $year, achievements: $achievements, location: $location, description: $description)';
}


}

/// @nodoc
abstract mixin class $CareerJourneyModelCopyWith<$Res>  {
  factory $CareerJourneyModelCopyWith(CareerJourneyModel value, $Res Function(CareerJourneyModel) _then) = _$CareerJourneyModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: 'athlete') String athleteId, String? logo, String position, String teamName, String year, String achievements, String? location, String description
});




}
/// @nodoc
class _$CareerJourneyModelCopyWithImpl<$Res>
    implements $CareerJourneyModelCopyWith<$Res> {
  _$CareerJourneyModelCopyWithImpl(this._self, this._then);

  final CareerJourneyModel _self;
  final $Res Function(CareerJourneyModel) _then;

/// Create a copy of CareerJourneyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? athleteId = null,Object? logo = freezed,Object? position = null,Object? teamName = null,Object? year = null,Object? achievements = null,Object? location = freezed,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CareerJourneyModel].
extension CareerJourneyModelPatterns on CareerJourneyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerJourneyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerJourneyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerJourneyModel value)  $default,){
final _that = this;
switch (_that) {
case _CareerJourneyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerJourneyModel value)?  $default,){
final _that = this;
switch (_that) {
case _CareerJourneyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: 'athlete')  String athleteId,  String? logo,  String position,  String teamName,  String year,  String achievements,  String? location,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerJourneyModel() when $default != null:
return $default(_that.id,_that.athleteId,_that.logo,_that.position,_that.teamName,_that.year,_that.achievements,_that.location,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: 'athlete')  String athleteId,  String? logo,  String position,  String teamName,  String year,  String achievements,  String? location,  String description)  $default,) {final _that = this;
switch (_that) {
case _CareerJourneyModel():
return $default(_that.id,_that.athleteId,_that.logo,_that.position,_that.teamName,_that.year,_that.achievements,_that.location,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(name: 'athlete')  String athleteId,  String? logo,  String position,  String teamName,  String year,  String achievements,  String? location,  String description)?  $default,) {final _that = this;
switch (_that) {
case _CareerJourneyModel() when $default != null:
return $default(_that.id,_that.athleteId,_that.logo,_that.position,_that.teamName,_that.year,_that.achievements,_that.location,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerJourneyModel implements CareerJourneyModel {
  const _CareerJourneyModel({@JsonKey(name: '_id') required this.id, @JsonKey(name: 'athlete') required this.athleteId, this.logo, required this.position, required this.teamName, required this.year, required this.achievements, this.location, required this.description});
  factory _CareerJourneyModel.fromJson(Map<String, dynamic> json) => _$CareerJourneyModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(name: 'athlete') final  String athleteId;
@override final  String? logo;
@override final  String position;
@override final  String teamName;
@override final  String year;
@override final  String achievements;
@override final  String? location;
@override final  String description;

/// Create a copy of CareerJourneyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerJourneyModelCopyWith<_CareerJourneyModel> get copyWith => __$CareerJourneyModelCopyWithImpl<_CareerJourneyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerJourneyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerJourneyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.position, position) || other.position == position)&&(identical(other.teamName, teamName) || other.teamName == teamName)&&(identical(other.year, year) || other.year == year)&&(identical(other.achievements, achievements) || other.achievements == achievements)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athleteId,logo,position,teamName,year,achievements,location,description);

@override
String toString() {
  return 'CareerJourneyModel(id: $id, athleteId: $athleteId, logo: $logo, position: $position, teamName: $teamName, year: $year, achievements: $achievements, location: $location, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CareerJourneyModelCopyWith<$Res> implements $CareerJourneyModelCopyWith<$Res> {
  factory _$CareerJourneyModelCopyWith(_CareerJourneyModel value, $Res Function(_CareerJourneyModel) _then) = __$CareerJourneyModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: 'athlete') String athleteId, String? logo, String position, String teamName, String year, String achievements, String? location, String description
});




}
/// @nodoc
class __$CareerJourneyModelCopyWithImpl<$Res>
    implements _$CareerJourneyModelCopyWith<$Res> {
  __$CareerJourneyModelCopyWithImpl(this._self, this._then);

  final _CareerJourneyModel _self;
  final $Res Function(_CareerJourneyModel) _then;

/// Create a copy of CareerJourneyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? athleteId = null,Object? logo = freezed,Object? position = null,Object? teamName = null,Object? year = null,Object? achievements = null,Object? location = freezed,Object? description = null,}) {
  return _then(_CareerJourneyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,logo: freezed == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String?,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String,teamName: null == teamName ? _self.teamName : teamName // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
