// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_post_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobPostRequest {

 String get title;@JsonKey(name: 'sport_id') String? get sportId; String? get location; String? get description; String? get timelineStart; String? get timelineEnd; String? get requirements; List<String>? get media;
/// Create a copy of JobPostRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPostRequestCopyWith<JobPostRequest> get copyWith => _$JobPostRequestCopyWithImpl<JobPostRequest>(this as JobPostRequest, _$identity);

  /// Serializes this JobPostRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPostRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.timelineStart, timelineStart) || other.timelineStart == timelineStart)&&(identical(other.timelineEnd, timelineEnd) || other.timelineEnd == timelineEnd)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,sportId,location,description,timelineStart,timelineEnd,requirements,const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'JobPostRequest(title: $title, sportId: $sportId, location: $location, description: $description, timelineStart: $timelineStart, timelineEnd: $timelineEnd, requirements: $requirements, media: $media)';
}


}

/// @nodoc
abstract mixin class $JobPostRequestCopyWith<$Res>  {
  factory $JobPostRequestCopyWith(JobPostRequest value, $Res Function(JobPostRequest) _then) = _$JobPostRequestCopyWithImpl;
@useResult
$Res call({
 String title,@JsonKey(name: 'sport_id') String? sportId, String? location, String? description, String? timelineStart, String? timelineEnd, String? requirements, List<String>? media
});




}
/// @nodoc
class _$JobPostRequestCopyWithImpl<$Res>
    implements $JobPostRequestCopyWith<$Res> {
  _$JobPostRequestCopyWithImpl(this._self, this._then);

  final JobPostRequest _self;
  final $Res Function(JobPostRequest) _then;

/// Create a copy of JobPostRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? sportId = freezed,Object? location = freezed,Object? description = freezed,Object? timelineStart = freezed,Object? timelineEnd = freezed,Object? requirements = freezed,Object? media = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timelineStart: freezed == timelineStart ? _self.timelineStart : timelineStart // ignore: cast_nullable_to_non_nullable
as String?,timelineEnd: freezed == timelineEnd ? _self.timelineEnd : timelineEnd // ignore: cast_nullable_to_non_nullable
as String?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,media: freezed == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobPostRequest].
extension JobPostRequestPatterns on JobPostRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPostRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPostRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPostRequest value)  $default,){
final _that = this;
switch (_that) {
case _JobPostRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPostRequest value)?  $default,){
final _that = this;
switch (_that) {
case _JobPostRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'sport_id')  String? sportId,  String? location,  String? description,  String? timelineStart,  String? timelineEnd,  String? requirements,  List<String>? media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPostRequest() when $default != null:
return $default(_that.title,_that.sportId,_that.location,_that.description,_that.timelineStart,_that.timelineEnd,_that.requirements,_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title, @JsonKey(name: 'sport_id')  String? sportId,  String? location,  String? description,  String? timelineStart,  String? timelineEnd,  String? requirements,  List<String>? media)  $default,) {final _that = this;
switch (_that) {
case _JobPostRequest():
return $default(_that.title,_that.sportId,_that.location,_that.description,_that.timelineStart,_that.timelineEnd,_that.requirements,_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title, @JsonKey(name: 'sport_id')  String? sportId,  String? location,  String? description,  String? timelineStart,  String? timelineEnd,  String? requirements,  List<String>? media)?  $default,) {final _that = this;
switch (_that) {
case _JobPostRequest() when $default != null:
return $default(_that.title,_that.sportId,_that.location,_that.description,_that.timelineStart,_that.timelineEnd,_that.requirements,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPostRequest implements JobPostRequest {
  const _JobPostRequest({required this.title, @JsonKey(name: 'sport_id') this.sportId, this.location, this.description, this.timelineStart, this.timelineEnd, this.requirements, final  List<String>? media}): _media = media;
  factory _JobPostRequest.fromJson(Map<String, dynamic> json) => _$JobPostRequestFromJson(json);

@override final  String title;
@override@JsonKey(name: 'sport_id') final  String? sportId;
@override final  String? location;
@override final  String? description;
@override final  String? timelineStart;
@override final  String? timelineEnd;
@override final  String? requirements;
 final  List<String>? _media;
@override List<String>? get media {
  final value = _media;
  if (value == null) return null;
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of JobPostRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPostRequestCopyWith<_JobPostRequest> get copyWith => __$JobPostRequestCopyWithImpl<_JobPostRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPostRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPostRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.sportId, sportId) || other.sportId == sportId)&&(identical(other.location, location) || other.location == location)&&(identical(other.description, description) || other.description == description)&&(identical(other.timelineStart, timelineStart) || other.timelineStart == timelineStart)&&(identical(other.timelineEnd, timelineEnd) || other.timelineEnd == timelineEnd)&&(identical(other.requirements, requirements) || other.requirements == requirements)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,sportId,location,description,timelineStart,timelineEnd,requirements,const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'JobPostRequest(title: $title, sportId: $sportId, location: $location, description: $description, timelineStart: $timelineStart, timelineEnd: $timelineEnd, requirements: $requirements, media: $media)';
}


}

/// @nodoc
abstract mixin class _$JobPostRequestCopyWith<$Res> implements $JobPostRequestCopyWith<$Res> {
  factory _$JobPostRequestCopyWith(_JobPostRequest value, $Res Function(_JobPostRequest) _then) = __$JobPostRequestCopyWithImpl;
@override @useResult
$Res call({
 String title,@JsonKey(name: 'sport_id') String? sportId, String? location, String? description, String? timelineStart, String? timelineEnd, String? requirements, List<String>? media
});




}
/// @nodoc
class __$JobPostRequestCopyWithImpl<$Res>
    implements _$JobPostRequestCopyWith<$Res> {
  __$JobPostRequestCopyWithImpl(this._self, this._then);

  final _JobPostRequest _self;
  final $Res Function(_JobPostRequest) _then;

/// Create a copy of JobPostRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? sportId = freezed,Object? location = freezed,Object? description = freezed,Object? timelineStart = freezed,Object? timelineEnd = freezed,Object? requirements = freezed,Object? media = freezed,}) {
  return _then(_JobPostRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sportId: freezed == sportId ? _self.sportId : sportId // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timelineStart: freezed == timelineStart ? _self.timelineStart : timelineStart // ignore: cast_nullable_to_non_nullable
as String?,timelineEnd: freezed == timelineEnd ? _self.timelineEnd : timelineEnd // ignore: cast_nullable_to_non_nullable
as String?,requirements: freezed == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as String?,media: freezed == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$CreateJobPostResponse {

 bool get success; String get message; Map<String, dynamic>? get jobPost;
/// Create a copy of CreateJobPostResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateJobPostResponseCopyWith<CreateJobPostResponse> get copyWith => _$CreateJobPostResponseCopyWithImpl<CreateJobPostResponse>(this as CreateJobPostResponse, _$identity);

  /// Serializes this CreateJobPostResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateJobPostResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.jobPost, jobPost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(jobPost));

@override
String toString() {
  return 'CreateJobPostResponse(success: $success, message: $message, jobPost: $jobPost)';
}


}

/// @nodoc
abstract mixin class $CreateJobPostResponseCopyWith<$Res>  {
  factory $CreateJobPostResponseCopyWith(CreateJobPostResponse value, $Res Function(CreateJobPostResponse) _then) = _$CreateJobPostResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Map<String, dynamic>? jobPost
});




}
/// @nodoc
class _$CreateJobPostResponseCopyWithImpl<$Res>
    implements $CreateJobPostResponseCopyWith<$Res> {
  _$CreateJobPostResponseCopyWithImpl(this._self, this._then);

  final CreateJobPostResponse _self;
  final $Res Function(CreateJobPostResponse) _then;

/// Create a copy of CreateJobPostResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? jobPost = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,jobPost: freezed == jobPost ? _self.jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateJobPostResponse].
extension CreateJobPostResponsePatterns on CreateJobPostResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateJobPostResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateJobPostResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateJobPostResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreateJobPostResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateJobPostResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreateJobPostResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Map<String, dynamic>? jobPost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateJobPostResponse() when $default != null:
return $default(_that.success,_that.message,_that.jobPost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Map<String, dynamic>? jobPost)  $default,) {final _that = this;
switch (_that) {
case _CreateJobPostResponse():
return $default(_that.success,_that.message,_that.jobPost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Map<String, dynamic>? jobPost)?  $default,) {final _that = this;
switch (_that) {
case _CreateJobPostResponse() when $default != null:
return $default(_that.success,_that.message,_that.jobPost);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateJobPostResponse implements CreateJobPostResponse {
  const _CreateJobPostResponse({required this.success, required this.message, final  Map<String, dynamic>? jobPost}): _jobPost = jobPost;
  factory _CreateJobPostResponse.fromJson(Map<String, dynamic> json) => _$CreateJobPostResponseFromJson(json);

@override final  bool success;
@override final  String message;
 final  Map<String, dynamic>? _jobPost;
@override Map<String, dynamic>? get jobPost {
  final value = _jobPost;
  if (value == null) return null;
  if (_jobPost is EqualUnmodifiableMapView) return _jobPost;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CreateJobPostResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateJobPostResponseCopyWith<_CreateJobPostResponse> get copyWith => __$CreateJobPostResponseCopyWithImpl<_CreateJobPostResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateJobPostResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateJobPostResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._jobPost, _jobPost));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_jobPost));

@override
String toString() {
  return 'CreateJobPostResponse(success: $success, message: $message, jobPost: $jobPost)';
}


}

/// @nodoc
abstract mixin class _$CreateJobPostResponseCopyWith<$Res> implements $CreateJobPostResponseCopyWith<$Res> {
  factory _$CreateJobPostResponseCopyWith(_CreateJobPostResponse value, $Res Function(_CreateJobPostResponse) _then) = __$CreateJobPostResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Map<String, dynamic>? jobPost
});




}
/// @nodoc
class __$CreateJobPostResponseCopyWithImpl<$Res>
    implements _$CreateJobPostResponseCopyWith<$Res> {
  __$CreateJobPostResponseCopyWithImpl(this._self, this._then);

  final _CreateJobPostResponse _self;
  final $Res Function(_CreateJobPostResponse) _then;

/// Create a copy of CreateJobPostResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? jobPost = freezed,}) {
  return _then(_CreateJobPostResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,jobPost: freezed == jobPost ? _self._jobPost : jobPost // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
