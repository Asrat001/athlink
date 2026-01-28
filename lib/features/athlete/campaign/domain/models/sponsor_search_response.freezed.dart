// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorSearchResponse {

 bool get success; String get message; SponsorSearchData get data;
/// Create a copy of SponsorSearchResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSearchResponseCopyWith<SponsorSearchResponse> get copyWith => _$SponsorSearchResponseCopyWithImpl<SponsorSearchResponse>(this as SponsorSearchResponse, _$identity);

  /// Serializes this SponsorSearchResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSearchResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SponsorSearchResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SponsorSearchResponseCopyWith<$Res>  {
  factory $SponsorSearchResponseCopyWith(SponsorSearchResponse value, $Res Function(SponsorSearchResponse) _then) = _$SponsorSearchResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, SponsorSearchData data
});


$SponsorSearchDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SponsorSearchResponseCopyWithImpl<$Res>
    implements $SponsorSearchResponseCopyWith<$Res> {
  _$SponsorSearchResponseCopyWithImpl(this._self, this._then);

  final SponsorSearchResponse _self;
  final $Res Function(SponsorSearchResponse) _then;

/// Create a copy of SponsorSearchResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SponsorSearchData,
  ));
}
/// Create a copy of SponsorSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorSearchDataCopyWith<$Res> get data {
  
  return $SponsorSearchDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorSearchResponse].
extension SponsorSearchResponsePatterns on SponsorSearchResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSearchResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSearchResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSearchResponse value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSearchResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSearchResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSearchResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  SponsorSearchData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSearchResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  SponsorSearchData data)  $default,) {final _that = this;
switch (_that) {
case _SponsorSearchResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  SponsorSearchData data)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSearchResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSearchResponse implements SponsorSearchResponse {
  const _SponsorSearchResponse({required this.success, required this.message, required this.data});
  factory _SponsorSearchResponse.fromJson(Map<String, dynamic> json) => _$SponsorSearchResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  SponsorSearchData data;

/// Create a copy of SponsorSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSearchResponseCopyWith<_SponsorSearchResponse> get copyWith => __$SponsorSearchResponseCopyWithImpl<_SponsorSearchResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSearchResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSearchResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SponsorSearchResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SponsorSearchResponseCopyWith<$Res> implements $SponsorSearchResponseCopyWith<$Res> {
  factory _$SponsorSearchResponseCopyWith(_SponsorSearchResponse value, $Res Function(_SponsorSearchResponse) _then) = __$SponsorSearchResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, SponsorSearchData data
});


@override $SponsorSearchDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SponsorSearchResponseCopyWithImpl<$Res>
    implements _$SponsorSearchResponseCopyWith<$Res> {
  __$SponsorSearchResponseCopyWithImpl(this._self, this._then);

  final _SponsorSearchResponse _self;
  final $Res Function(_SponsorSearchResponse) _then;

/// Create a copy of SponsorSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_SponsorSearchResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SponsorSearchData,
  ));
}

/// Create a copy of SponsorSearchResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorSearchDataCopyWith<$Res> get data {
  
  return $SponsorSearchDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SponsorSearchData {

 List<SponsorSearchModel> get sponsors; int get count;
/// Create a copy of SponsorSearchData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSearchDataCopyWith<SponsorSearchData> get copyWith => _$SponsorSearchDataCopyWithImpl<SponsorSearchData>(this as SponsorSearchData, _$identity);

  /// Serializes this SponsorSearchData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSearchData&&const DeepCollectionEquality().equals(other.sponsors, sponsors)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sponsors),count);

@override
String toString() {
  return 'SponsorSearchData(sponsors: $sponsors, count: $count)';
}


}

/// @nodoc
abstract mixin class $SponsorSearchDataCopyWith<$Res>  {
  factory $SponsorSearchDataCopyWith(SponsorSearchData value, $Res Function(SponsorSearchData) _then) = _$SponsorSearchDataCopyWithImpl;
@useResult
$Res call({
 List<SponsorSearchModel> sponsors, int count
});




}
/// @nodoc
class _$SponsorSearchDataCopyWithImpl<$Res>
    implements $SponsorSearchDataCopyWith<$Res> {
  _$SponsorSearchDataCopyWithImpl(this._self, this._then);

  final SponsorSearchData _self;
  final $Res Function(SponsorSearchData) _then;

/// Create a copy of SponsorSearchData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sponsors = null,Object? count = null,}) {
  return _then(_self.copyWith(
sponsors: null == sponsors ? _self.sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<SponsorSearchModel>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorSearchData].
extension SponsorSearchDataPatterns on SponsorSearchData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSearchData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSearchData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSearchData value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSearchData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSearchData value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSearchData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SponsorSearchModel> sponsors,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSearchData() when $default != null:
return $default(_that.sponsors,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SponsorSearchModel> sponsors,  int count)  $default,) {final _that = this;
switch (_that) {
case _SponsorSearchData():
return $default(_that.sponsors,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SponsorSearchModel> sponsors,  int count)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSearchData() when $default != null:
return $default(_that.sponsors,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSearchData implements SponsorSearchData {
  const _SponsorSearchData({required final  List<SponsorSearchModel> sponsors, required this.count}): _sponsors = sponsors;
  factory _SponsorSearchData.fromJson(Map<String, dynamic> json) => _$SponsorSearchDataFromJson(json);

 final  List<SponsorSearchModel> _sponsors;
@override List<SponsorSearchModel> get sponsors {
  if (_sponsors is EqualUnmodifiableListView) return _sponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sponsors);
}

@override final  int count;

/// Create a copy of SponsorSearchData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSearchDataCopyWith<_SponsorSearchData> get copyWith => __$SponsorSearchDataCopyWithImpl<_SponsorSearchData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSearchDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSearchData&&const DeepCollectionEquality().equals(other._sponsors, _sponsors)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sponsors),count);

@override
String toString() {
  return 'SponsorSearchData(sponsors: $sponsors, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SponsorSearchDataCopyWith<$Res> implements $SponsorSearchDataCopyWith<$Res> {
  factory _$SponsorSearchDataCopyWith(_SponsorSearchData value, $Res Function(_SponsorSearchData) _then) = __$SponsorSearchDataCopyWithImpl;
@override @useResult
$Res call({
 List<SponsorSearchModel> sponsors, int count
});




}
/// @nodoc
class __$SponsorSearchDataCopyWithImpl<$Res>
    implements _$SponsorSearchDataCopyWith<$Res> {
  __$SponsorSearchDataCopyWithImpl(this._self, this._then);

  final _SponsorSearchData _self;
  final $Res Function(_SponsorSearchData) _then;

/// Create a copy of SponsorSearchData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sponsors = null,Object? count = null,}) {
  return _then(_SponsorSearchData(
sponsors: null == sponsors ? _self._sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<SponsorSearchModel>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SponsorSearchModel {

@JsonKey(name: '_id') String get id; String get email; String get role; SponsorProfileModel get sponsorProfile; List<SponsorSportModel> get sport; bool get isOnline; String? get lastSeenAt;
/// Create a copy of SponsorSearchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSearchModelCopyWith<SponsorSearchModel> get copyWith => _$SponsorSearchModelCopyWithImpl<SponsorSearchModel>(this as SponsorSearchModel, _$identity);

  /// Serializes this SponsorSearchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSearchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile)&&const DeepCollectionEquality().equals(other.sport, sport)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,sponsorProfile,const DeepCollectionEquality().hash(sport),isOnline,lastSeenAt);

@override
String toString() {
  return 'SponsorSearchModel(id: $id, email: $email, role: $role, sponsorProfile: $sponsorProfile, sport: $sport, isOnline: $isOnline, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $SponsorSearchModelCopyWith<$Res>  {
  factory $SponsorSearchModelCopyWith(SponsorSearchModel value, $Res Function(SponsorSearchModel) _then) = _$SponsorSearchModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String email, String role, SponsorProfileModel sponsorProfile, List<SponsorSportModel> sport, bool isOnline, String? lastSeenAt
});


$SponsorProfileModelCopyWith<$Res> get sponsorProfile;

}
/// @nodoc
class _$SponsorSearchModelCopyWithImpl<$Res>
    implements $SponsorSearchModelCopyWith<$Res> {
  _$SponsorSearchModelCopyWithImpl(this._self, this._then);

  final SponsorSearchModel _self;
  final $Res Function(SponsorSearchModel) _then;

/// Create a copy of SponsorSearchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = null,Object? sponsorProfile = null,Object? sport = null,Object? isOnline = null,Object? lastSeenAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,sponsorProfile: null == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as SponsorProfileModel,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as List<SponsorSportModel>,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SponsorSearchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorProfileModelCopyWith<$Res> get sponsorProfile {
  
  return $SponsorProfileModelCopyWith<$Res>(_self.sponsorProfile, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorSearchModel].
extension SponsorSearchModelPatterns on SponsorSearchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSearchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSearchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSearchModel value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSearchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSearchModel value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSearchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String email,  String role,  SponsorProfileModel sponsorProfile,  List<SponsorSportModel> sport,  bool isOnline,  String? lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSearchModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.sponsorProfile,_that.sport,_that.isOnline,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String email,  String role,  SponsorProfileModel sponsorProfile,  List<SponsorSportModel> sport,  bool isOnline,  String? lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _SponsorSearchModel():
return $default(_that.id,_that.email,_that.role,_that.sponsorProfile,_that.sport,_that.isOnline,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String email,  String role,  SponsorProfileModel sponsorProfile,  List<SponsorSportModel> sport,  bool isOnline,  String? lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSearchModel() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.sponsorProfile,_that.sport,_that.isOnline,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSearchModel implements SponsorSearchModel {
  const _SponsorSearchModel({@JsonKey(name: '_id') required this.id, required this.email, required this.role, required this.sponsorProfile, required final  List<SponsorSportModel> sport, required this.isOnline, this.lastSeenAt}): _sport = sport;
  factory _SponsorSearchModel.fromJson(Map<String, dynamic> json) => _$SponsorSearchModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String email;
@override final  String role;
@override final  SponsorProfileModel sponsorProfile;
 final  List<SponsorSportModel> _sport;
@override List<SponsorSportModel> get sport {
  if (_sport is EqualUnmodifiableListView) return _sport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sport);
}

@override final  bool isOnline;
@override final  String? lastSeenAt;

/// Create a copy of SponsorSearchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSearchModelCopyWith<_SponsorSearchModel> get copyWith => __$SponsorSearchModelCopyWithImpl<_SponsorSearchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSearchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSearchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile)&&const DeepCollectionEquality().equals(other._sport, _sport)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,sponsorProfile,const DeepCollectionEquality().hash(_sport),isOnline,lastSeenAt);

@override
String toString() {
  return 'SponsorSearchModel(id: $id, email: $email, role: $role, sponsorProfile: $sponsorProfile, sport: $sport, isOnline: $isOnline, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$SponsorSearchModelCopyWith<$Res> implements $SponsorSearchModelCopyWith<$Res> {
  factory _$SponsorSearchModelCopyWith(_SponsorSearchModel value, $Res Function(_SponsorSearchModel) _then) = __$SponsorSearchModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String email, String role, SponsorProfileModel sponsorProfile, List<SponsorSportModel> sport, bool isOnline, String? lastSeenAt
});


@override $SponsorProfileModelCopyWith<$Res> get sponsorProfile;

}
/// @nodoc
class __$SponsorSearchModelCopyWithImpl<$Res>
    implements _$SponsorSearchModelCopyWith<$Res> {
  __$SponsorSearchModelCopyWithImpl(this._self, this._then);

  final _SponsorSearchModel _self;
  final $Res Function(_SponsorSearchModel) _then;

/// Create a copy of SponsorSearchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = null,Object? sponsorProfile = null,Object? sport = null,Object? isOnline = null,Object? lastSeenAt = freezed,}) {
  return _then(_SponsorSearchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,sponsorProfile: null == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as SponsorProfileModel,sport: null == sport ? _self._sport : sport // ignore: cast_nullable_to_non_nullable
as List<SponsorSportModel>,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SponsorSearchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorProfileModelCopyWith<$Res> get sponsorProfile {
  
  return $SponsorProfileModelCopyWith<$Res>(_self.sponsorProfile, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// @nodoc
mixin _$SponsorProfileModel {

 String get name; String? get address; String? get profileImageUrl; String? get description;
/// Create a copy of SponsorProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorProfileModelCopyWith<SponsorProfileModel> get copyWith => _$SponsorProfileModelCopyWithImpl<SponsorProfileModel>(this as SponsorProfileModel, _$identity);

  /// Serializes this SponsorProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorProfileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,profileImageUrl,description);

@override
String toString() {
  return 'SponsorProfileModel(name: $name, address: $address, profileImageUrl: $profileImageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class $SponsorProfileModelCopyWith<$Res>  {
  factory $SponsorProfileModelCopyWith(SponsorProfileModel value, $Res Function(SponsorProfileModel) _then) = _$SponsorProfileModelCopyWithImpl;
@useResult
$Res call({
 String name, String? address, String? profileImageUrl, String? description
});




}
/// @nodoc
class _$SponsorProfileModelCopyWithImpl<$Res>
    implements $SponsorProfileModelCopyWith<$Res> {
  _$SponsorProfileModelCopyWithImpl(this._self, this._then);

  final SponsorProfileModel _self;
  final $Res Function(SponsorProfileModel) _then;

/// Create a copy of SponsorProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = freezed,Object? profileImageUrl = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorProfileModel].
extension SponsorProfileModelPatterns on SponsorProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _SponsorProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? address,  String? profileImageUrl,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorProfileModel() when $default != null:
return $default(_that.name,_that.address,_that.profileImageUrl,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? address,  String? profileImageUrl,  String? description)  $default,) {final _that = this;
switch (_that) {
case _SponsorProfileModel():
return $default(_that.name,_that.address,_that.profileImageUrl,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? address,  String? profileImageUrl,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _SponsorProfileModel() when $default != null:
return $default(_that.name,_that.address,_that.profileImageUrl,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorProfileModel implements SponsorProfileModel {
  const _SponsorProfileModel({required this.name, this.address, this.profileImageUrl, this.description});
  factory _SponsorProfileModel.fromJson(Map<String, dynamic> json) => _$SponsorProfileModelFromJson(json);

@override final  String name;
@override final  String? address;
@override final  String? profileImageUrl;
@override final  String? description;

/// Create a copy of SponsorProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorProfileModelCopyWith<_SponsorProfileModel> get copyWith => __$SponsorProfileModelCopyWithImpl<_SponsorProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorProfileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,profileImageUrl,description);

@override
String toString() {
  return 'SponsorProfileModel(name: $name, address: $address, profileImageUrl: $profileImageUrl, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SponsorProfileModelCopyWith<$Res> implements $SponsorProfileModelCopyWith<$Res> {
  factory _$SponsorProfileModelCopyWith(_SponsorProfileModel value, $Res Function(_SponsorProfileModel) _then) = __$SponsorProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String? address, String? profileImageUrl, String? description
});




}
/// @nodoc
class __$SponsorProfileModelCopyWithImpl<$Res>
    implements _$SponsorProfileModelCopyWith<$Res> {
  __$SponsorProfileModelCopyWithImpl(this._self, this._then);

  final _SponsorProfileModel _self;
  final $Res Function(_SponsorProfileModel) _then;

/// Create a copy of SponsorProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = freezed,Object? profileImageUrl = freezed,Object? description = freezed,}) {
  return _then(_SponsorProfileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SponsorSportModel {

@JsonKey(name: '_id') String get id; String get name; String? get icon;
/// Create a copy of SponsorSportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorSportModelCopyWith<SponsorSportModel> get copyWith => _$SponsorSportModelCopyWithImpl<SponsorSportModel>(this as SponsorSportModel, _$identity);

  /// Serializes this SponsorSportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorSportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'SponsorSportModel(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $SponsorSportModelCopyWith<$Res>  {
  factory $SponsorSportModelCopyWith(SponsorSportModel value, $Res Function(SponsorSportModel) _then) = _$SponsorSportModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String? icon
});




}
/// @nodoc
class _$SponsorSportModelCopyWithImpl<$Res>
    implements $SponsorSportModelCopyWith<$Res> {
  _$SponsorSportModelCopyWithImpl(this._self, this._then);

  final SponsorSportModel _self;
  final $Res Function(SponsorSportModel) _then;

/// Create a copy of SponsorSportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorSportModel].
extension SponsorSportModelPatterns on SponsorSportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorSportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorSportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorSportModel value)  $default,){
final _that = this;
switch (_that) {
case _SponsorSportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorSportModel value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorSportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorSportModel() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String id,  String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _SponsorSportModel():
return $default(_that.id,_that.name,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String id,  String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _SponsorSportModel() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorSportModel implements SponsorSportModel {
  const _SponsorSportModel({@JsonKey(name: '_id') required this.id, required this.name, this.icon});
  factory _SponsorSportModel.fromJson(Map<String, dynamic> json) => _$SponsorSportModelFromJson(json);

@override@JsonKey(name: '_id') final  String id;
@override final  String name;
@override final  String? icon;

/// Create a copy of SponsorSportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorSportModelCopyWith<_SponsorSportModel> get copyWith => __$SponsorSportModelCopyWithImpl<_SponsorSportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorSportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorSportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'SponsorSportModel(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$SponsorSportModelCopyWith<$Res> implements $SponsorSportModelCopyWith<$Res> {
  factory _$SponsorSportModelCopyWith(_SponsorSportModel value, $Res Function(_SponsorSportModel) _then) = __$SponsorSportModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String id, String name, String? icon
});




}
/// @nodoc
class __$SponsorSportModelCopyWithImpl<$Res>
    implements _$SponsorSportModelCopyWith<$Res> {
  __$SponsorSportModelCopyWithImpl(this._self, this._then);

  final _SponsorSportModel _self;
  final $Res Function(_SponsorSportModel) _then;

/// Create a copy of SponsorSportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_SponsorSportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
