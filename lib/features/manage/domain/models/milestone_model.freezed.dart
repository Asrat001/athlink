// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateMilestoneRequest {

 String get title; String get description; String get startDate; String get endDate; double get fundAmount; String? get notes;
/// Create a copy of CreateMilestoneRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMilestoneRequestCopyWith<CreateMilestoneRequest> get copyWith => _$CreateMilestoneRequestCopyWithImpl<CreateMilestoneRequest>(this as CreateMilestoneRequest, _$identity);

  /// Serializes this CreateMilestoneRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMilestoneRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.fundAmount, fundAmount) || other.fundAmount == fundAmount)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,startDate,endDate,fundAmount,notes);

@override
String toString() {
  return 'CreateMilestoneRequest(title: $title, description: $description, startDate: $startDate, endDate: $endDate, fundAmount: $fundAmount, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateMilestoneRequestCopyWith<$Res>  {
  factory $CreateMilestoneRequestCopyWith(CreateMilestoneRequest value, $Res Function(CreateMilestoneRequest) _then) = _$CreateMilestoneRequestCopyWithImpl;
@useResult
$Res call({
 String title, String description, String startDate, String endDate, double fundAmount, String? notes
});




}
/// @nodoc
class _$CreateMilestoneRequestCopyWithImpl<$Res>
    implements $CreateMilestoneRequestCopyWith<$Res> {
  _$CreateMilestoneRequestCopyWithImpl(this._self, this._then);

  final CreateMilestoneRequest _self;
  final $Res Function(CreateMilestoneRequest) _then;

/// Create a copy of CreateMilestoneRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? fundAmount = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,fundAmount: null == fundAmount ? _self.fundAmount : fundAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMilestoneRequest].
extension CreateMilestoneRequestPatterns on CreateMilestoneRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMilestoneRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMilestoneRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMilestoneRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateMilestoneRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMilestoneRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMilestoneRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String startDate,  String endDate,  double fundAmount,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMilestoneRequest() when $default != null:
return $default(_that.title,_that.description,_that.startDate,_that.endDate,_that.fundAmount,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String startDate,  String endDate,  double fundAmount,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateMilestoneRequest():
return $default(_that.title,_that.description,_that.startDate,_that.endDate,_that.fundAmount,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String startDate,  String endDate,  double fundAmount,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateMilestoneRequest() when $default != null:
return $default(_that.title,_that.description,_that.startDate,_that.endDate,_that.fundAmount,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMilestoneRequest implements CreateMilestoneRequest {
  const _CreateMilestoneRequest({required this.title, required this.description, required this.startDate, required this.endDate, required this.fundAmount, this.notes});
  factory _CreateMilestoneRequest.fromJson(Map<String, dynamic> json) => _$CreateMilestoneRequestFromJson(json);

@override final  String title;
@override final  String description;
@override final  String startDate;
@override final  String endDate;
@override final  double fundAmount;
@override final  String? notes;

/// Create a copy of CreateMilestoneRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMilestoneRequestCopyWith<_CreateMilestoneRequest> get copyWith => __$CreateMilestoneRequestCopyWithImpl<_CreateMilestoneRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMilestoneRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMilestoneRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.fundAmount, fundAmount) || other.fundAmount == fundAmount)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,startDate,endDate,fundAmount,notes);

@override
String toString() {
  return 'CreateMilestoneRequest(title: $title, description: $description, startDate: $startDate, endDate: $endDate, fundAmount: $fundAmount, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateMilestoneRequestCopyWith<$Res> implements $CreateMilestoneRequestCopyWith<$Res> {
  factory _$CreateMilestoneRequestCopyWith(_CreateMilestoneRequest value, $Res Function(_CreateMilestoneRequest) _then) = __$CreateMilestoneRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String startDate, String endDate, double fundAmount, String? notes
});




}
/// @nodoc
class __$CreateMilestoneRequestCopyWithImpl<$Res>
    implements _$CreateMilestoneRequestCopyWith<$Res> {
  __$CreateMilestoneRequestCopyWithImpl(this._self, this._then);

  final _CreateMilestoneRequest _self;
  final $Res Function(_CreateMilestoneRequest) _then;

/// Create a copy of CreateMilestoneRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? fundAmount = null,Object? notes = freezed,}) {
  return _then(_CreateMilestoneRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,fundAmount: null == fundAmount ? _self.fundAmount : fundAmount // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MilestoneTimeline {

 DateTime get startDate; DateTime get endDate;
/// Create a copy of MilestoneTimeline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneTimelineCopyWith<MilestoneTimeline> get copyWith => _$MilestoneTimelineCopyWithImpl<MilestoneTimeline>(this as MilestoneTimeline, _$identity);

  /// Serializes this MilestoneTimeline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneTimeline&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'MilestoneTimeline(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $MilestoneTimelineCopyWith<$Res>  {
  factory $MilestoneTimelineCopyWith(MilestoneTimeline value, $Res Function(MilestoneTimeline) _then) = _$MilestoneTimelineCopyWithImpl;
@useResult
$Res call({
 DateTime startDate, DateTime endDate
});




}
/// @nodoc
class _$MilestoneTimelineCopyWithImpl<$Res>
    implements $MilestoneTimelineCopyWith<$Res> {
  _$MilestoneTimelineCopyWithImpl(this._self, this._then);

  final MilestoneTimeline _self;
  final $Res Function(MilestoneTimeline) _then;

/// Create a copy of MilestoneTimeline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestoneTimeline].
extension MilestoneTimelinePatterns on MilestoneTimeline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneTimeline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneTimeline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneTimeline value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneTimeline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneTimeline value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneTimeline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneTimeline() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startDate,  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _MilestoneTimeline():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startDate,  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneTimeline() when $default != null:
return $default(_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestoneTimeline implements MilestoneTimeline {
  const _MilestoneTimeline({required this.startDate, required this.endDate});
  factory _MilestoneTimeline.fromJson(Map<String, dynamic> json) => _$MilestoneTimelineFromJson(json);

@override final  DateTime startDate;
@override final  DateTime endDate;

/// Create a copy of MilestoneTimeline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneTimelineCopyWith<_MilestoneTimeline> get copyWith => __$MilestoneTimelineCopyWithImpl<_MilestoneTimeline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneTimelineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneTimeline&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startDate,endDate);

@override
String toString() {
  return 'MilestoneTimeline(startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$MilestoneTimelineCopyWith<$Res> implements $MilestoneTimelineCopyWith<$Res> {
  factory _$MilestoneTimelineCopyWith(_MilestoneTimeline value, $Res Function(_MilestoneTimeline) _then) = __$MilestoneTimelineCopyWithImpl;
@override @useResult
$Res call({
 DateTime startDate, DateTime endDate
});




}
/// @nodoc
class __$MilestoneTimelineCopyWithImpl<$Res>
    implements _$MilestoneTimelineCopyWith<$Res> {
  __$MilestoneTimelineCopyWithImpl(this._self, this._then);

  final _MilestoneTimeline _self;
  final $Res Function(_MilestoneTimeline) _then;

/// Create a copy of MilestoneTimeline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startDate = null,Object? endDate = null,}) {
  return _then(_MilestoneTimeline(
startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$MilestoneSponsor {

@JsonKey(name: '_id') String get id; String get name; String get email; Map<String, dynamic>? get sponsorProfile;
/// Create a copy of MilestoneSponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneSponsorCopyWith<MilestoneSponsor> get copyWith => _$MilestoneSponsorCopyWithImpl<MilestoneSponsor>(this as MilestoneSponsor, _$identity);

  /// Serializes this MilestoneSponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneSponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.sponsorProfile, sponsorProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,const DeepCollectionEquality().hash(sponsorProfile));

@override
String toString() {
  return 'MilestoneSponsor(id: $id, name: $name, email: $email, sponsorProfile: $sponsorProfile)';
}


}

/// @nodoc
abstract mixin class $MilestoneSponsorCopyWith<$Res>  {
  factory $MilestoneSponsorCopyWith(MilestoneSponsor value, $Res Function(MilestoneSponsor) _then) = _$MilestoneSponsorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String email, Map<String, dynamic>? sponsorProfile
});




}
/// @nodoc
class _$MilestoneSponsorCopyWithImpl<$Res>
    implements $MilestoneSponsorCopyWith<$Res> {
  _$MilestoneSponsorCopyWithImpl(this._self, this._then);

  final MilestoneSponsor _self;
  final $Res Function(MilestoneSponsor) _then;

/// Create a copy of MilestoneSponsor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? sponsorProfile = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,sponsorProfile: freezed == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestoneSponsor].
extension MilestoneSponsorPatterns on MilestoneSponsor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneSponsor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneSponsor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneSponsor value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneSponsor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneSponsor value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneSponsor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String email,  Map<String, dynamic>? sponsorProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneSponsor() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.sponsorProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String email,  Map<String, dynamic>? sponsorProfile)  $default,) {final _that = this;
switch (_that) {
case _MilestoneSponsor():
return $default(_that.id,_that.name,_that.email,_that.sponsorProfile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String name,  String email,  Map<String, dynamic>? sponsorProfile)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneSponsor() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.sponsorProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestoneSponsor implements MilestoneSponsor {
  const _MilestoneSponsor({@JsonKey(name: '_id') required this.id, required this.name, required this.email, final  Map<String, dynamic>? sponsorProfile}): _sponsorProfile = sponsorProfile;
  factory _MilestoneSponsor.fromJson(Map<String, dynamic> json) => _$MilestoneSponsorFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String email;
 final  Map<String, dynamic>? _sponsorProfile;
@override Map<String, dynamic>? get sponsorProfile {
  final value = _sponsorProfile;
  if (value == null) return null;
  if (_sponsorProfile is EqualUnmodifiableMapView) return _sponsorProfile;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of MilestoneSponsor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneSponsorCopyWith<_MilestoneSponsor> get copyWith => __$MilestoneSponsorCopyWithImpl<_MilestoneSponsor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneSponsorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneSponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._sponsorProfile, _sponsorProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,const DeepCollectionEquality().hash(_sponsorProfile));

@override
String toString() {
  return 'MilestoneSponsor(id: $id, name: $name, email: $email, sponsorProfile: $sponsorProfile)';
}


}

/// @nodoc
abstract mixin class _$MilestoneSponsorCopyWith<$Res> implements $MilestoneSponsorCopyWith<$Res> {
  factory _$MilestoneSponsorCopyWith(_MilestoneSponsor value, $Res Function(_MilestoneSponsor) _then) = __$MilestoneSponsorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String email, Map<String, dynamic>? sponsorProfile
});




}
/// @nodoc
class __$MilestoneSponsorCopyWithImpl<$Res>
    implements _$MilestoneSponsorCopyWith<$Res> {
  __$MilestoneSponsorCopyWithImpl(this._self, this._then);

  final _MilestoneSponsor _self;
  final $Res Function(_MilestoneSponsor) _then;

/// Create a copy of MilestoneSponsor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? sponsorProfile = freezed,}) {
  return _then(_MilestoneSponsor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,sponsorProfile: freezed == sponsorProfile ? _self._sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$MilestoneAthlete {

@JsonKey(name: '_id') String get id; String get name; String get email; Map<String, dynamic>? get athleteProfile; List<Map<String, dynamic>> get sport;
/// Create a copy of MilestoneAthlete
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneAthleteCopyWith<MilestoneAthlete> get copyWith => _$MilestoneAthleteCopyWithImpl<MilestoneAthlete>(this as MilestoneAthlete, _$identity);

  /// Serializes this MilestoneAthlete to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneAthlete&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other.athleteProfile, athleteProfile)&&const DeepCollectionEquality().equals(other.sport, sport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,const DeepCollectionEquality().hash(athleteProfile),const DeepCollectionEquality().hash(sport));

@override
String toString() {
  return 'MilestoneAthlete(id: $id, name: $name, email: $email, athleteProfile: $athleteProfile, sport: $sport)';
}


}

/// @nodoc
abstract mixin class $MilestoneAthleteCopyWith<$Res>  {
  factory $MilestoneAthleteCopyWith(MilestoneAthlete value, $Res Function(MilestoneAthlete) _then) = _$MilestoneAthleteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String email, Map<String, dynamic>? athleteProfile, List<Map<String, dynamic>> sport
});




}
/// @nodoc
class _$MilestoneAthleteCopyWithImpl<$Res>
    implements $MilestoneAthleteCopyWith<$Res> {
  _$MilestoneAthleteCopyWithImpl(this._self, this._then);

  final MilestoneAthlete _self;
  final $Res Function(MilestoneAthlete) _then;

/// Create a copy of MilestoneAthlete
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? athleteProfile = freezed,Object? sport = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestoneAthlete].
extension MilestoneAthletePatterns on MilestoneAthlete {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneAthlete value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneAthlete() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneAthlete value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneAthlete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneAthlete value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneAthlete() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String email,  Map<String, dynamic>? athleteProfile,  List<Map<String, dynamic>> sport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneAthlete() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.athleteProfile,_that.sport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String email,  Map<String, dynamic>? athleteProfile,  List<Map<String, dynamic>> sport)  $default,) {final _that = this;
switch (_that) {
case _MilestoneAthlete():
return $default(_that.id,_that.name,_that.email,_that.athleteProfile,_that.sport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String name,  String email,  Map<String, dynamic>? athleteProfile,  List<Map<String, dynamic>> sport)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneAthlete() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.athleteProfile,_that.sport);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestoneAthlete implements MilestoneAthlete {
  const _MilestoneAthlete({@JsonKey(name: '_id') required this.id, required this.name, required this.email, final  Map<String, dynamic>? athleteProfile, final  List<Map<String, dynamic>> sport = const []}): _athleteProfile = athleteProfile,_sport = sport;
  factory _MilestoneAthlete.fromJson(Map<String, dynamic> json) => _$MilestoneAthleteFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String email;
 final  Map<String, dynamic>? _athleteProfile;
@override Map<String, dynamic>? get athleteProfile {
  final value = _athleteProfile;
  if (value == null) return null;
  if (_athleteProfile is EqualUnmodifiableMapView) return _athleteProfile;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<Map<String, dynamic>> _sport;
@override@JsonKey() List<Map<String, dynamic>> get sport {
  if (_sport is EqualUnmodifiableListView) return _sport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sport);
}


/// Create a copy of MilestoneAthlete
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneAthleteCopyWith<_MilestoneAthlete> get copyWith => __$MilestoneAthleteCopyWithImpl<_MilestoneAthlete>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneAthleteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneAthlete&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&const DeepCollectionEquality().equals(other._athleteProfile, _athleteProfile)&&const DeepCollectionEquality().equals(other._sport, _sport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,const DeepCollectionEquality().hash(_athleteProfile),const DeepCollectionEquality().hash(_sport));

@override
String toString() {
  return 'MilestoneAthlete(id: $id, name: $name, email: $email, athleteProfile: $athleteProfile, sport: $sport)';
}


}

/// @nodoc
abstract mixin class _$MilestoneAthleteCopyWith<$Res> implements $MilestoneAthleteCopyWith<$Res> {
  factory _$MilestoneAthleteCopyWith(_MilestoneAthlete value, $Res Function(_MilestoneAthlete) _then) = __$MilestoneAthleteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String email, Map<String, dynamic>? athleteProfile, List<Map<String, dynamic>> sport
});




}
/// @nodoc
class __$MilestoneAthleteCopyWithImpl<$Res>
    implements _$MilestoneAthleteCopyWith<$Res> {
  __$MilestoneAthleteCopyWithImpl(this._self, this._then);

  final _MilestoneAthlete _self;
  final $Res Function(_MilestoneAthlete) _then;

/// Create a copy of MilestoneAthlete
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? athleteProfile = freezed,Object? sport = null,}) {
  return _then(_MilestoneAthlete(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,athleteProfile: freezed == athleteProfile ? _self._athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sport: null == sport ? _self._sport : sport // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$Milestone {

@JsonKey(name: '_id') String get id; MilestoneSponsor get sponsor; MilestoneAthlete get athlete; String get jobPost; String get application; String get title; String get description; MilestoneTimeline get timeline; double get fundAmount; String get status; String get paymentStatus; String? get notes; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneCopyWith<Milestone> get copyWith => _$MilestoneCopyWithImpl<Milestone>(this as Milestone, _$identity);

  /// Serializes this Milestone to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Milestone&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.athlete, athlete) || other.athlete == athlete)&&(identical(other.jobPost, jobPost) || other.jobPost == jobPost)&&(identical(other.application, application) || other.application == application)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.fundAmount, fundAmount) || other.fundAmount == fundAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsor,athlete,jobPost,application,title,description,timeline,fundAmount,status,paymentStatus,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Milestone(id: $id, sponsor: $sponsor, athlete: $athlete, jobPost: $jobPost, application: $application, title: $title, description: $description, timeline: $timeline, fundAmount: $fundAmount, status: $status, paymentStatus: $paymentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MilestoneCopyWith<$Res>  {
  factory $MilestoneCopyWith(Milestone value, $Res Function(Milestone) _then) = _$MilestoneCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, MilestoneSponsor sponsor, MilestoneAthlete athlete, String jobPost, String application, String title, String description, MilestoneTimeline timeline, double fundAmount, String status, String paymentStatus, String? notes, DateTime createdAt, DateTime updatedAt
});


$MilestoneSponsorCopyWith<$Res> get sponsor;$MilestoneAthleteCopyWith<$Res> get athlete;$MilestoneTimelineCopyWith<$Res> get timeline;

}
/// @nodoc
class _$MilestoneCopyWithImpl<$Res>
    implements $MilestoneCopyWith<$Res> {
  _$MilestoneCopyWithImpl(this._self, this._then);

  final Milestone _self;
  final $Res Function(Milestone) _then;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sponsor = null,Object? athlete = null,Object? jobPost = null,Object? application = null,Object? title = null,Object? description = null,Object? timeline = null,Object? fundAmount = null,Object? status = null,Object? paymentStatus = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as MilestoneSponsor,athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as MilestoneAthlete,jobPost: null == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as String,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as MilestoneTimeline,fundAmount: null == fundAmount ? _self.fundAmount : fundAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneSponsorCopyWith<$Res> get sponsor {
  
  return $MilestoneSponsorCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneAthleteCopyWith<$Res> get athlete {
  
  return $MilestoneAthleteCopyWith<$Res>(_self.athlete, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneTimelineCopyWith<$Res> get timeline {
  
  return $MilestoneTimelineCopyWith<$Res>(_self.timeline, (value) {
    return _then(_self.copyWith(timeline: value));
  });
}
}


/// Adds pattern-matching-related methods to [Milestone].
extension MilestonePatterns on Milestone {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Milestone value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Milestone value)  $default,){
final _that = this;
switch (_that) {
case _Milestone():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Milestone value)?  $default,){
final _that = this;
switch (_that) {
case _Milestone() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  MilestoneSponsor sponsor,  MilestoneAthlete athlete,  String jobPost,  String application,  String title,  String description,  MilestoneTimeline timeline,  double fundAmount,  String status,  String paymentStatus,  String? notes,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Milestone() when $default != null:
return $default(_that.id,_that.sponsor,_that.athlete,_that.jobPost,_that.application,_that.title,_that.description,_that.timeline,_that.fundAmount,_that.status,_that.paymentStatus,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  MilestoneSponsor sponsor,  MilestoneAthlete athlete,  String jobPost,  String application,  String title,  String description,  MilestoneTimeline timeline,  double fundAmount,  String status,  String paymentStatus,  String? notes,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Milestone():
return $default(_that.id,_that.sponsor,_that.athlete,_that.jobPost,_that.application,_that.title,_that.description,_that.timeline,_that.fundAmount,_that.status,_that.paymentStatus,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  MilestoneSponsor sponsor,  MilestoneAthlete athlete,  String jobPost,  String application,  String title,  String description,  MilestoneTimeline timeline,  double fundAmount,  String status,  String paymentStatus,  String? notes,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Milestone() when $default != null:
return $default(_that.id,_that.sponsor,_that.athlete,_that.jobPost,_that.application,_that.title,_that.description,_that.timeline,_that.fundAmount,_that.status,_that.paymentStatus,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Milestone implements Milestone {
  const _Milestone({@JsonKey(name: '_id') required this.id, required this.sponsor, required this.athlete, required this.jobPost, required this.application, required this.title, required this.description, required this.timeline, required this.fundAmount, required this.status, required this.paymentStatus, this.notes, required this.createdAt, required this.updatedAt});
  factory _Milestone.fromJson(Map<String, dynamic> json) => _$MilestoneFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  MilestoneSponsor sponsor;
@override final  MilestoneAthlete athlete;
@override final  String jobPost;
@override final  String application;
@override final  String title;
@override final  String description;
@override final  MilestoneTimeline timeline;
@override final  double fundAmount;
@override final  String status;
@override final  String paymentStatus;
@override final  String? notes;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneCopyWith<_Milestone> get copyWith => __$MilestoneCopyWithImpl<_Milestone>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Milestone&&(identical(other.id, id) || other.id == id)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.athlete, athlete) || other.athlete == athlete)&&(identical(other.jobPost, jobPost) || other.jobPost == jobPost)&&(identical(other.application, application) || other.application == application)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.fundAmount, fundAmount) || other.fundAmount == fundAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sponsor,athlete,jobPost,application,title,description,timeline,fundAmount,status,paymentStatus,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Milestone(id: $id, sponsor: $sponsor, athlete: $athlete, jobPost: $jobPost, application: $application, title: $title, description: $description, timeline: $timeline, fundAmount: $fundAmount, status: $status, paymentStatus: $paymentStatus, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MilestoneCopyWith<$Res> implements $MilestoneCopyWith<$Res> {
  factory _$MilestoneCopyWith(_Milestone value, $Res Function(_Milestone) _then) = __$MilestoneCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, MilestoneSponsor sponsor, MilestoneAthlete athlete, String jobPost, String application, String title, String description, MilestoneTimeline timeline, double fundAmount, String status, String paymentStatus, String? notes, DateTime createdAt, DateTime updatedAt
});


@override $MilestoneSponsorCopyWith<$Res> get sponsor;@override $MilestoneAthleteCopyWith<$Res> get athlete;@override $MilestoneTimelineCopyWith<$Res> get timeline;

}
/// @nodoc
class __$MilestoneCopyWithImpl<$Res>
    implements _$MilestoneCopyWith<$Res> {
  __$MilestoneCopyWithImpl(this._self, this._then);

  final _Milestone _self;
  final $Res Function(_Milestone) _then;

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sponsor = null,Object? athlete = null,Object? jobPost = null,Object? application = null,Object? title = null,Object? description = null,Object? timeline = null,Object? fundAmount = null,Object? status = null,Object? paymentStatus = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Milestone(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as MilestoneSponsor,athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as MilestoneAthlete,jobPost: null == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as String,application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as MilestoneTimeline,fundAmount: null == fundAmount ? _self.fundAmount : fundAmount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneSponsorCopyWith<$Res> get sponsor {
  
  return $MilestoneSponsorCopyWith<$Res>(_self.sponsor, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneAthleteCopyWith<$Res> get athlete {
  
  return $MilestoneAthleteCopyWith<$Res>(_self.athlete, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}/// Create a copy of Milestone
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneTimelineCopyWith<$Res> get timeline {
  
  return $MilestoneTimelineCopyWith<$Res>(_self.timeline, (value) {
    return _then(_self.copyWith(timeline: value));
  });
}
}


/// @nodoc
mixin _$CreateMilestoneResponse {

 bool get success; String get message; Milestone get milestone;
/// Create a copy of CreateMilestoneResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMilestoneResponseCopyWith<CreateMilestoneResponse> get copyWith => _$CreateMilestoneResponseCopyWithImpl<CreateMilestoneResponse>(this as CreateMilestoneResponse, _$identity);

  /// Serializes this CreateMilestoneResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMilestoneResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,milestone);

@override
String toString() {
  return 'CreateMilestoneResponse(success: $success, message: $message, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class $CreateMilestoneResponseCopyWith<$Res>  {
  factory $CreateMilestoneResponseCopyWith(CreateMilestoneResponse value, $Res Function(CreateMilestoneResponse) _then) = _$CreateMilestoneResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Milestone milestone
});


$MilestoneCopyWith<$Res> get milestone;

}
/// @nodoc
class _$CreateMilestoneResponseCopyWithImpl<$Res>
    implements $CreateMilestoneResponseCopyWith<$Res> {
  _$CreateMilestoneResponseCopyWithImpl(this._self, this._then);

  final CreateMilestoneResponse _self;
  final $Res Function(CreateMilestoneResponse) _then;

/// Create a copy of CreateMilestoneResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? milestone = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone,
  ));
}
/// Create a copy of CreateMilestoneResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res> get milestone {
  
  return $MilestoneCopyWith<$Res>(_self.milestone, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateMilestoneResponse].
extension CreateMilestoneResponsePatterns on CreateMilestoneResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMilestoneResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMilestoneResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMilestoneResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateMilestoneResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMilestoneResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMilestoneResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Milestone milestone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMilestoneResponse() when $default != null:
return $default(_that.success,_that.message,_that.milestone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Milestone milestone)  $default,) {final _that = this;
switch (_that) {
case _CreateMilestoneResponse():
return $default(_that.success,_that.message,_that.milestone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Milestone milestone)?  $default,) {final _that = this;
switch (_that) {
case _CreateMilestoneResponse() when $default != null:
return $default(_that.success,_that.message,_that.milestone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMilestoneResponse implements CreateMilestoneResponse {
  const _CreateMilestoneResponse({required this.success, required this.message, required this.milestone});
  factory _CreateMilestoneResponse.fromJson(Map<String, dynamic> json) => _$CreateMilestoneResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  Milestone milestone;

/// Create a copy of CreateMilestoneResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMilestoneResponseCopyWith<_CreateMilestoneResponse> get copyWith => __$CreateMilestoneResponseCopyWithImpl<_CreateMilestoneResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMilestoneResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMilestoneResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,milestone);

@override
String toString() {
  return 'CreateMilestoneResponse(success: $success, message: $message, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class _$CreateMilestoneResponseCopyWith<$Res> implements $CreateMilestoneResponseCopyWith<$Res> {
  factory _$CreateMilestoneResponseCopyWith(_CreateMilestoneResponse value, $Res Function(_CreateMilestoneResponse) _then) = __$CreateMilestoneResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Milestone milestone
});


@override $MilestoneCopyWith<$Res> get milestone;

}
/// @nodoc
class __$CreateMilestoneResponseCopyWithImpl<$Res>
    implements _$CreateMilestoneResponseCopyWith<$Res> {
  __$CreateMilestoneResponseCopyWithImpl(this._self, this._then);

  final _CreateMilestoneResponse _self;
  final $Res Function(_CreateMilestoneResponse) _then;

/// Create a copy of CreateMilestoneResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? milestone = null,}) {
  return _then(_CreateMilestoneResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone,
  ));
}

/// Create a copy of CreateMilestoneResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res> get milestone {
  
  return $MilestoneCopyWith<$Res>(_self.milestone, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}


/// @nodoc
mixin _$MilestonesData {

 List<Milestone> get milestones; int get count;
/// Create a copy of MilestonesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestonesDataCopyWith<MilestonesData> get copyWith => _$MilestonesDataCopyWithImpl<MilestonesData>(this as MilestonesData, _$identity);

  /// Serializes this MilestonesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestonesData&&const DeepCollectionEquality().equals(other.milestones, milestones)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(milestones),count);

@override
String toString() {
  return 'MilestonesData(milestones: $milestones, count: $count)';
}


}

/// @nodoc
abstract mixin class $MilestonesDataCopyWith<$Res>  {
  factory $MilestonesDataCopyWith(MilestonesData value, $Res Function(MilestonesData) _then) = _$MilestonesDataCopyWithImpl;
@useResult
$Res call({
 List<Milestone> milestones, int count
});




}
/// @nodoc
class _$MilestonesDataCopyWithImpl<$Res>
    implements $MilestonesDataCopyWith<$Res> {
  _$MilestonesDataCopyWithImpl(this._self, this._then);

  final MilestonesData _self;
  final $Res Function(MilestonesData) _then;

/// Create a copy of MilestonesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? milestones = null,Object? count = null,}) {
  return _then(_self.copyWith(
milestones: null == milestones ? _self.milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestonesData].
extension MilestonesDataPatterns on MilestonesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestonesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestonesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestonesData value)  $default,){
final _that = this;
switch (_that) {
case _MilestonesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestonesData value)?  $default,){
final _that = this;
switch (_that) {
case _MilestonesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Milestone> milestones,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestonesData() when $default != null:
return $default(_that.milestones,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Milestone> milestones,  int count)  $default,) {final _that = this;
switch (_that) {
case _MilestonesData():
return $default(_that.milestones,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Milestone> milestones,  int count)?  $default,) {final _that = this;
switch (_that) {
case _MilestonesData() when $default != null:
return $default(_that.milestones,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestonesData implements MilestonesData {
  const _MilestonesData({required final  List<Milestone> milestones, required this.count}): _milestones = milestones;
  factory _MilestonesData.fromJson(Map<String, dynamic> json) => _$MilestonesDataFromJson(json);

 final  List<Milestone> _milestones;
@override List<Milestone> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}

@override final  int count;

/// Create a copy of MilestonesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestonesDataCopyWith<_MilestonesData> get copyWith => __$MilestonesDataCopyWithImpl<_MilestonesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestonesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestonesData&&const DeepCollectionEquality().equals(other._milestones, _milestones)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_milestones),count);

@override
String toString() {
  return 'MilestonesData(milestones: $milestones, count: $count)';
}


}

/// @nodoc
abstract mixin class _$MilestonesDataCopyWith<$Res> implements $MilestonesDataCopyWith<$Res> {
  factory _$MilestonesDataCopyWith(_MilestonesData value, $Res Function(_MilestonesData) _then) = __$MilestonesDataCopyWithImpl;
@override @useResult
$Res call({
 List<Milestone> milestones, int count
});




}
/// @nodoc
class __$MilestonesDataCopyWithImpl<$Res>
    implements _$MilestonesDataCopyWith<$Res> {
  __$MilestonesDataCopyWithImpl(this._self, this._then);

  final _MilestonesData _self;
  final $Res Function(_MilestonesData) _then;

/// Create a copy of MilestonesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? milestones = null,Object? count = null,}) {
  return _then(_MilestonesData(
milestones: null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GetMilestonesResponse {

 bool get success; String get message; MilestonesData get data;
/// Create a copy of GetMilestonesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMilestonesResponseCopyWith<GetMilestonesResponse> get copyWith => _$GetMilestonesResponseCopyWithImpl<GetMilestonesResponse>(this as GetMilestonesResponse, _$identity);

  /// Serializes this GetMilestonesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMilestonesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'GetMilestonesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetMilestonesResponseCopyWith<$Res>  {
  factory $GetMilestonesResponseCopyWith(GetMilestonesResponse value, $Res Function(GetMilestonesResponse) _then) = _$GetMilestonesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, MilestonesData data
});


$MilestonesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$GetMilestonesResponseCopyWithImpl<$Res>
    implements $GetMilestonesResponseCopyWith<$Res> {
  _$GetMilestonesResponseCopyWithImpl(this._self, this._then);

  final GetMilestonesResponse _self;
  final $Res Function(GetMilestonesResponse) _then;

/// Create a copy of GetMilestonesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MilestonesData,
  ));
}
/// Create a copy of GetMilestonesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestonesDataCopyWith<$Res> get data {
  
  return $MilestonesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetMilestonesResponse].
extension GetMilestonesResponsePatterns on GetMilestonesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetMilestonesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMilestonesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetMilestonesResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetMilestonesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetMilestonesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetMilestonesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  MilestonesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMilestonesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  MilestonesData data)  $default,) {final _that = this;
switch (_that) {
case _GetMilestonesResponse():
return $default(_that.success,_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  MilestonesData data)?  $default,) {final _that = this;
switch (_that) {
case _GetMilestonesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetMilestonesResponse implements GetMilestonesResponse {
  const _GetMilestonesResponse({required this.success, required this.message, required this.data});
  factory _GetMilestonesResponse.fromJson(Map<String, dynamic> json) => _$GetMilestonesResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  MilestonesData data;

/// Create a copy of GetMilestonesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMilestonesResponseCopyWith<_GetMilestonesResponse> get copyWith => __$GetMilestonesResponseCopyWithImpl<_GetMilestonesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetMilestonesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMilestonesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'GetMilestonesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetMilestonesResponseCopyWith<$Res> implements $GetMilestonesResponseCopyWith<$Res> {
  factory _$GetMilestonesResponseCopyWith(_GetMilestonesResponse value, $Res Function(_GetMilestonesResponse) _then) = __$GetMilestonesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, MilestonesData data
});


@override $MilestonesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$GetMilestonesResponseCopyWithImpl<$Res>
    implements _$GetMilestonesResponseCopyWith<$Res> {
  __$GetMilestonesResponseCopyWithImpl(this._self, this._then);

  final _GetMilestonesResponse _self;
  final $Res Function(_GetMilestonesResponse) _then;

/// Create a copy of GetMilestonesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_GetMilestonesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MilestonesData,
  ));
}

/// Create a copy of GetMilestonesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestonesDataCopyWith<$Res> get data {
  
  return $MilestonesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$GetMilestoneByIdResponse {

 bool get success; String get message; Milestone get milestone;
/// Create a copy of GetMilestoneByIdResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMilestoneByIdResponseCopyWith<GetMilestoneByIdResponse> get copyWith => _$GetMilestoneByIdResponseCopyWithImpl<GetMilestoneByIdResponse>(this as GetMilestoneByIdResponse, _$identity);

  /// Serializes this GetMilestoneByIdResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMilestoneByIdResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,milestone);

@override
String toString() {
  return 'GetMilestoneByIdResponse(success: $success, message: $message, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class $GetMilestoneByIdResponseCopyWith<$Res>  {
  factory $GetMilestoneByIdResponseCopyWith(GetMilestoneByIdResponse value, $Res Function(GetMilestoneByIdResponse) _then) = _$GetMilestoneByIdResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Milestone milestone
});


$MilestoneCopyWith<$Res> get milestone;

}
/// @nodoc
class _$GetMilestoneByIdResponseCopyWithImpl<$Res>
    implements $GetMilestoneByIdResponseCopyWith<$Res> {
  _$GetMilestoneByIdResponseCopyWithImpl(this._self, this._then);

  final GetMilestoneByIdResponse _self;
  final $Res Function(GetMilestoneByIdResponse) _then;

/// Create a copy of GetMilestoneByIdResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? milestone = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone,
  ));
}
/// Create a copy of GetMilestoneByIdResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res> get milestone {
  
  return $MilestoneCopyWith<$Res>(_self.milestone, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetMilestoneByIdResponse].
extension GetMilestoneByIdResponsePatterns on GetMilestoneByIdResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetMilestoneByIdResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetMilestoneByIdResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetMilestoneByIdResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetMilestoneByIdResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetMilestoneByIdResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetMilestoneByIdResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Milestone milestone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetMilestoneByIdResponse() when $default != null:
return $default(_that.success,_that.message,_that.milestone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Milestone milestone)  $default,) {final _that = this;
switch (_that) {
case _GetMilestoneByIdResponse():
return $default(_that.success,_that.message,_that.milestone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Milestone milestone)?  $default,) {final _that = this;
switch (_that) {
case _GetMilestoneByIdResponse() when $default != null:
return $default(_that.success,_that.message,_that.milestone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetMilestoneByIdResponse implements GetMilestoneByIdResponse {
  const _GetMilestoneByIdResponse({required this.success, required this.message, required this.milestone});
  factory _GetMilestoneByIdResponse.fromJson(Map<String, dynamic> json) => _$GetMilestoneByIdResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  Milestone milestone;

/// Create a copy of GetMilestoneByIdResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMilestoneByIdResponseCopyWith<_GetMilestoneByIdResponse> get copyWith => __$GetMilestoneByIdResponseCopyWithImpl<_GetMilestoneByIdResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetMilestoneByIdResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMilestoneByIdResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,milestone);

@override
String toString() {
  return 'GetMilestoneByIdResponse(success: $success, message: $message, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class _$GetMilestoneByIdResponseCopyWith<$Res> implements $GetMilestoneByIdResponseCopyWith<$Res> {
  factory _$GetMilestoneByIdResponseCopyWith(_GetMilestoneByIdResponse value, $Res Function(_GetMilestoneByIdResponse) _then) = __$GetMilestoneByIdResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Milestone milestone
});


@override $MilestoneCopyWith<$Res> get milestone;

}
/// @nodoc
class __$GetMilestoneByIdResponseCopyWithImpl<$Res>
    implements _$GetMilestoneByIdResponseCopyWith<$Res> {
  __$GetMilestoneByIdResponseCopyWithImpl(this._self, this._then);

  final _GetMilestoneByIdResponse _self;
  final $Res Function(_GetMilestoneByIdResponse) _then;

/// Create a copy of GetMilestoneByIdResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? milestone = null,}) {
  return _then(_GetMilestoneByIdResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone,
  ));
}

/// Create a copy of GetMilestoneByIdResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res> get milestone {
  
  return $MilestoneCopyWith<$Res>(_self.milestone, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}


/// @nodoc
mixin _$UpdateMilestoneStatusRequest {

 String get status;
/// Create a copy of UpdateMilestoneStatusRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMilestoneStatusRequestCopyWith<UpdateMilestoneStatusRequest> get copyWith => _$UpdateMilestoneStatusRequestCopyWithImpl<UpdateMilestoneStatusRequest>(this as UpdateMilestoneStatusRequest, _$identity);

  /// Serializes this UpdateMilestoneStatusRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMilestoneStatusRequest&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'UpdateMilestoneStatusRequest(status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateMilestoneStatusRequestCopyWith<$Res>  {
  factory $UpdateMilestoneStatusRequestCopyWith(UpdateMilestoneStatusRequest value, $Res Function(UpdateMilestoneStatusRequest) _then) = _$UpdateMilestoneStatusRequestCopyWithImpl;
@useResult
$Res call({
 String status
});




}
/// @nodoc
class _$UpdateMilestoneStatusRequestCopyWithImpl<$Res>
    implements $UpdateMilestoneStatusRequestCopyWith<$Res> {
  _$UpdateMilestoneStatusRequestCopyWithImpl(this._self, this._then);

  final UpdateMilestoneStatusRequest _self;
  final $Res Function(UpdateMilestoneStatusRequest) _then;

/// Create a copy of UpdateMilestoneStatusRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateMilestoneStatusRequest].
extension UpdateMilestoneStatusRequestPatterns on UpdateMilestoneStatusRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateMilestoneStatusRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateMilestoneStatusRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateMilestoneStatusRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateMilestoneStatusRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateMilestoneStatusRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateMilestoneStatusRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateMilestoneStatusRequest() when $default != null:
return $default(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status)  $default,) {final _that = this;
switch (_that) {
case _UpdateMilestoneStatusRequest():
return $default(_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateMilestoneStatusRequest() when $default != null:
return $default(_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateMilestoneStatusRequest implements UpdateMilestoneStatusRequest {
  const _UpdateMilestoneStatusRequest({required this.status});
  factory _UpdateMilestoneStatusRequest.fromJson(Map<String, dynamic> json) => _$UpdateMilestoneStatusRequestFromJson(json);

@override final  String status;

/// Create a copy of UpdateMilestoneStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMilestoneStatusRequestCopyWith<_UpdateMilestoneStatusRequest> get copyWith => __$UpdateMilestoneStatusRequestCopyWithImpl<_UpdateMilestoneStatusRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateMilestoneStatusRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMilestoneStatusRequest&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'UpdateMilestoneStatusRequest(status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateMilestoneStatusRequestCopyWith<$Res> implements $UpdateMilestoneStatusRequestCopyWith<$Res> {
  factory _$UpdateMilestoneStatusRequestCopyWith(_UpdateMilestoneStatusRequest value, $Res Function(_UpdateMilestoneStatusRequest) _then) = __$UpdateMilestoneStatusRequestCopyWithImpl;
@override @useResult
$Res call({
 String status
});




}
/// @nodoc
class __$UpdateMilestoneStatusRequestCopyWithImpl<$Res>
    implements _$UpdateMilestoneStatusRequestCopyWith<$Res> {
  __$UpdateMilestoneStatusRequestCopyWithImpl(this._self, this._then);

  final _UpdateMilestoneStatusRequest _self;
  final $Res Function(_UpdateMilestoneStatusRequest) _then;

/// Create a copy of UpdateMilestoneStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_UpdateMilestoneStatusRequest(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateMilestoneStatusResponse {

 bool get success; String get message; Milestone get milestone;
/// Create a copy of UpdateMilestoneStatusResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMilestoneStatusResponseCopyWith<UpdateMilestoneStatusResponse> get copyWith => _$UpdateMilestoneStatusResponseCopyWithImpl<UpdateMilestoneStatusResponse>(this as UpdateMilestoneStatusResponse, _$identity);

  /// Serializes this UpdateMilestoneStatusResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMilestoneStatusResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,milestone);

@override
String toString() {
  return 'UpdateMilestoneStatusResponse(success: $success, message: $message, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class $UpdateMilestoneStatusResponseCopyWith<$Res>  {
  factory $UpdateMilestoneStatusResponseCopyWith(UpdateMilestoneStatusResponse value, $Res Function(UpdateMilestoneStatusResponse) _then) = _$UpdateMilestoneStatusResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Milestone milestone
});


$MilestoneCopyWith<$Res> get milestone;

}
/// @nodoc
class _$UpdateMilestoneStatusResponseCopyWithImpl<$Res>
    implements $UpdateMilestoneStatusResponseCopyWith<$Res> {
  _$UpdateMilestoneStatusResponseCopyWithImpl(this._self, this._then);

  final UpdateMilestoneStatusResponse _self;
  final $Res Function(UpdateMilestoneStatusResponse) _then;

/// Create a copy of UpdateMilestoneStatusResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? milestone = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone,
  ));
}
/// Create a copy of UpdateMilestoneStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res> get milestone {
  
  return $MilestoneCopyWith<$Res>(_self.milestone, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateMilestoneStatusResponse].
extension UpdateMilestoneStatusResponsePatterns on UpdateMilestoneStatusResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateMilestoneStatusResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateMilestoneStatusResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateMilestoneStatusResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateMilestoneStatusResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateMilestoneStatusResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateMilestoneStatusResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Milestone milestone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateMilestoneStatusResponse() when $default != null:
return $default(_that.success,_that.message,_that.milestone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Milestone milestone)  $default,) {final _that = this;
switch (_that) {
case _UpdateMilestoneStatusResponse():
return $default(_that.success,_that.message,_that.milestone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Milestone milestone)?  $default,) {final _that = this;
switch (_that) {
case _UpdateMilestoneStatusResponse() when $default != null:
return $default(_that.success,_that.message,_that.milestone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateMilestoneStatusResponse implements UpdateMilestoneStatusResponse {
  const _UpdateMilestoneStatusResponse({required this.success, required this.message, required this.milestone});
  factory _UpdateMilestoneStatusResponse.fromJson(Map<String, dynamic> json) => _$UpdateMilestoneStatusResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  Milestone milestone;

/// Create a copy of UpdateMilestoneStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMilestoneStatusResponseCopyWith<_UpdateMilestoneStatusResponse> get copyWith => __$UpdateMilestoneStatusResponseCopyWithImpl<_UpdateMilestoneStatusResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateMilestoneStatusResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMilestoneStatusResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.milestone, milestone) || other.milestone == milestone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,milestone);

@override
String toString() {
  return 'UpdateMilestoneStatusResponse(success: $success, message: $message, milestone: $milestone)';
}


}

/// @nodoc
abstract mixin class _$UpdateMilestoneStatusResponseCopyWith<$Res> implements $UpdateMilestoneStatusResponseCopyWith<$Res> {
  factory _$UpdateMilestoneStatusResponseCopyWith(_UpdateMilestoneStatusResponse value, $Res Function(_UpdateMilestoneStatusResponse) _then) = __$UpdateMilestoneStatusResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Milestone milestone
});


@override $MilestoneCopyWith<$Res> get milestone;

}
/// @nodoc
class __$UpdateMilestoneStatusResponseCopyWithImpl<$Res>
    implements _$UpdateMilestoneStatusResponseCopyWith<$Res> {
  __$UpdateMilestoneStatusResponseCopyWithImpl(this._self, this._then);

  final _UpdateMilestoneStatusResponse _self;
  final $Res Function(_UpdateMilestoneStatusResponse) _then;

/// Create a copy of UpdateMilestoneStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? milestone = null,}) {
  return _then(_UpdateMilestoneStatusResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,milestone: null == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone,
  ));
}

/// Create a copy of UpdateMilestoneStatusResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res> get milestone {
  
  return $MilestoneCopyWith<$Res>(_self.milestone, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}

// dart format on
