// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobListResponse {

 bool get success; List<JobPostItem> get jobPosts; String? get companyName; String? get companyLogo;
/// Create a copy of JobListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobListResponseCopyWith<JobListResponse> get copyWith => _$JobListResponseCopyWithImpl<JobListResponse>(this as JobListResponse, _$identity);

  /// Serializes this JobListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobListResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other.jobPosts, jobPosts)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(jobPosts),companyName,companyLogo);

@override
String toString() {
  return 'JobListResponse(success: $success, jobPosts: $jobPosts, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class $JobListResponseCopyWith<$Res>  {
  factory $JobListResponseCopyWith(JobListResponse value, $Res Function(JobListResponse) _then) = _$JobListResponseCopyWithImpl;
@useResult
$Res call({
 bool success, List<JobPostItem> jobPosts, String? companyName, String? companyLogo
});




}
/// @nodoc
class _$JobListResponseCopyWithImpl<$Res>
    implements $JobListResponseCopyWith<$Res> {
  _$JobListResponseCopyWithImpl(this._self, this._then);

  final JobListResponse _self;
  final $Res Function(JobListResponse) _then;

/// Create a copy of JobListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? jobPosts = null,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,jobPosts: null == jobPosts ? _self.jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<JobPostItem>,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobListResponse].
extension JobListResponsePatterns on JobListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobListResponse value)  $default,){
final _that = this;
switch (_that) {
case _JobListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JobListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  List<JobPostItem> jobPosts,  String? companyName,  String? companyLogo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobListResponse() when $default != null:
return $default(_that.success,_that.jobPosts,_that.companyName,_that.companyLogo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  List<JobPostItem> jobPosts,  String? companyName,  String? companyLogo)  $default,) {final _that = this;
switch (_that) {
case _JobListResponse():
return $default(_that.success,_that.jobPosts,_that.companyName,_that.companyLogo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  List<JobPostItem> jobPosts,  String? companyName,  String? companyLogo)?  $default,) {final _that = this;
switch (_that) {
case _JobListResponse() when $default != null:
return $default(_that.success,_that.jobPosts,_that.companyName,_that.companyLogo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobListResponse implements JobListResponse {
  const _JobListResponse({required this.success, required final  List<JobPostItem> jobPosts, this.companyName, this.companyLogo}): _jobPosts = jobPosts;
  factory _JobListResponse.fromJson(Map<String, dynamic> json) => _$JobListResponseFromJson(json);

@override final  bool success;
 final  List<JobPostItem> _jobPosts;
@override List<JobPostItem> get jobPosts {
  if (_jobPosts is EqualUnmodifiableListView) return _jobPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobPosts);
}

@override final  String? companyName;
@override final  String? companyLogo;

/// Create a copy of JobListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobListResponseCopyWith<_JobListResponse> get copyWith => __$JobListResponseCopyWithImpl<_JobListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobListResponse&&(identical(other.success, success) || other.success == success)&&const DeepCollectionEquality().equals(other._jobPosts, _jobPosts)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,const DeepCollectionEquality().hash(_jobPosts),companyName,companyLogo);

@override
String toString() {
  return 'JobListResponse(success: $success, jobPosts: $jobPosts, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class _$JobListResponseCopyWith<$Res> implements $JobListResponseCopyWith<$Res> {
  factory _$JobListResponseCopyWith(_JobListResponse value, $Res Function(_JobListResponse) _then) = __$JobListResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, List<JobPostItem> jobPosts, String? companyName, String? companyLogo
});




}
/// @nodoc
class __$JobListResponseCopyWithImpl<$Res>
    implements _$JobListResponseCopyWith<$Res> {
  __$JobListResponseCopyWithImpl(this._self, this._then);

  final _JobListResponse _self;
  final $Res Function(_JobListResponse) _then;

/// Create a copy of JobListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? jobPosts = null,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_JobListResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,jobPosts: null == jobPosts ? _self._jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<JobPostItem>,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$JobPostItem {

@JsonKey(name: "_id") String get id; Timeline get timeline; String get title;@JsonKey(name: "sport_id") SportInfo get sportId; String get location; String get description; String get requirements; DateTime get createdAt; List<String> get mediaUrls; List<dynamic> get applicants; int get applicantCount; String get price;
/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPostItemCopyWith<JobPostItem> get copyWith => _$JobPostItemCopyWithImpl<JobPostItem>(this as JobPostItem, _$identity);

  /// Serializes this JobPostItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPostItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.title, title) || other.title == title)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.applicants, applicants)&&(identical(other.applicantCount, applicantCount) || other.applicantCount == applicantCount)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeline,title,sportId,location,description,requirements,createdAt,const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(applicants),applicantCount,price);

@override
String toString() {
  return 'JobPostItem(id: $id, timeline: $timeline, title: $title, sportId: $sportId, location: $location, description: $description, requirements: $requirements, createdAt: $createdAt, mediaUrls: $mediaUrls, applicants: $applicants, applicantCount: $applicantCount, price: $price)';
}


}

/// @nodoc
abstract mixin class $JobPostItemCopyWith<$Res>  {
  factory $JobPostItemCopyWith(JobPostItem value, $Res Function(JobPostItem) _then) = _$JobPostItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, Timeline timeline, String title,@JsonKey(name: "sport_id") SportInfo sportId, String location, String description, String requirements, DateTime createdAt, List<String> mediaUrls, List<dynamic> applicants, int applicantCount, String price
});


$TimelineCopyWith<$Res> get timeline;$SportInfoCopyWith<$Res> get sportId;

}
/// @nodoc
class _$JobPostItemCopyWithImpl<$Res>
    implements $JobPostItemCopyWith<$Res> {
  _$JobPostItemCopyWithImpl(this._self, this._then);

  final JobPostItem _self;
  final $Res Function(JobPostItem) _then;

/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timeline = null,Object? title = null,Object? sportId = null,Object? location = null,Object? description = null,Object? requirements = null,Object? createdAt = null,Object? mediaUrls = null,Object? applicants = null,Object? applicantCount = null,Object? price = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as Timeline,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as SportInfo,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,mediaUrls: null == mediaUrls ? _self.mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,applicants: null == applicants ? _self.applicants : applicants // ignore: cast_nullable_to_non_nullable
as List<dynamic>,applicantCount: null == applicantCount ? _self.applicantCount : applicantCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimelineCopyWith<$Res> get timeline {
  
  return $TimelineCopyWith<$Res>(_self.timeline, (value) {
    return _then(_self.copyWith(timeline: value));
  });
}/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportInfoCopyWith<$Res> get sportId {
  
  return $SportInfoCopyWith<$Res>(_self.sportId, (value) {
    return _then(_self.copyWith(sportId: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobPostItem].
extension JobPostItemPatterns on JobPostItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPostItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPostItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPostItem value)  $default,){
final _that = this;
switch (_that) {
case _JobPostItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPostItem value)?  $default,){
final _that = this;
switch (_that) {
case _JobPostItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  SportInfo sportId,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls,  List<dynamic> applicants,  int applicantCount,  String price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPostItem() when $default != null:
return $default(_that.id,_that.timeline,_that.title,_that.sportId,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applicants,_that.applicantCount,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  SportInfo sportId,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls,  List<dynamic> applicants,  int applicantCount,  String price)  $default,) {final _that = this;
switch (_that) {
case _JobPostItem():
return $default(_that.id,_that.timeline,_that.title,_that.sportId,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applicants,_that.applicantCount,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  SportInfo sportId,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls,  List<dynamic> applicants,  int applicantCount,  String price)?  $default,) {final _that = this;
switch (_that) {
case _JobPostItem() when $default != null:
return $default(_that.id,_that.timeline,_that.title,_that.sportId,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applicants,_that.applicantCount,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPostItem implements JobPostItem {
  const _JobPostItem({@JsonKey(name: "_id") required this.id, required this.timeline, required this.title, @JsonKey(name: "sport_id") required this.sportId, this.location = '', this.description = '', this.requirements = '', required this.createdAt, final  List<String> mediaUrls = const [], final  List<dynamic> applicants = const [], this.applicantCount = 0, this.price = ''}): _mediaUrls = mediaUrls,_applicants = applicants;
  factory _JobPostItem.fromJson(Map<String, dynamic> json) => _$JobPostItemFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  Timeline timeline;
@override final  String title;
@override@JsonKey(name: "sport_id") final  SportInfo sportId;
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

@override@JsonKey() final  int applicantCount;
@override@JsonKey() final  String price;

/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPostItemCopyWith<_JobPostItem> get copyWith => __$JobPostItemCopyWithImpl<_JobPostItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPostItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPostItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.title, title) || other.title == title)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._applicants, _applicants)&&(identical(other.applicantCount, applicantCount) || other.applicantCount == applicantCount)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeline,title,sportId,location,description,requirements,createdAt,const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_applicants),applicantCount,price);

@override
String toString() {
  return 'JobPostItem(id: $id, timeline: $timeline, title: $title, sportId: $sportId, location: $location, description: $description, requirements: $requirements, createdAt: $createdAt, mediaUrls: $mediaUrls, applicants: $applicants, applicantCount: $applicantCount, price: $price)';
}


}

/// @nodoc
abstract mixin class _$JobPostItemCopyWith<$Res> implements $JobPostItemCopyWith<$Res> {
  factory _$JobPostItemCopyWith(_JobPostItem value, $Res Function(_JobPostItem) _then) = __$JobPostItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, Timeline timeline, String title,@JsonKey(name: "sport_id") SportInfo sportId, String location, String description, String requirements, DateTime createdAt, List<String> mediaUrls, List<dynamic> applicants, int applicantCount, String price
});


@override $TimelineCopyWith<$Res> get timeline;@override $SportInfoCopyWith<$Res> get sportId;

}
/// @nodoc
class __$JobPostItemCopyWithImpl<$Res>
    implements _$JobPostItemCopyWith<$Res> {
  __$JobPostItemCopyWithImpl(this._self, this._then);

  final _JobPostItem _self;
  final $Res Function(_JobPostItem) _then;

/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timeline = null,Object? title = null,Object? sportId = null,Object? location = null,Object? description = null,Object? requirements = null,Object? createdAt = null,Object? mediaUrls = null,Object? applicants = null,Object? applicantCount = null,Object? price = null,}) {
  return _then(_JobPostItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as Timeline,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sportId: null == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as SportInfo,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,mediaUrls: null == mediaUrls ? _self._mediaUrls : mediaUrls // ignore: cast_nullable_to_non_nullable
as List<String>,applicants: null == applicants ? _self._applicants : applicants // ignore: cast_nullable_to_non_nullable
as List<dynamic>,applicantCount: null == applicantCount ? _self.applicantCount : applicantCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimelineCopyWith<$Res> get timeline {
  
  return $TimelineCopyWith<$Res>(_self.timeline, (value) {
    return _then(_self.copyWith(timeline: value));
  });
}/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportInfoCopyWith<$Res> get sportId {
  
  return $SportInfoCopyWith<$Res>(_self.sportId, (value) {
    return _then(_self.copyWith(sportId: value));
  });
}
}


/// @nodoc
mixin _$SportInfo {

@JsonKey(name: "_id") String get id; String get name; String? get icon;
/// Create a copy of SportInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportInfoCopyWith<SportInfo> get copyWith => _$SportInfoCopyWithImpl<SportInfo>(this as SportInfo, _$identity);

  /// Serializes this SportInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'SportInfo(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $SportInfoCopyWith<$Res>  {
  factory $SportInfoCopyWith(SportInfo value, $Res Function(SportInfo) _then) = _$SportInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? icon
});




}
/// @nodoc
class _$SportInfoCopyWithImpl<$Res>
    implements $SportInfoCopyWith<$Res> {
  _$SportInfoCopyWithImpl(this._self, this._then);

  final SportInfo _self;
  final $Res Function(SportInfo) _then;

/// Create a copy of SportInfo
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


/// Adds pattern-matching-related methods to [SportInfo].
extension SportInfoPatterns on SportInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportInfo value)  $default,){
final _that = this;
switch (_that) {
case _SportInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SportInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportInfo() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _SportInfo():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _SportInfo() when $default != null:
return $default(_that.id,_that.name,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportInfo implements SportInfo {
  const _SportInfo({@JsonKey(name: "_id") required this.id, required this.name, this.icon});
  factory _SportInfo.fromJson(Map<String, dynamic> json) => _$SportInfoFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;
@override final  String? icon;

/// Create a copy of SportInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportInfoCopyWith<_SportInfo> get copyWith => __$SportInfoCopyWithImpl<_SportInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon);

@override
String toString() {
  return 'SportInfo(id: $id, name: $name, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$SportInfoCopyWith<$Res> implements $SportInfoCopyWith<$Res> {
  factory _$SportInfoCopyWith(_SportInfo value, $Res Function(_SportInfo) _then) = __$SportInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? icon
});




}
/// @nodoc
class __$SportInfoCopyWithImpl<$Res>
    implements _$SportInfoCopyWith<$Res> {
  __$SportInfoCopyWithImpl(this._self, this._then);

  final _SportInfo _self;
  final $Res Function(_SportInfo) _then;

/// Create a copy of SportInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,}) {
  return _then(_SportInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

// dart format on
