// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JobListState {

 bool get isLoading; List<JobPostItem> get jobPosts; String? get errorMessage; String? get companyName; String? get companyLogo;
/// Create a copy of JobListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobListStateCopyWith<JobListState> get copyWith => _$JobListStateCopyWithImpl<JobListState>(this as JobListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobListState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.jobPosts, jobPosts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(jobPosts),errorMessage,companyName,companyLogo);

@override
String toString() {
  return 'JobListState(isLoading: $isLoading, jobPosts: $jobPosts, errorMessage: $errorMessage, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class $JobListStateCopyWith<$Res>  {
  factory $JobListStateCopyWith(JobListState value, $Res Function(JobListState) _then) = _$JobListStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<JobPostItem> jobPosts, String? errorMessage, String? companyName, String? companyLogo
});




}
/// @nodoc
class _$JobListStateCopyWithImpl<$Res>
    implements $JobListStateCopyWith<$Res> {
  _$JobListStateCopyWithImpl(this._self, this._then);

  final JobListState _self;
  final $Res Function(JobListState) _then;

/// Create a copy of JobListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? jobPosts = null,Object? errorMessage = freezed,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,jobPosts: null == jobPosts ? _self.jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<JobPostItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobListState].
extension JobListStatePatterns on JobListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobListState value)  $default,){
final _that = this;
switch (_that) {
case _JobListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobListState value)?  $default,){
final _that = this;
switch (_that) {
case _JobListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<JobPostItem> jobPosts,  String? errorMessage,  String? companyName,  String? companyLogo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobListState() when $default != null:
return $default(_that.isLoading,_that.jobPosts,_that.errorMessage,_that.companyName,_that.companyLogo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<JobPostItem> jobPosts,  String? errorMessage,  String? companyName,  String? companyLogo)  $default,) {final _that = this;
switch (_that) {
case _JobListState():
return $default(_that.isLoading,_that.jobPosts,_that.errorMessage,_that.companyName,_that.companyLogo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<JobPostItem> jobPosts,  String? errorMessage,  String? companyName,  String? companyLogo)?  $default,) {final _that = this;
switch (_that) {
case _JobListState() when $default != null:
return $default(_that.isLoading,_that.jobPosts,_that.errorMessage,_that.companyName,_that.companyLogo);case _:
  return null;

}
}

}

/// @nodoc


class _JobListState implements JobListState {
  const _JobListState({this.isLoading = false, final  List<JobPostItem> jobPosts = const [], this.errorMessage, this.companyName, this.companyLogo}): _jobPosts = jobPosts;
  

@override@JsonKey() final  bool isLoading;
 final  List<JobPostItem> _jobPosts;
@override@JsonKey() List<JobPostItem> get jobPosts {
  if (_jobPosts is EqualUnmodifiableListView) return _jobPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobPosts);
}

@override final  String? errorMessage;
@override final  String? companyName;
@override final  String? companyLogo;

/// Create a copy of JobListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobListStateCopyWith<_JobListState> get copyWith => __$JobListStateCopyWithImpl<_JobListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobListState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._jobPosts, _jobPosts)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_jobPosts),errorMessage,companyName,companyLogo);

@override
String toString() {
  return 'JobListState(isLoading: $isLoading, jobPosts: $jobPosts, errorMessage: $errorMessage, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class _$JobListStateCopyWith<$Res> implements $JobListStateCopyWith<$Res> {
  factory _$JobListStateCopyWith(_JobListState value, $Res Function(_JobListState) _then) = __$JobListStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<JobPostItem> jobPosts, String? errorMessage, String? companyName, String? companyLogo
});




}
/// @nodoc
class __$JobListStateCopyWithImpl<$Res>
    implements _$JobListStateCopyWith<$Res> {
  __$JobListStateCopyWithImpl(this._self, this._then);

  final _JobListState _self;
  final $Res Function(_JobListState) _then;

/// Create a copy of JobListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? jobPosts = null,Object? errorMessage = freezed,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_JobListState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,jobPosts: null == jobPosts ? _self._jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<JobPostItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
