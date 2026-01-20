// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'competition_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompetitionResultModel {

@JsonKey(name: '_id') String get id;@JsonKey(name: 'athlete') String get athleteId; String get competitionName; String get date; int get position; int get totalCompetitors; String get division; List<String> get media; String get competitionSummary; String? get resultLink; String? get location;
/// Create a copy of CompetitionResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompetitionResultModelCopyWith<CompetitionResultModel> get copyWith => _$CompetitionResultModelCopyWithImpl<CompetitionResultModel>(this as CompetitionResultModel, _$identity);

  /// Serializes this CompetitionResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompetitionResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.competitionName, competitionName) || other.competitionName == competitionName)&&(identical(other.date, date) || other.date == date)&&(identical(other.position, position) || other.position == position)&&(identical(other.totalCompetitors, totalCompetitors) || other.totalCompetitors == totalCompetitors)&&(identical(other.division, division) || other.division == division)&&const DeepCollectionEquality().equals(other.media, media)&&(identical(other.competitionSummary, competitionSummary) || other.competitionSummary == competitionSummary)&&(identical(other.resultLink, resultLink) || other.resultLink == resultLink)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athleteId,competitionName,date,position,totalCompetitors,division,const DeepCollectionEquality().hash(media),competitionSummary,resultLink,location);

@override
String toString() {
  return 'CompetitionResultModel(id: $id, athleteId: $athleteId, competitionName: $competitionName, date: $date, position: $position, totalCompetitors: $totalCompetitors, division: $division, media: $media, competitionSummary: $competitionSummary, resultLink: $resultLink, location: $location)';
}


}

/// @nodoc
abstract mixin class $CompetitionResultModelCopyWith<$Res>  {
  factory $CompetitionResultModelCopyWith(CompetitionResultModel value, $Res Function(CompetitionResultModel) _then) = _$CompetitionResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: 'athlete') String athleteId, String competitionName, String date, int position, int totalCompetitors, String division, List<String> media, String competitionSummary, String? resultLink, String? location
});




}
/// @nodoc
class _$CompetitionResultModelCopyWithImpl<$Res>
    implements $CompetitionResultModelCopyWith<$Res> {
  _$CompetitionResultModelCopyWithImpl(this._self, this._then);

  final CompetitionResultModel _self;
  final $Res Function(CompetitionResultModel) _then;

/// Create a copy of CompetitionResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? athleteId = null,Object? competitionName = null,Object? date = null,Object? position = null,Object? totalCompetitors = null,Object? division = null,Object? media = null,Object? competitionSummary = null,Object? resultLink = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,competitionName: null == competitionName ? _self.competitionName : competitionName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,totalCompetitors: null == totalCompetitors ? _self.totalCompetitors : totalCompetitors // ignore: cast_nullable_to_non_nullable
as int,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<String>,competitionSummary: null == competitionSummary ? _self.competitionSummary : competitionSummary // ignore: cast_nullable_to_non_nullable
as String,resultLink: freezed == resultLink ? _self.resultLink : resultLink // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompetitionResultModel].
extension CompetitionResultModelPatterns on CompetitionResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompetitionResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompetitionResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompetitionResultModel value)  $default,){
final _that = this;
switch (_that) {
case _CompetitionResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompetitionResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _CompetitionResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: 'athlete')  String athleteId,  String competitionName,  String date,  int position,  int totalCompetitors,  String division,  List<String> media,  String competitionSummary,  String? resultLink,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompetitionResultModel() when $default != null:
return $default(_that.id,_that.athleteId,_that.competitionName,_that.date,_that.position,_that.totalCompetitors,_that.division,_that.media,_that.competitionSummary,_that.resultLink,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id, @JsonKey(name: 'athlete')  String athleteId,  String competitionName,  String date,  int position,  int totalCompetitors,  String division,  List<String> media,  String competitionSummary,  String? resultLink,  String? location)  $default,) {final _that = this;
switch (_that) {
case _CompetitionResultModel():
return $default(_that.id,_that.athleteId,_that.competitionName,_that.date,_that.position,_that.totalCompetitors,_that.division,_that.media,_that.competitionSummary,_that.resultLink,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id, @JsonKey(name: 'athlete')  String athleteId,  String competitionName,  String date,  int position,  int totalCompetitors,  String division,  List<String> media,  String competitionSummary,  String? resultLink,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _CompetitionResultModel() when $default != null:
return $default(_that.id,_that.athleteId,_that.competitionName,_that.date,_that.position,_that.totalCompetitors,_that.division,_that.media,_that.competitionSummary,_that.resultLink,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompetitionResultModel implements CompetitionResultModel {
  const _CompetitionResultModel({@JsonKey(name: '_id') required this.id, @JsonKey(name: 'athlete') required this.athleteId, required this.competitionName, required this.date, required this.position, required this.totalCompetitors, required this.division, final  List<String> media = const [], required this.competitionSummary, this.resultLink, this.location}): _media = media;
  factory _CompetitionResultModel.fromJson(Map<String, dynamic> json) => _$CompetitionResultModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override@JsonKey(name: 'athlete') final  String athleteId;
@override final  String competitionName;
@override final  String date;
@override final  int position;
@override final  int totalCompetitors;
@override final  String division;
 final  List<String> _media;
@override@JsonKey() List<String> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

@override final  String competitionSummary;
@override final  String? resultLink;
@override final  String? location;

/// Create a copy of CompetitionResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompetitionResultModelCopyWith<_CompetitionResultModel> get copyWith => __$CompetitionResultModelCopyWithImpl<_CompetitionResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompetitionResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompetitionResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.competitionName, competitionName) || other.competitionName == competitionName)&&(identical(other.date, date) || other.date == date)&&(identical(other.position, position) || other.position == position)&&(identical(other.totalCompetitors, totalCompetitors) || other.totalCompetitors == totalCompetitors)&&(identical(other.division, division) || other.division == division)&&const DeepCollectionEquality().equals(other._media, _media)&&(identical(other.competitionSummary, competitionSummary) || other.competitionSummary == competitionSummary)&&(identical(other.resultLink, resultLink) || other.resultLink == resultLink)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athleteId,competitionName,date,position,totalCompetitors,division,const DeepCollectionEquality().hash(_media),competitionSummary,resultLink,location);

@override
String toString() {
  return 'CompetitionResultModel(id: $id, athleteId: $athleteId, competitionName: $competitionName, date: $date, position: $position, totalCompetitors: $totalCompetitors, division: $division, media: $media, competitionSummary: $competitionSummary, resultLink: $resultLink, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CompetitionResultModelCopyWith<$Res> implements $CompetitionResultModelCopyWith<$Res> {
  factory _$CompetitionResultModelCopyWith(_CompetitionResultModel value, $Res Function(_CompetitionResultModel) _then) = __$CompetitionResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id,@JsonKey(name: 'athlete') String athleteId, String competitionName, String date, int position, int totalCompetitors, String division, List<String> media, String competitionSummary, String? resultLink, String? location
});




}
/// @nodoc
class __$CompetitionResultModelCopyWithImpl<$Res>
    implements _$CompetitionResultModelCopyWith<$Res> {
  __$CompetitionResultModelCopyWithImpl(this._self, this._then);

  final _CompetitionResultModel _self;
  final $Res Function(_CompetitionResultModel) _then;

/// Create a copy of CompetitionResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? athleteId = null,Object? competitionName = null,Object? date = null,Object? position = null,Object? totalCompetitors = null,Object? division = null,Object? media = null,Object? competitionSummary = null,Object? resultLink = freezed,Object? location = freezed,}) {
  return _then(_CompetitionResultModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,competitionName: null == competitionName ? _self.competitionName : competitionName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,totalCompetitors: null == totalCompetitors ? _self.totalCompetitors : totalCompetitors // ignore: cast_nullable_to_non_nullable
as int,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<String>,competitionSummary: null == competitionSummary ? _self.competitionSummary : competitionSummary // ignore: cast_nullable_to_non_nullable
as String,resultLink: freezed == resultLink ? _self.resultLink : resultLink // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
