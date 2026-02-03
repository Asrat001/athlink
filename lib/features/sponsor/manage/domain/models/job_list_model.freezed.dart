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
mixin _$JobApplication {

@JsonKey(name: "_id") String get id;@JsonKey(name: "athlete") Athlete get athlete;
/// Create a copy of JobApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicationCopyWith<JobApplication> get copyWith => _$JobApplicationCopyWithImpl<JobApplication>(this as JobApplication, _$identity);

  /// Serializes this JobApplication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplication&&(identical(other.id, id) || other.id == id)&&(identical(other.athlete, athlete) || other.athlete == athlete));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athlete);

@override
String toString() {
  return 'JobApplication(id: $id, athlete: $athlete)';
}


}

/// @nodoc
abstract mixin class $JobApplicationCopyWith<$Res>  {
  factory $JobApplicationCopyWith(JobApplication value, $Res Function(JobApplication) _then) = _$JobApplicationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "athlete") Athlete athlete
});


$AthleteCopyWith<$Res> get athlete;

}
/// @nodoc
class _$JobApplicationCopyWithImpl<$Res>
    implements $JobApplicationCopyWith<$Res> {
  _$JobApplicationCopyWithImpl(this._self, this._then);

  final JobApplication _self;
  final $Res Function(JobApplication) _then;

/// Create a copy of JobApplication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? athlete = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Athlete,
  ));
}
/// Create a copy of JobApplication
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteCopyWith<$Res> get athlete {
  
  return $AthleteCopyWith<$Res>(_self.athlete, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobApplication].
extension JobApplicationPatterns on JobApplication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplication value)  $default,){
final _that = this;
switch (_that) {
case _JobApplication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplication value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "athlete")  Athlete athlete)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplication() when $default != null:
return $default(_that.id,_that.athlete);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "athlete")  Athlete athlete)  $default,) {final _that = this;
switch (_that) {
case _JobApplication():
return $default(_that.id,_that.athlete);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id, @JsonKey(name: "athlete")  Athlete athlete)?  $default,) {final _that = this;
switch (_that) {
case _JobApplication() when $default != null:
return $default(_that.id,_that.athlete);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplication implements JobApplication {
  const _JobApplication({@JsonKey(name: "_id") required this.id, @JsonKey(name: "athlete") required this.athlete});
  factory _JobApplication.fromJson(Map<String, dynamic> json) => _$JobApplicationFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override@JsonKey(name: "athlete") final  Athlete athlete;

/// Create a copy of JobApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobApplicationCopyWith<_JobApplication> get copyWith => __$JobApplicationCopyWithImpl<_JobApplication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplication&&(identical(other.id, id) || other.id == id)&&(identical(other.athlete, athlete) || other.athlete == athlete));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,athlete);

@override
String toString() {
  return 'JobApplication(id: $id, athlete: $athlete)';
}


}

/// @nodoc
abstract mixin class _$JobApplicationCopyWith<$Res> implements $JobApplicationCopyWith<$Res> {
  factory _$JobApplicationCopyWith(_JobApplication value, $Res Function(_JobApplication) _then) = __$JobApplicationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id,@JsonKey(name: "athlete") Athlete athlete
});


@override $AthleteCopyWith<$Res> get athlete;

}
/// @nodoc
class __$JobApplicationCopyWithImpl<$Res>
    implements _$JobApplicationCopyWith<$Res> {
  __$JobApplicationCopyWithImpl(this._self, this._then);

  final _JobApplication _self;
  final $Res Function(_JobApplication) _then;

/// Create a copy of JobApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? athlete = null,}) {
  return _then(_JobApplication(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Athlete,
  ));
}

/// Create a copy of JobApplication
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteCopyWith<$Res> get athlete {
  
  return $AthleteCopyWith<$Res>(_self.athlete, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}
}


/// @nodoc
mixin _$JobsResponse {

 List<JobPostItem> get jobs; int get count;
/// Create a copy of JobsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobsResponseCopyWith<JobsResponse> get copyWith => _$JobsResponseCopyWithImpl<JobsResponse>(this as JobsResponse, _$identity);

  /// Serializes this JobsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobsResponse&&const DeepCollectionEquality().equals(other.jobs, jobs)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(jobs),count);

@override
String toString() {
  return 'JobsResponse(jobs: $jobs, count: $count)';
}


}

/// @nodoc
abstract mixin class $JobsResponseCopyWith<$Res>  {
  factory $JobsResponseCopyWith(JobsResponse value, $Res Function(JobsResponse) _then) = _$JobsResponseCopyWithImpl;
@useResult
$Res call({
 List<JobPostItem> jobs, int count
});




}
/// @nodoc
class _$JobsResponseCopyWithImpl<$Res>
    implements $JobsResponseCopyWith<$Res> {
  _$JobsResponseCopyWithImpl(this._self, this._then);

  final JobsResponse _self;
  final $Res Function(JobsResponse) _then;

/// Create a copy of JobsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobs = null,Object? count = null,}) {
  return _then(_self.copyWith(
jobs: null == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobPostItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [JobsResponse].
extension JobsResponsePatterns on JobsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobsResponse value)  $default,){
final _that = this;
switch (_that) {
case _JobsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _JobsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JobPostItem> jobs,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobsResponse() when $default != null:
return $default(_that.jobs,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JobPostItem> jobs,  int count)  $default,) {final _that = this;
switch (_that) {
case _JobsResponse():
return $default(_that.jobs,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JobPostItem> jobs,  int count)?  $default,) {final _that = this;
switch (_that) {
case _JobsResponse() when $default != null:
return $default(_that.jobs,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobsResponse implements JobsResponse {
  const _JobsResponse({final  List<JobPostItem> jobs = const [], this.count = 0}): _jobs = jobs;
  factory _JobsResponse.fromJson(Map<String, dynamic> json) => _$JobsResponseFromJson(json);

 final  List<JobPostItem> _jobs;
@override@JsonKey() List<JobPostItem> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}

@override@JsonKey() final  int count;

/// Create a copy of JobsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobsResponseCopyWith<_JobsResponse> get copyWith => __$JobsResponseCopyWithImpl<_JobsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobsResponse&&const DeepCollectionEquality().equals(other._jobs, _jobs)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_jobs),count);

@override
String toString() {
  return 'JobsResponse(jobs: $jobs, count: $count)';
}


}

/// @nodoc
abstract mixin class _$JobsResponseCopyWith<$Res> implements $JobsResponseCopyWith<$Res> {
  factory _$JobsResponseCopyWith(_JobsResponse value, $Res Function(_JobsResponse) _then) = __$JobsResponseCopyWithImpl;
@override @useResult
$Res call({
 List<JobPostItem> jobs, int count
});




}
/// @nodoc
class __$JobsResponseCopyWithImpl<$Res>
    implements _$JobsResponseCopyWith<$Res> {
  __$JobsResponseCopyWithImpl(this._self, this._then);

  final _JobsResponse _self;
  final $Res Function(_JobsResponse) _then;

/// Create a copy of JobsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobs = null,Object? count = null,}) {
  return _then(_JobsResponse(
jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobPostItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


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

@JsonKey(name: "_id") String get id; Timeline get timeline; String get title;@JsonKey(name: "sport_id") SportInfo get sportId; String get location; String get description; String get requirements; DateTime get createdAt; List<String> get mediaUrls;@JsonKey(name: "applicants") List<JobApplication> get applications; int get applicantCount;@JsonKey(fromJson: _priceToString) String get price; String get currency;
/// Create a copy of JobPostItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPostItemCopyWith<JobPostItem> get copyWith => _$JobPostItemCopyWithImpl<JobPostItem>(this as JobPostItem, _$identity);

  /// Serializes this JobPostItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPostItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.title, title) || other.title == title)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.mediaUrls, mediaUrls)&&const DeepCollectionEquality().equals(other.applications, applications)&&(identical(other.applicantCount, applicantCount) || other.applicantCount == applicantCount)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeline,title,sportId,location,description,requirements,createdAt,const DeepCollectionEquality().hash(mediaUrls),const DeepCollectionEquality().hash(applications),applicantCount,price,currency);

@override
String toString() {
  return 'JobPostItem(id: $id, timeline: $timeline, title: $title, sportId: $sportId, location: $location, description: $description, requirements: $requirements, createdAt: $createdAt, mediaUrls: $mediaUrls, applications: $applications, applicantCount: $applicantCount, price: $price, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $JobPostItemCopyWith<$Res>  {
  factory $JobPostItemCopyWith(JobPostItem value, $Res Function(JobPostItem) _then) = _$JobPostItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, Timeline timeline, String title,@JsonKey(name: "sport_id") SportInfo sportId, String location, String description, String requirements, DateTime createdAt, List<String> mediaUrls,@JsonKey(name: "applicants") List<JobApplication> applications, int applicantCount,@JsonKey(fromJson: _priceToString) String price, String currency
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timeline = null,Object? title = null,Object? sportId = null,Object? location = null,Object? description = null,Object? requirements = null,Object? createdAt = null,Object? mediaUrls = null,Object? applications = null,Object? applicantCount = null,Object? price = null,Object? currency = null,}) {
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
as List<String>,applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<JobApplication>,applicantCount: null == applicantCount ? _self.applicantCount : applicantCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  SportInfo sportId,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls, @JsonKey(name: "applicants")  List<JobApplication> applications,  int applicantCount, @JsonKey(fromJson: _priceToString)  String price,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPostItem() when $default != null:
return $default(_that.id,_that.timeline,_that.title,_that.sportId,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applications,_that.applicantCount,_that.price,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  SportInfo sportId,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls, @JsonKey(name: "applicants")  List<JobApplication> applications,  int applicantCount, @JsonKey(fromJson: _priceToString)  String price,  String currency)  $default,) {final _that = this;
switch (_that) {
case _JobPostItem():
return $default(_that.id,_that.timeline,_that.title,_that.sportId,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applications,_that.applicantCount,_that.price,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  Timeline timeline,  String title, @JsonKey(name: "sport_id")  SportInfo sportId,  String location,  String description,  String requirements,  DateTime createdAt,  List<String> mediaUrls, @JsonKey(name: "applicants")  List<JobApplication> applications,  int applicantCount, @JsonKey(fromJson: _priceToString)  String price,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _JobPostItem() when $default != null:
return $default(_that.id,_that.timeline,_that.title,_that.sportId,_that.location,_that.description,_that.requirements,_that.createdAt,_that.mediaUrls,_that.applications,_that.applicantCount,_that.price,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPostItem implements JobPostItem {
  const _JobPostItem({@JsonKey(name: "_id") required this.id, required this.timeline, required this.title, @JsonKey(name: "sport_id") required this.sportId, this.location = '', this.description = '', this.requirements = '', required this.createdAt, final  List<String> mediaUrls = const [], @JsonKey(name: "applicants") final  List<JobApplication> applications = const [], this.applicantCount = 0, @JsonKey(fromJson: _priceToString) this.price = '', this.currency = 'USD'}): _mediaUrls = mediaUrls,_applications = applications;
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

 final  List<JobApplication> _applications;
@override@JsonKey(name: "applicants") List<JobApplication> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

@override@JsonKey() final  int applicantCount;
@override@JsonKey(fromJson: _priceToString) final  String price;
@override@JsonKey() final  String currency;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPostItem&&(identical(other.id, id) || other.id == id)&&(identical(other.timeline, timeline) || other.timeline == timeline)&&(identical(other.title, title) || other.title == title)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._mediaUrls, _mediaUrls)&&const DeepCollectionEquality().equals(other._applications, _applications)&&(identical(other.applicantCount, applicantCount) || other.applicantCount == applicantCount)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timeline,title,sportId,location,description,requirements,createdAt,const DeepCollectionEquality().hash(_mediaUrls),const DeepCollectionEquality().hash(_applications),applicantCount,price,currency);

@override
String toString() {
  return 'JobPostItem(id: $id, timeline: $timeline, title: $title, sportId: $sportId, location: $location, description: $description, requirements: $requirements, createdAt: $createdAt, mediaUrls: $mediaUrls, applications: $applications, applicantCount: $applicantCount, price: $price, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$JobPostItemCopyWith<$Res> implements $JobPostItemCopyWith<$Res> {
  factory _$JobPostItemCopyWith(_JobPostItem value, $Res Function(_JobPostItem) _then) = __$JobPostItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, Timeline timeline, String title,@JsonKey(name: "sport_id") SportInfo sportId, String location, String description, String requirements, DateTime createdAt, List<String> mediaUrls,@JsonKey(name: "applicants") List<JobApplication> applications, int applicantCount,@JsonKey(fromJson: _priceToString) String price, String currency
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timeline = null,Object? title = null,Object? sportId = null,Object? location = null,Object? description = null,Object? requirements = null,Object? createdAt = null,Object? mediaUrls = null,Object? applications = null,Object? applicantCount = null,Object? price = null,Object? currency = null,}) {
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
as List<String>,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<JobApplication>,applicantCount: null == applicantCount ? _self.applicantCount : applicantCount // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$AcceptApplicantData {

 String get athleteId; String get jobId; String get applicationId; String get sponsorshipSource; String get status;
/// Create a copy of AcceptApplicantData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptApplicantDataCopyWith<AcceptApplicantData> get copyWith => _$AcceptApplicantDataCopyWithImpl<AcceptApplicantData>(this as AcceptApplicantData, _$identity);

  /// Serializes this AcceptApplicantData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptApplicantData&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.sponsorshipSource, sponsorshipSource) || other.sponsorshipSource == sponsorshipSource)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athleteId,jobId,applicationId,sponsorshipSource,status);

@override
String toString() {
  return 'AcceptApplicantData(athleteId: $athleteId, jobId: $jobId, applicationId: $applicationId, sponsorshipSource: $sponsorshipSource, status: $status)';
}


}

/// @nodoc
abstract mixin class $AcceptApplicantDataCopyWith<$Res>  {
  factory $AcceptApplicantDataCopyWith(AcceptApplicantData value, $Res Function(AcceptApplicantData) _then) = _$AcceptApplicantDataCopyWithImpl;
@useResult
$Res call({
 String athleteId, String jobId, String applicationId, String sponsorshipSource, String status
});




}
/// @nodoc
class _$AcceptApplicantDataCopyWithImpl<$Res>
    implements $AcceptApplicantDataCopyWith<$Res> {
  _$AcceptApplicantDataCopyWithImpl(this._self, this._then);

  final AcceptApplicantData _self;
  final $Res Function(AcceptApplicantData) _then;

/// Create a copy of AcceptApplicantData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athleteId = null,Object? jobId = null,Object? applicationId = null,Object? sponsorshipSource = null,Object? status = null,}) {
  return _then(_self.copyWith(
athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,sponsorshipSource: null == sponsorshipSource ? _self.sponsorshipSource : sponsorshipSource // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AcceptApplicantData].
extension AcceptApplicantDataPatterns on AcceptApplicantData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcceptApplicantData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcceptApplicantData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcceptApplicantData value)  $default,){
final _that = this;
switch (_that) {
case _AcceptApplicantData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcceptApplicantData value)?  $default,){
final _that = this;
switch (_that) {
case _AcceptApplicantData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String athleteId,  String jobId,  String applicationId,  String sponsorshipSource,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcceptApplicantData() when $default != null:
return $default(_that.athleteId,_that.jobId,_that.applicationId,_that.sponsorshipSource,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String athleteId,  String jobId,  String applicationId,  String sponsorshipSource,  String status)  $default,) {final _that = this;
switch (_that) {
case _AcceptApplicantData():
return $default(_that.athleteId,_that.jobId,_that.applicationId,_that.sponsorshipSource,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String athleteId,  String jobId,  String applicationId,  String sponsorshipSource,  String status)?  $default,) {final _that = this;
switch (_that) {
case _AcceptApplicantData() when $default != null:
return $default(_that.athleteId,_that.jobId,_that.applicationId,_that.sponsorshipSource,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AcceptApplicantData implements AcceptApplicantData {
  const _AcceptApplicantData({required this.athleteId, required this.jobId, required this.applicationId, required this.sponsorshipSource, required this.status});
  factory _AcceptApplicantData.fromJson(Map<String, dynamic> json) => _$AcceptApplicantDataFromJson(json);

@override final  String athleteId;
@override final  String jobId;
@override final  String applicationId;
@override final  String sponsorshipSource;
@override final  String status;

/// Create a copy of AcceptApplicantData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptApplicantDataCopyWith<_AcceptApplicantData> get copyWith => __$AcceptApplicantDataCopyWithImpl<_AcceptApplicantData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcceptApplicantDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptApplicantData&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.sponsorshipSource, sponsorshipSource) || other.sponsorshipSource == sponsorshipSource)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athleteId,jobId,applicationId,sponsorshipSource,status);

@override
String toString() {
  return 'AcceptApplicantData(athleteId: $athleteId, jobId: $jobId, applicationId: $applicationId, sponsorshipSource: $sponsorshipSource, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AcceptApplicantDataCopyWith<$Res> implements $AcceptApplicantDataCopyWith<$Res> {
  factory _$AcceptApplicantDataCopyWith(_AcceptApplicantData value, $Res Function(_AcceptApplicantData) _then) = __$AcceptApplicantDataCopyWithImpl;
@override @useResult
$Res call({
 String athleteId, String jobId, String applicationId, String sponsorshipSource, String status
});




}
/// @nodoc
class __$AcceptApplicantDataCopyWithImpl<$Res>
    implements _$AcceptApplicantDataCopyWith<$Res> {
  __$AcceptApplicantDataCopyWithImpl(this._self, this._then);

  final _AcceptApplicantData _self;
  final $Res Function(_AcceptApplicantData) _then;

/// Create a copy of AcceptApplicantData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athleteId = null,Object? jobId = null,Object? applicationId = null,Object? sponsorshipSource = null,Object? status = null,}) {
  return _then(_AcceptApplicantData(
athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,sponsorshipSource: null == sponsorshipSource ? _self.sponsorshipSource : sponsorshipSource // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AcceptApplicantResponse {

 bool get success; String get message; AcceptApplicantData get data;
/// Create a copy of AcceptApplicantResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AcceptApplicantResponseCopyWith<AcceptApplicantResponse> get copyWith => _$AcceptApplicantResponseCopyWithImpl<AcceptApplicantResponse>(this as AcceptApplicantResponse, _$identity);

  /// Serializes this AcceptApplicantResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AcceptApplicantResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'AcceptApplicantResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AcceptApplicantResponseCopyWith<$Res>  {
  factory $AcceptApplicantResponseCopyWith(AcceptApplicantResponse value, $Res Function(AcceptApplicantResponse) _then) = _$AcceptApplicantResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, AcceptApplicantData data
});


$AcceptApplicantDataCopyWith<$Res> get data;

}
/// @nodoc
class _$AcceptApplicantResponseCopyWithImpl<$Res>
    implements $AcceptApplicantResponseCopyWith<$Res> {
  _$AcceptApplicantResponseCopyWithImpl(this._self, this._then);

  final AcceptApplicantResponse _self;
  final $Res Function(AcceptApplicantResponse) _then;

/// Create a copy of AcceptApplicantResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AcceptApplicantData,
  ));
}
/// Create a copy of AcceptApplicantResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AcceptApplicantDataCopyWith<$Res> get data {
  
  return $AcceptApplicantDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AcceptApplicantResponse].
extension AcceptApplicantResponsePatterns on AcceptApplicantResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AcceptApplicantResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AcceptApplicantResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AcceptApplicantResponse value)  $default,){
final _that = this;
switch (_that) {
case _AcceptApplicantResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AcceptApplicantResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AcceptApplicantResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  AcceptApplicantData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AcceptApplicantResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  AcceptApplicantData data)  $default,) {final _that = this;
switch (_that) {
case _AcceptApplicantResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  AcceptApplicantData data)?  $default,) {final _that = this;
switch (_that) {
case _AcceptApplicantResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AcceptApplicantResponse implements AcceptApplicantResponse {
  const _AcceptApplicantResponse({required this.success, required this.message, required this.data});
  factory _AcceptApplicantResponse.fromJson(Map<String, dynamic> json) => _$AcceptApplicantResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  AcceptApplicantData data;

/// Create a copy of AcceptApplicantResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptApplicantResponseCopyWith<_AcceptApplicantResponse> get copyWith => __$AcceptApplicantResponseCopyWithImpl<_AcceptApplicantResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AcceptApplicantResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AcceptApplicantResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'AcceptApplicantResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AcceptApplicantResponseCopyWith<$Res> implements $AcceptApplicantResponseCopyWith<$Res> {
  factory _$AcceptApplicantResponseCopyWith(_AcceptApplicantResponse value, $Res Function(_AcceptApplicantResponse) _then) = __$AcceptApplicantResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, AcceptApplicantData data
});


@override $AcceptApplicantDataCopyWith<$Res> get data;

}
/// @nodoc
class __$AcceptApplicantResponseCopyWithImpl<$Res>
    implements _$AcceptApplicantResponseCopyWith<$Res> {
  __$AcceptApplicantResponseCopyWithImpl(this._self, this._then);

  final _AcceptApplicantResponse _self;
  final $Res Function(_AcceptApplicantResponse) _then;

/// Create a copy of AcceptApplicantResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_AcceptApplicantResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AcceptApplicantData,
  ));
}

/// Create a copy of AcceptApplicantResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AcceptApplicantDataCopyWith<$Res> get data {
  
  return $AcceptApplicantDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SponsoredAthleteJobPost {

@JsonKey(name: "_id") String get id; String get title;
/// Create a copy of SponsoredAthleteJobPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsoredAthleteJobPostCopyWith<SponsoredAthleteJobPost> get copyWith => _$SponsoredAthleteJobPostCopyWithImpl<SponsoredAthleteJobPost>(this as SponsoredAthleteJobPost, _$identity);

  /// Serializes this SponsoredAthleteJobPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsoredAthleteJobPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'SponsoredAthleteJobPost(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $SponsoredAthleteJobPostCopyWith<$Res>  {
  factory $SponsoredAthleteJobPostCopyWith(SponsoredAthleteJobPost value, $Res Function(SponsoredAthleteJobPost) _then) = _$SponsoredAthleteJobPostCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String title
});




}
/// @nodoc
class _$SponsoredAthleteJobPostCopyWithImpl<$Res>
    implements $SponsoredAthleteJobPostCopyWith<$Res> {
  _$SponsoredAthleteJobPostCopyWithImpl(this._self, this._then);

  final SponsoredAthleteJobPost _self;
  final $Res Function(SponsoredAthleteJobPost) _then;

/// Create a copy of SponsoredAthleteJobPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsoredAthleteJobPost].
extension SponsoredAthleteJobPostPatterns on SponsoredAthleteJobPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsoredAthleteJobPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsoredAthleteJobPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsoredAthleteJobPost value)  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthleteJobPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsoredAthleteJobPost value)?  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthleteJobPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsoredAthleteJobPost() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String title)  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthleteJobPost():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String title)?  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthleteJobPost() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsoredAthleteJobPost implements SponsoredAthleteJobPost {
  const _SponsoredAthleteJobPost({@JsonKey(name: "_id") required this.id, required this.title});
  factory _SponsoredAthleteJobPost.fromJson(Map<String, dynamic> json) => _$SponsoredAthleteJobPostFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String title;

/// Create a copy of SponsoredAthleteJobPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsoredAthleteJobPostCopyWith<_SponsoredAthleteJobPost> get copyWith => __$SponsoredAthleteJobPostCopyWithImpl<_SponsoredAthleteJobPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsoredAthleteJobPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsoredAthleteJobPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'SponsoredAthleteJobPost(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$SponsoredAthleteJobPostCopyWith<$Res> implements $SponsoredAthleteJobPostCopyWith<$Res> {
  factory _$SponsoredAthleteJobPostCopyWith(_SponsoredAthleteJobPost value, $Res Function(_SponsoredAthleteJobPost) _then) = __$SponsoredAthleteJobPostCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String title
});




}
/// @nodoc
class __$SponsoredAthleteJobPostCopyWithImpl<$Res>
    implements _$SponsoredAthleteJobPostCopyWith<$Res> {
  __$SponsoredAthleteJobPostCopyWithImpl(this._self, this._then);

  final _SponsoredAthleteJobPost _self;
  final $Res Function(_SponsoredAthleteJobPost) _then;

/// Create a copy of SponsoredAthleteJobPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_SponsoredAthleteJobPost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SponsoredAthleteItem {

 Athlete get athlete; SponsoredAthleteJobPost get jobPost; String get applicationId; DateTime get acceptedAt;
/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsoredAthleteItemCopyWith<SponsoredAthleteItem> get copyWith => _$SponsoredAthleteItemCopyWithImpl<SponsoredAthleteItem>(this as SponsoredAthleteItem, _$identity);

  /// Serializes this SponsoredAthleteItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsoredAthleteItem&&(identical(other.athlete, athlete) || other.athlete == athlete)&&(identical(other.jobPost, jobPost) || other.jobPost == jobPost)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athlete,jobPost,applicationId,acceptedAt);

@override
String toString() {
  return 'SponsoredAthleteItem(athlete: $athlete, jobPost: $jobPost, applicationId: $applicationId, acceptedAt: $acceptedAt)';
}


}

/// @nodoc
abstract mixin class $SponsoredAthleteItemCopyWith<$Res>  {
  factory $SponsoredAthleteItemCopyWith(SponsoredAthleteItem value, $Res Function(SponsoredAthleteItem) _then) = _$SponsoredAthleteItemCopyWithImpl;
@useResult
$Res call({
 Athlete athlete, SponsoredAthleteJobPost jobPost, String applicationId, DateTime acceptedAt
});


$AthleteCopyWith<$Res> get athlete;$SponsoredAthleteJobPostCopyWith<$Res> get jobPost;

}
/// @nodoc
class _$SponsoredAthleteItemCopyWithImpl<$Res>
    implements $SponsoredAthleteItemCopyWith<$Res> {
  _$SponsoredAthleteItemCopyWithImpl(this._self, this._then);

  final SponsoredAthleteItem _self;
  final $Res Function(SponsoredAthleteItem) _then;

/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athlete = null,Object? jobPost = null,Object? applicationId = null,Object? acceptedAt = null,}) {
  return _then(_self.copyWith(
athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Athlete,jobPost: null == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as SponsoredAthleteJobPost,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,acceptedAt: null == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteCopyWith<$Res> get athlete {
  
  return $AthleteCopyWith<$Res>(_self.athlete, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsoredAthleteJobPostCopyWith<$Res> get jobPost {
  
  return $SponsoredAthleteJobPostCopyWith<$Res>(_self.jobPost, (value) {
    return _then(_self.copyWith(jobPost: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsoredAthleteItem].
extension SponsoredAthleteItemPatterns on SponsoredAthleteItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsoredAthleteItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsoredAthleteItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsoredAthleteItem value)  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthleteItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsoredAthleteItem value)?  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthleteItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Athlete athlete,  SponsoredAthleteJobPost jobPost,  String applicationId,  DateTime acceptedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsoredAthleteItem() when $default != null:
return $default(_that.athlete,_that.jobPost,_that.applicationId,_that.acceptedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Athlete athlete,  SponsoredAthleteJobPost jobPost,  String applicationId,  DateTime acceptedAt)  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthleteItem():
return $default(_that.athlete,_that.jobPost,_that.applicationId,_that.acceptedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Athlete athlete,  SponsoredAthleteJobPost jobPost,  String applicationId,  DateTime acceptedAt)?  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthleteItem() when $default != null:
return $default(_that.athlete,_that.jobPost,_that.applicationId,_that.acceptedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsoredAthleteItem implements SponsoredAthleteItem {
  const _SponsoredAthleteItem({required this.athlete, required this.jobPost, required this.applicationId, required this.acceptedAt});
  factory _SponsoredAthleteItem.fromJson(Map<String, dynamic> json) => _$SponsoredAthleteItemFromJson(json);

@override final  Athlete athlete;
@override final  SponsoredAthleteJobPost jobPost;
@override final  String applicationId;
@override final  DateTime acceptedAt;

/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsoredAthleteItemCopyWith<_SponsoredAthleteItem> get copyWith => __$SponsoredAthleteItemCopyWithImpl<_SponsoredAthleteItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsoredAthleteItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsoredAthleteItem&&(identical(other.athlete, athlete) || other.athlete == athlete)&&(identical(other.jobPost, jobPost) || other.jobPost == jobPost)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.acceptedAt, acceptedAt) || other.acceptedAt == acceptedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athlete,jobPost,applicationId,acceptedAt);

@override
String toString() {
  return 'SponsoredAthleteItem(athlete: $athlete, jobPost: $jobPost, applicationId: $applicationId, acceptedAt: $acceptedAt)';
}


}

/// @nodoc
abstract mixin class _$SponsoredAthleteItemCopyWith<$Res> implements $SponsoredAthleteItemCopyWith<$Res> {
  factory _$SponsoredAthleteItemCopyWith(_SponsoredAthleteItem value, $Res Function(_SponsoredAthleteItem) _then) = __$SponsoredAthleteItemCopyWithImpl;
@override @useResult
$Res call({
 Athlete athlete, SponsoredAthleteJobPost jobPost, String applicationId, DateTime acceptedAt
});


@override $AthleteCopyWith<$Res> get athlete;@override $SponsoredAthleteJobPostCopyWith<$Res> get jobPost;

}
/// @nodoc
class __$SponsoredAthleteItemCopyWithImpl<$Res>
    implements _$SponsoredAthleteItemCopyWith<$Res> {
  __$SponsoredAthleteItemCopyWithImpl(this._self, this._then);

  final _SponsoredAthleteItem _self;
  final $Res Function(_SponsoredAthleteItem) _then;

/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athlete = null,Object? jobPost = null,Object? applicationId = null,Object? acceptedAt = null,}) {
  return _then(_SponsoredAthleteItem(
athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Athlete,jobPost: null == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as SponsoredAthleteJobPost,applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,acceptedAt: null == acceptedAt ? _self.acceptedAt : acceptedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteCopyWith<$Res> get athlete {
  
  return $AthleteCopyWith<$Res>(_self.athlete, (value) {
    return _then(_self.copyWith(athlete: value));
  });
}/// Create a copy of SponsoredAthleteItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsoredAthleteJobPostCopyWith<$Res> get jobPost {
  
  return $SponsoredAthleteJobPostCopyWith<$Res>(_self.jobPost, (value) {
    return _then(_self.copyWith(jobPost: value));
  });
}
}


/// @nodoc
mixin _$SponsoredAthletesData {

 List<SponsoredAthleteItem> get athletes; int get count;
/// Create a copy of SponsoredAthletesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsoredAthletesDataCopyWith<SponsoredAthletesData> get copyWith => _$SponsoredAthletesDataCopyWithImpl<SponsoredAthletesData>(this as SponsoredAthletesData, _$identity);

  /// Serializes this SponsoredAthletesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsoredAthletesData&&const DeepCollectionEquality().equals(other.athletes, athletes)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(athletes),count);

@override
String toString() {
  return 'SponsoredAthletesData(athletes: $athletes, count: $count)';
}


}

/// @nodoc
abstract mixin class $SponsoredAthletesDataCopyWith<$Res>  {
  factory $SponsoredAthletesDataCopyWith(SponsoredAthletesData value, $Res Function(SponsoredAthletesData) _then) = _$SponsoredAthletesDataCopyWithImpl;
@useResult
$Res call({
 List<SponsoredAthleteItem> athletes, int count
});




}
/// @nodoc
class _$SponsoredAthletesDataCopyWithImpl<$Res>
    implements $SponsoredAthletesDataCopyWith<$Res> {
  _$SponsoredAthletesDataCopyWithImpl(this._self, this._then);

  final SponsoredAthletesData _self;
  final $Res Function(SponsoredAthletesData) _then;

/// Create a copy of SponsoredAthletesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athletes = null,Object? count = null,}) {
  return _then(_self.copyWith(
athletes: null == athletes ? _self.athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<SponsoredAthleteItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsoredAthletesData].
extension SponsoredAthletesDataPatterns on SponsoredAthletesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsoredAthletesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsoredAthletesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsoredAthletesData value)  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthletesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsoredAthletesData value)?  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthletesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SponsoredAthleteItem> athletes,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsoredAthletesData() when $default != null:
return $default(_that.athletes,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SponsoredAthleteItem> athletes,  int count)  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthletesData():
return $default(_that.athletes,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SponsoredAthleteItem> athletes,  int count)?  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthletesData() when $default != null:
return $default(_that.athletes,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsoredAthletesData implements SponsoredAthletesData {
  const _SponsoredAthletesData({required final  List<SponsoredAthleteItem> athletes, required this.count}): _athletes = athletes;
  factory _SponsoredAthletesData.fromJson(Map<String, dynamic> json) => _$SponsoredAthletesDataFromJson(json);

 final  List<SponsoredAthleteItem> _athletes;
@override List<SponsoredAthleteItem> get athletes {
  if (_athletes is EqualUnmodifiableListView) return _athletes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athletes);
}

@override final  int count;

/// Create a copy of SponsoredAthletesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsoredAthletesDataCopyWith<_SponsoredAthletesData> get copyWith => __$SponsoredAthletesDataCopyWithImpl<_SponsoredAthletesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsoredAthletesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsoredAthletesData&&const DeepCollectionEquality().equals(other._athletes, _athletes)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_athletes),count);

@override
String toString() {
  return 'SponsoredAthletesData(athletes: $athletes, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SponsoredAthletesDataCopyWith<$Res> implements $SponsoredAthletesDataCopyWith<$Res> {
  factory _$SponsoredAthletesDataCopyWith(_SponsoredAthletesData value, $Res Function(_SponsoredAthletesData) _then) = __$SponsoredAthletesDataCopyWithImpl;
@override @useResult
$Res call({
 List<SponsoredAthleteItem> athletes, int count
});




}
/// @nodoc
class __$SponsoredAthletesDataCopyWithImpl<$Res>
    implements _$SponsoredAthletesDataCopyWith<$Res> {
  __$SponsoredAthletesDataCopyWithImpl(this._self, this._then);

  final _SponsoredAthletesData _self;
  final $Res Function(_SponsoredAthletesData) _then;

/// Create a copy of SponsoredAthletesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athletes = null,Object? count = null,}) {
  return _then(_SponsoredAthletesData(
athletes: null == athletes ? _self._athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<SponsoredAthleteItem>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SponsoredAthletesResponse {

 bool get success; String get message; SponsoredAthletesData get data;
/// Create a copy of SponsoredAthletesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsoredAthletesResponseCopyWith<SponsoredAthletesResponse> get copyWith => _$SponsoredAthletesResponseCopyWithImpl<SponsoredAthletesResponse>(this as SponsoredAthletesResponse, _$identity);

  /// Serializes this SponsoredAthletesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsoredAthletesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SponsoredAthletesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SponsoredAthletesResponseCopyWith<$Res>  {
  factory $SponsoredAthletesResponseCopyWith(SponsoredAthletesResponse value, $Res Function(SponsoredAthletesResponse) _then) = _$SponsoredAthletesResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, SponsoredAthletesData data
});


$SponsoredAthletesDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SponsoredAthletesResponseCopyWithImpl<$Res>
    implements $SponsoredAthletesResponseCopyWith<$Res> {
  _$SponsoredAthletesResponseCopyWithImpl(this._self, this._then);

  final SponsoredAthletesResponse _self;
  final $Res Function(SponsoredAthletesResponse) _then;

/// Create a copy of SponsoredAthletesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SponsoredAthletesData,
  ));
}
/// Create a copy of SponsoredAthletesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsoredAthletesDataCopyWith<$Res> get data {
  
  return $SponsoredAthletesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsoredAthletesResponse].
extension SponsoredAthletesResponsePatterns on SponsoredAthletesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsoredAthletesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsoredAthletesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsoredAthletesResponse value)  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthletesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsoredAthletesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SponsoredAthletesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  SponsoredAthletesData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsoredAthletesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  SponsoredAthletesData data)  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthletesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  SponsoredAthletesData data)?  $default,) {final _that = this;
switch (_that) {
case _SponsoredAthletesResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsoredAthletesResponse implements SponsoredAthletesResponse {
  const _SponsoredAthletesResponse({required this.success, required this.message, required this.data});
  factory _SponsoredAthletesResponse.fromJson(Map<String, dynamic> json) => _$SponsoredAthletesResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  SponsoredAthletesData data;

/// Create a copy of SponsoredAthletesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsoredAthletesResponseCopyWith<_SponsoredAthletesResponse> get copyWith => __$SponsoredAthletesResponseCopyWithImpl<_SponsoredAthletesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsoredAthletesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsoredAthletesResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SponsoredAthletesResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SponsoredAthletesResponseCopyWith<$Res> implements $SponsoredAthletesResponseCopyWith<$Res> {
  factory _$SponsoredAthletesResponseCopyWith(_SponsoredAthletesResponse value, $Res Function(_SponsoredAthletesResponse) _then) = __$SponsoredAthletesResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, SponsoredAthletesData data
});


@override $SponsoredAthletesDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SponsoredAthletesResponseCopyWithImpl<$Res>
    implements _$SponsoredAthletesResponseCopyWith<$Res> {
  __$SponsoredAthletesResponseCopyWithImpl(this._self, this._then);

  final _SponsoredAthletesResponse _self;
  final $Res Function(_SponsoredAthletesResponse) _then;

/// Create a copy of SponsoredAthletesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_SponsoredAthletesResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SponsoredAthletesData,
  ));
}

/// Create a copy of SponsoredAthletesResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsoredAthletesDataCopyWith<$Res> get data {
  
  return $SponsoredAthletesDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SendInvitationRequest {

 String get athleteId; String get jobId; String get message;
/// Create a copy of SendInvitationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendInvitationRequestCopyWith<SendInvitationRequest> get copyWith => _$SendInvitationRequestCopyWithImpl<SendInvitationRequest>(this as SendInvitationRequest, _$identity);

  /// Serializes this SendInvitationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendInvitationRequest&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athleteId,jobId,message);

@override
String toString() {
  return 'SendInvitationRequest(athleteId: $athleteId, jobId: $jobId, message: $message)';
}


}

/// @nodoc
abstract mixin class $SendInvitationRequestCopyWith<$Res>  {
  factory $SendInvitationRequestCopyWith(SendInvitationRequest value, $Res Function(SendInvitationRequest) _then) = _$SendInvitationRequestCopyWithImpl;
@useResult
$Res call({
 String athleteId, String jobId, String message
});




}
/// @nodoc
class _$SendInvitationRequestCopyWithImpl<$Res>
    implements $SendInvitationRequestCopyWith<$Res> {
  _$SendInvitationRequestCopyWithImpl(this._self, this._then);

  final SendInvitationRequest _self;
  final $Res Function(SendInvitationRequest) _then;

/// Create a copy of SendInvitationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athleteId = null,Object? jobId = null,Object? message = null,}) {
  return _then(_self.copyWith(
athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendInvitationRequest].
extension SendInvitationRequestPatterns on SendInvitationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendInvitationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendInvitationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendInvitationRequest value)  $default,){
final _that = this;
switch (_that) {
case _SendInvitationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendInvitationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SendInvitationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String athleteId,  String jobId,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendInvitationRequest() when $default != null:
return $default(_that.athleteId,_that.jobId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String athleteId,  String jobId,  String message)  $default,) {final _that = this;
switch (_that) {
case _SendInvitationRequest():
return $default(_that.athleteId,_that.jobId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String athleteId,  String jobId,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SendInvitationRequest() when $default != null:
return $default(_that.athleteId,_that.jobId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendInvitationRequest implements SendInvitationRequest {
  const _SendInvitationRequest({required this.athleteId, required this.jobId, required this.message});
  factory _SendInvitationRequest.fromJson(Map<String, dynamic> json) => _$SendInvitationRequestFromJson(json);

@override final  String athleteId;
@override final  String jobId;
@override final  String message;

/// Create a copy of SendInvitationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendInvitationRequestCopyWith<_SendInvitationRequest> get copyWith => __$SendInvitationRequestCopyWithImpl<_SendInvitationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendInvitationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendInvitationRequest&&(identical(other.athleteId, athleteId) || other.athleteId == athleteId)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,athleteId,jobId,message);

@override
String toString() {
  return 'SendInvitationRequest(athleteId: $athleteId, jobId: $jobId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SendInvitationRequestCopyWith<$Res> implements $SendInvitationRequestCopyWith<$Res> {
  factory _$SendInvitationRequestCopyWith(_SendInvitationRequest value, $Res Function(_SendInvitationRequest) _then) = __$SendInvitationRequestCopyWithImpl;
@override @useResult
$Res call({
 String athleteId, String jobId, String message
});




}
/// @nodoc
class __$SendInvitationRequestCopyWithImpl<$Res>
    implements _$SendInvitationRequestCopyWith<$Res> {
  __$SendInvitationRequestCopyWithImpl(this._self, this._then);

  final _SendInvitationRequest _self;
  final $Res Function(_SendInvitationRequest) _then;

/// Create a copy of SendInvitationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athleteId = null,Object? jobId = null,Object? message = null,}) {
  return _then(_SendInvitationRequest(
athleteId: null == athleteId ? _self.athleteId : athleteId // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$InvitationData {

@JsonKey(name: "_id") String get id; dynamic get sponsor;// Can be String or Map
 Map<String, dynamic> get athlete; dynamic get jobPost;// Can be either String (ID) or Map (object)
 String get message; String get status; DateTime get sentAt; DateTime? get createdAt; DateTime? get updatedAt;@JsonKey(name: "__v") int? get version;
/// Create a copy of InvitationData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationDataCopyWith<InvitationData> get copyWith => _$InvitationDataCopyWithImpl<InvitationData>(this as InvitationData, _$identity);

  /// Serializes this InvitationData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationData&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.sponsor, sponsor)&&const DeepCollectionEquality().equals(other.athlete, athlete)&&const DeepCollectionEquality().equals(other.jobPost, jobPost)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(sponsor),const DeepCollectionEquality().hash(athlete),const DeepCollectionEquality().hash(jobPost),message,status,sentAt,createdAt,updatedAt,version);

@override
String toString() {
  return 'InvitationData(id: $id, sponsor: $sponsor, athlete: $athlete, jobPost: $jobPost, message: $message, status: $status, sentAt: $sentAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class $InvitationDataCopyWith<$Res>  {
  factory $InvitationDataCopyWith(InvitationData value, $Res Function(InvitationData) _then) = _$InvitationDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, dynamic sponsor, Map<String, dynamic> athlete, dynamic jobPost, String message, String status, DateTime sentAt, DateTime? createdAt, DateTime? updatedAt,@JsonKey(name: "__v") int? version
});




}
/// @nodoc
class _$InvitationDataCopyWithImpl<$Res>
    implements $InvitationDataCopyWith<$Res> {
  _$InvitationDataCopyWithImpl(this._self, this._then);

  final InvitationData _self;
  final $Res Function(InvitationData) _then;

/// Create a copy of InvitationData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sponsor = freezed,Object? athlete = null,Object? jobPost = freezed,Object? message = null,Object? status = null,Object? sentAt = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? version = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as dynamic,athlete: null == athlete ? _self.athlete : athlete // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,jobPost: freezed == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as dynamic,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [InvitationData].
extension InvitationDataPatterns on InvitationData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationData value)  $default,){
final _that = this;
switch (_that) {
case _InvitationData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationData value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  dynamic sponsor,  Map<String, dynamic> athlete,  dynamic jobPost,  String message,  String status,  DateTime sentAt,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(name: "__v")  int? version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationData() when $default != null:
return $default(_that.id,_that.sponsor,_that.athlete,_that.jobPost,_that.message,_that.status,_that.sentAt,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  dynamic sponsor,  Map<String, dynamic> athlete,  dynamic jobPost,  String message,  String status,  DateTime sentAt,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(name: "__v")  int? version)  $default,) {final _that = this;
switch (_that) {
case _InvitationData():
return $default(_that.id,_that.sponsor,_that.athlete,_that.jobPost,_that.message,_that.status,_that.sentAt,_that.createdAt,_that.updatedAt,_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  dynamic sponsor,  Map<String, dynamic> athlete,  dynamic jobPost,  String message,  String status,  DateTime sentAt,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(name: "__v")  int? version)?  $default,) {final _that = this;
switch (_that) {
case _InvitationData() when $default != null:
return $default(_that.id,_that.sponsor,_that.athlete,_that.jobPost,_that.message,_that.status,_that.sentAt,_that.createdAt,_that.updatedAt,_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvitationData implements InvitationData {
  const _InvitationData({@JsonKey(name: "_id") required this.id, required this.sponsor, required final  Map<String, dynamic> athlete, required this.jobPost, required this.message, required this.status, required this.sentAt, this.createdAt, this.updatedAt, @JsonKey(name: "__v") this.version}): _athlete = athlete;
  factory _InvitationData.fromJson(Map<String, dynamic> json) => _$InvitationDataFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  dynamic sponsor;
// Can be String or Map
 final  Map<String, dynamic> _athlete;
// Can be String or Map
@override Map<String, dynamic> get athlete {
  if (_athlete is EqualUnmodifiableMapView) return _athlete;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_athlete);
}

@override final  dynamic jobPost;
// Can be either String (ID) or Map (object)
@override final  String message;
@override final  String status;
@override final  DateTime sentAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey(name: "__v") final  int? version;

/// Create a copy of InvitationData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationDataCopyWith<_InvitationData> get copyWith => __$InvitationDataCopyWithImpl<_InvitationData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvitationDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationData&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.sponsor, sponsor)&&const DeepCollectionEquality().equals(other._athlete, _athlete)&&const DeepCollectionEquality().equals(other.jobPost, jobPost)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(sponsor),const DeepCollectionEquality().hash(_athlete),const DeepCollectionEquality().hash(jobPost),message,status,sentAt,createdAt,updatedAt,version);

@override
String toString() {
  return 'InvitationData(id: $id, sponsor: $sponsor, athlete: $athlete, jobPost: $jobPost, message: $message, status: $status, sentAt: $sentAt, createdAt: $createdAt, updatedAt: $updatedAt, version: $version)';
}


}

/// @nodoc
abstract mixin class _$InvitationDataCopyWith<$Res> implements $InvitationDataCopyWith<$Res> {
  factory _$InvitationDataCopyWith(_InvitationData value, $Res Function(_InvitationData) _then) = __$InvitationDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, dynamic sponsor, Map<String, dynamic> athlete, dynamic jobPost, String message, String status, DateTime sentAt, DateTime? createdAt, DateTime? updatedAt,@JsonKey(name: "__v") int? version
});




}
/// @nodoc
class __$InvitationDataCopyWithImpl<$Res>
    implements _$InvitationDataCopyWith<$Res> {
  __$InvitationDataCopyWithImpl(this._self, this._then);

  final _InvitationData _self;
  final $Res Function(_InvitationData) _then;

/// Create a copy of InvitationData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sponsor = freezed,Object? athlete = null,Object? jobPost = freezed,Object? message = null,Object? status = null,Object? sentAt = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? version = freezed,}) {
  return _then(_InvitationData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as dynamic,athlete: null == athlete ? _self._athlete : athlete // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,jobPost: freezed == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as dynamic,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SendInvitationResponse {

 bool get success; String get message; InvitationData get invitation;
/// Create a copy of SendInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendInvitationResponseCopyWith<SendInvitationResponse> get copyWith => _$SendInvitationResponseCopyWithImpl<SendInvitationResponse>(this as SendInvitationResponse, _$identity);

  /// Serializes this SendInvitationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendInvitationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.invitation, invitation) || other.invitation == invitation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,invitation);

@override
String toString() {
  return 'SendInvitationResponse(success: $success, message: $message, invitation: $invitation)';
}


}

/// @nodoc
abstract mixin class $SendInvitationResponseCopyWith<$Res>  {
  factory $SendInvitationResponseCopyWith(SendInvitationResponse value, $Res Function(SendInvitationResponse) _then) = _$SendInvitationResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, InvitationData invitation
});


$InvitationDataCopyWith<$Res> get invitation;

}
/// @nodoc
class _$SendInvitationResponseCopyWithImpl<$Res>
    implements $SendInvitationResponseCopyWith<$Res> {
  _$SendInvitationResponseCopyWithImpl(this._self, this._then);

  final SendInvitationResponse _self;
  final $Res Function(SendInvitationResponse) _then;

/// Create a copy of SendInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? invitation = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,invitation: null == invitation ? _self.invitation : invitation // ignore: cast_nullable_to_non_nullable
as InvitationData,
  ));
}
/// Create a copy of SendInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvitationDataCopyWith<$Res> get invitation {
  
  return $InvitationDataCopyWith<$Res>(_self.invitation, (value) {
    return _then(_self.copyWith(invitation: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendInvitationResponse].
extension SendInvitationResponsePatterns on SendInvitationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendInvitationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendInvitationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendInvitationResponse value)  $default,){
final _that = this;
switch (_that) {
case _SendInvitationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendInvitationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SendInvitationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  InvitationData invitation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendInvitationResponse() when $default != null:
return $default(_that.success,_that.message,_that.invitation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  InvitationData invitation)  $default,) {final _that = this;
switch (_that) {
case _SendInvitationResponse():
return $default(_that.success,_that.message,_that.invitation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  InvitationData invitation)?  $default,) {final _that = this;
switch (_that) {
case _SendInvitationResponse() when $default != null:
return $default(_that.success,_that.message,_that.invitation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendInvitationResponse implements SendInvitationResponse {
  const _SendInvitationResponse({required this.success, required this.message, required this.invitation});
  factory _SendInvitationResponse.fromJson(Map<String, dynamic> json) => _$SendInvitationResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  InvitationData invitation;

/// Create a copy of SendInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendInvitationResponseCopyWith<_SendInvitationResponse> get copyWith => __$SendInvitationResponseCopyWithImpl<_SendInvitationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendInvitationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendInvitationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.invitation, invitation) || other.invitation == invitation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,invitation);

@override
String toString() {
  return 'SendInvitationResponse(success: $success, message: $message, invitation: $invitation)';
}


}

/// @nodoc
abstract mixin class _$SendInvitationResponseCopyWith<$Res> implements $SendInvitationResponseCopyWith<$Res> {
  factory _$SendInvitationResponseCopyWith(_SendInvitationResponse value, $Res Function(_SendInvitationResponse) _then) = __$SendInvitationResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, InvitationData invitation
});


@override $InvitationDataCopyWith<$Res> get invitation;

}
/// @nodoc
class __$SendInvitationResponseCopyWithImpl<$Res>
    implements _$SendInvitationResponseCopyWith<$Res> {
  __$SendInvitationResponseCopyWithImpl(this._self, this._then);

  final _SendInvitationResponse _self;
  final $Res Function(_SendInvitationResponse) _then;

/// Create a copy of SendInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? invitation = null,}) {
  return _then(_SendInvitationResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,invitation: null == invitation ? _self.invitation : invitation // ignore: cast_nullable_to_non_nullable
as InvitationData,
  ));
}

/// Create a copy of SendInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvitationDataCopyWith<$Res> get invitation {
  
  return $InvitationDataCopyWith<$Res>(_self.invitation, (value) {
    return _then(_self.copyWith(invitation: value));
  });
}
}


/// @nodoc
mixin _$SponsorInvitationsData {

 List<InvitationData> get invitations; int get count;
/// Create a copy of SponsorInvitationsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorInvitationsDataCopyWith<SponsorInvitationsData> get copyWith => _$SponsorInvitationsDataCopyWithImpl<SponsorInvitationsData>(this as SponsorInvitationsData, _$identity);

  /// Serializes this SponsorInvitationsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorInvitationsData&&const DeepCollectionEquality().equals(other.invitations, invitations)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invitations),count);

@override
String toString() {
  return 'SponsorInvitationsData(invitations: $invitations, count: $count)';
}


}

/// @nodoc
abstract mixin class $SponsorInvitationsDataCopyWith<$Res>  {
  factory $SponsorInvitationsDataCopyWith(SponsorInvitationsData value, $Res Function(SponsorInvitationsData) _then) = _$SponsorInvitationsDataCopyWithImpl;
@useResult
$Res call({
 List<InvitationData> invitations, int count
});




}
/// @nodoc
class _$SponsorInvitationsDataCopyWithImpl<$Res>
    implements $SponsorInvitationsDataCopyWith<$Res> {
  _$SponsorInvitationsDataCopyWithImpl(this._self, this._then);

  final SponsorInvitationsData _self;
  final $Res Function(SponsorInvitationsData) _then;

/// Create a copy of SponsorInvitationsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invitations = null,Object? count = null,}) {
  return _then(_self.copyWith(
invitations: null == invitations ? _self.invitations : invitations // ignore: cast_nullable_to_non_nullable
as List<InvitationData>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorInvitationsData].
extension SponsorInvitationsDataPatterns on SponsorInvitationsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorInvitationsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorInvitationsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorInvitationsData value)  $default,){
final _that = this;
switch (_that) {
case _SponsorInvitationsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorInvitationsData value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorInvitationsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InvitationData> invitations,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorInvitationsData() when $default != null:
return $default(_that.invitations,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InvitationData> invitations,  int count)  $default,) {final _that = this;
switch (_that) {
case _SponsorInvitationsData():
return $default(_that.invitations,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InvitationData> invitations,  int count)?  $default,) {final _that = this;
switch (_that) {
case _SponsorInvitationsData() when $default != null:
return $default(_that.invitations,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorInvitationsData implements SponsorInvitationsData {
  const _SponsorInvitationsData({required final  List<InvitationData> invitations, required this.count}): _invitations = invitations;
  factory _SponsorInvitationsData.fromJson(Map<String, dynamic> json) => _$SponsorInvitationsDataFromJson(json);

 final  List<InvitationData> _invitations;
@override List<InvitationData> get invitations {
  if (_invitations is EqualUnmodifiableListView) return _invitations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_invitations);
}

@override final  int count;

/// Create a copy of SponsorInvitationsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorInvitationsDataCopyWith<_SponsorInvitationsData> get copyWith => __$SponsorInvitationsDataCopyWithImpl<_SponsorInvitationsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorInvitationsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorInvitationsData&&const DeepCollectionEquality().equals(other._invitations, _invitations)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_invitations),count);

@override
String toString() {
  return 'SponsorInvitationsData(invitations: $invitations, count: $count)';
}


}

/// @nodoc
abstract mixin class _$SponsorInvitationsDataCopyWith<$Res> implements $SponsorInvitationsDataCopyWith<$Res> {
  factory _$SponsorInvitationsDataCopyWith(_SponsorInvitationsData value, $Res Function(_SponsorInvitationsData) _then) = __$SponsorInvitationsDataCopyWithImpl;
@override @useResult
$Res call({
 List<InvitationData> invitations, int count
});




}
/// @nodoc
class __$SponsorInvitationsDataCopyWithImpl<$Res>
    implements _$SponsorInvitationsDataCopyWith<$Res> {
  __$SponsorInvitationsDataCopyWithImpl(this._self, this._then);

  final _SponsorInvitationsData _self;
  final $Res Function(_SponsorInvitationsData) _then;

/// Create a copy of SponsorInvitationsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invitations = null,Object? count = null,}) {
  return _then(_SponsorInvitationsData(
invitations: null == invitations ? _self._invitations : invitations // ignore: cast_nullable_to_non_nullable
as List<InvitationData>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SponsorInvitationsResponse {

 bool get success; String get message; SponsorInvitationsData get data;
/// Create a copy of SponsorInvitationsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorInvitationsResponseCopyWith<SponsorInvitationsResponse> get copyWith => _$SponsorInvitationsResponseCopyWithImpl<SponsorInvitationsResponse>(this as SponsorInvitationsResponse, _$identity);

  /// Serializes this SponsorInvitationsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorInvitationsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SponsorInvitationsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $SponsorInvitationsResponseCopyWith<$Res>  {
  factory $SponsorInvitationsResponseCopyWith(SponsorInvitationsResponse value, $Res Function(SponsorInvitationsResponse) _then) = _$SponsorInvitationsResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, SponsorInvitationsData data
});


$SponsorInvitationsDataCopyWith<$Res> get data;

}
/// @nodoc
class _$SponsorInvitationsResponseCopyWithImpl<$Res>
    implements $SponsorInvitationsResponseCopyWith<$Res> {
  _$SponsorInvitationsResponseCopyWithImpl(this._self, this._then);

  final SponsorInvitationsResponse _self;
  final $Res Function(SponsorInvitationsResponse) _then;

/// Create a copy of SponsorInvitationsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SponsorInvitationsData,
  ));
}
/// Create a copy of SponsorInvitationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorInvitationsDataCopyWith<$Res> get data {
  
  return $SponsorInvitationsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorInvitationsResponse].
extension SponsorInvitationsResponsePatterns on SponsorInvitationsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorInvitationsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorInvitationsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorInvitationsResponse value)  $default,){
final _that = this;
switch (_that) {
case _SponsorInvitationsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorInvitationsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorInvitationsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  SponsorInvitationsData data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorInvitationsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  SponsorInvitationsData data)  $default,) {final _that = this;
switch (_that) {
case _SponsorInvitationsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  SponsorInvitationsData data)?  $default,) {final _that = this;
switch (_that) {
case _SponsorInvitationsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorInvitationsResponse implements SponsorInvitationsResponse {
  const _SponsorInvitationsResponse({required this.success, required this.message, required this.data});
  factory _SponsorInvitationsResponse.fromJson(Map<String, dynamic> json) => _$SponsorInvitationsResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  SponsorInvitationsData data;

/// Create a copy of SponsorInvitationsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorInvitationsResponseCopyWith<_SponsorInvitationsResponse> get copyWith => __$SponsorInvitationsResponseCopyWithImpl<_SponsorInvitationsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorInvitationsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorInvitationsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'SponsorInvitationsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SponsorInvitationsResponseCopyWith<$Res> implements $SponsorInvitationsResponseCopyWith<$Res> {
  factory _$SponsorInvitationsResponseCopyWith(_SponsorInvitationsResponse value, $Res Function(_SponsorInvitationsResponse) _then) = __$SponsorInvitationsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, SponsorInvitationsData data
});


@override $SponsorInvitationsDataCopyWith<$Res> get data;

}
/// @nodoc
class __$SponsorInvitationsResponseCopyWithImpl<$Res>
    implements _$SponsorInvitationsResponseCopyWith<$Res> {
  __$SponsorInvitationsResponseCopyWithImpl(this._self, this._then);

  final _SponsorInvitationsResponse _self;
  final $Res Function(_SponsorInvitationsResponse) _then;

/// Create a copy of SponsorInvitationsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_SponsorInvitationsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SponsorInvitationsData,
  ));
}

/// Create a copy of SponsorInvitationsResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorInvitationsDataCopyWith<$Res> get data {
  
  return $SponsorInvitationsDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$WithdrawInvitationResponse {

 bool get success; String get message;
/// Create a copy of WithdrawInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WithdrawInvitationResponseCopyWith<WithdrawInvitationResponse> get copyWith => _$WithdrawInvitationResponseCopyWithImpl<WithdrawInvitationResponse>(this as WithdrawInvitationResponse, _$identity);

  /// Serializes this WithdrawInvitationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WithdrawInvitationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'WithdrawInvitationResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $WithdrawInvitationResponseCopyWith<$Res>  {
  factory $WithdrawInvitationResponseCopyWith(WithdrawInvitationResponse value, $Res Function(WithdrawInvitationResponse) _then) = _$WithdrawInvitationResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$WithdrawInvitationResponseCopyWithImpl<$Res>
    implements $WithdrawInvitationResponseCopyWith<$Res> {
  _$WithdrawInvitationResponseCopyWithImpl(this._self, this._then);

  final WithdrawInvitationResponse _self;
  final $Res Function(WithdrawInvitationResponse) _then;

/// Create a copy of WithdrawInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WithdrawInvitationResponse].
extension WithdrawInvitationResponsePatterns on WithdrawInvitationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WithdrawInvitationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WithdrawInvitationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WithdrawInvitationResponse value)  $default,){
final _that = this;
switch (_that) {
case _WithdrawInvitationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WithdrawInvitationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _WithdrawInvitationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WithdrawInvitationResponse() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _WithdrawInvitationResponse():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _WithdrawInvitationResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WithdrawInvitationResponse implements WithdrawInvitationResponse {
  const _WithdrawInvitationResponse({required this.success, required this.message});
  factory _WithdrawInvitationResponse.fromJson(Map<String, dynamic> json) => _$WithdrawInvitationResponseFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of WithdrawInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WithdrawInvitationResponseCopyWith<_WithdrawInvitationResponse> get copyWith => __$WithdrawInvitationResponseCopyWithImpl<_WithdrawInvitationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WithdrawInvitationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WithdrawInvitationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'WithdrawInvitationResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$WithdrawInvitationResponseCopyWith<$Res> implements $WithdrawInvitationResponseCopyWith<$Res> {
  factory _$WithdrawInvitationResponseCopyWith(_WithdrawInvitationResponse value, $Res Function(_WithdrawInvitationResponse) _then) = __$WithdrawInvitationResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$WithdrawInvitationResponseCopyWithImpl<$Res>
    implements _$WithdrawInvitationResponseCopyWith<$Res> {
  __$WithdrawInvitationResponseCopyWithImpl(this._self, this._then);

  final _WithdrawInvitationResponse _self;
  final $Res Function(_WithdrawInvitationResponse) _then;

/// Create a copy of WithdrawInvitationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_WithdrawInvitationResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DeleteJobResponse {

 bool get success; String get message;
/// Create a copy of DeleteJobResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteJobResponseCopyWith<DeleteJobResponse> get copyWith => _$DeleteJobResponseCopyWithImpl<DeleteJobResponse>(this as DeleteJobResponse, _$identity);

  /// Serializes this DeleteJobResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteJobResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'DeleteJobResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class $DeleteJobResponseCopyWith<$Res>  {
  factory $DeleteJobResponseCopyWith(DeleteJobResponse value, $Res Function(DeleteJobResponse) _then) = _$DeleteJobResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class _$DeleteJobResponseCopyWithImpl<$Res>
    implements $DeleteJobResponseCopyWith<$Res> {
  _$DeleteJobResponseCopyWithImpl(this._self, this._then);

  final DeleteJobResponse _self;
  final $Res Function(DeleteJobResponse) _then;

/// Create a copy of DeleteJobResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeleteJobResponse].
extension DeleteJobResponsePatterns on DeleteJobResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeleteJobResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteJobResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeleteJobResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeleteJobResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeleteJobResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeleteJobResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteJobResponse() when $default != null:
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message)  $default,) {final _that = this;
switch (_that) {
case _DeleteJobResponse():
return $default(_that.success,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message)?  $default,) {final _that = this;
switch (_that) {
case _DeleteJobResponse() when $default != null:
return $default(_that.success,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeleteJobResponse implements DeleteJobResponse {
  const _DeleteJobResponse({required this.success, required this.message});
  factory _DeleteJobResponse.fromJson(Map<String, dynamic> json) => _$DeleteJobResponseFromJson(json);

@override final  bool success;
@override final  String message;

/// Create a copy of DeleteJobResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteJobResponseCopyWith<_DeleteJobResponse> get copyWith => __$DeleteJobResponseCopyWithImpl<_DeleteJobResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteJobResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteJobResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message);

@override
String toString() {
  return 'DeleteJobResponse(success: $success, message: $message)';
}


}

/// @nodoc
abstract mixin class _$DeleteJobResponseCopyWith<$Res> implements $DeleteJobResponseCopyWith<$Res> {
  factory _$DeleteJobResponseCopyWith(_DeleteJobResponse value, $Res Function(_DeleteJobResponse) _then) = __$DeleteJobResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message
});




}
/// @nodoc
class __$DeleteJobResponseCopyWithImpl<$Res>
    implements _$DeleteJobResponseCopyWith<$Res> {
  __$DeleteJobResponseCopyWithImpl(this._self, this._then);

  final _DeleteJobResponse _self;
  final $Res Function(_DeleteJobResponse) _then;

/// Create a copy of DeleteJobResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,}) {
  return _then(_DeleteJobResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
