// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManageScreenState {

/// Current section being displayed in the jobs tab
 JobsSectionState get jobsState;/// Currently active tab in the applicants view
 ApplicantTab get activeApplicantTab;/// Index of the currently selected job
 int? get selectedJobIndex;/// Previous jobs state for back navigation
 JobsSectionState? get previousJobsState;
/// Create a copy of ManageScreenState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageScreenStateCopyWith<ManageScreenState> get copyWith => _$ManageScreenStateCopyWithImpl<ManageScreenState>(this as ManageScreenState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageScreenState&&(identical(other.jobsState, jobsState) || other.jobsState == jobsState)&&(identical(other.activeApplicantTab, activeApplicantTab) || other.activeApplicantTab == activeApplicantTab)&&(identical(other.selectedJobIndex, selectedJobIndex) || other.selectedJobIndex == selectedJobIndex)&&(identical(other.previousJobsState, previousJobsState) || other.previousJobsState == previousJobsState));
}


@override
int get hashCode => Object.hash(runtimeType,jobsState,activeApplicantTab,selectedJobIndex,previousJobsState);

@override
String toString() {
  return 'ManageScreenState(jobsState: $jobsState, activeApplicantTab: $activeApplicantTab, selectedJobIndex: $selectedJobIndex, previousJobsState: $previousJobsState)';
}


}

/// @nodoc
abstract mixin class $ManageScreenStateCopyWith<$Res>  {
  factory $ManageScreenStateCopyWith(ManageScreenState value, $Res Function(ManageScreenState) _then) = _$ManageScreenStateCopyWithImpl;
@useResult
$Res call({
 JobsSectionState jobsState, ApplicantTab activeApplicantTab, int? selectedJobIndex, JobsSectionState? previousJobsState
});




}
/// @nodoc
class _$ManageScreenStateCopyWithImpl<$Res>
    implements $ManageScreenStateCopyWith<$Res> {
  _$ManageScreenStateCopyWithImpl(this._self, this._then);

  final ManageScreenState _self;
  final $Res Function(ManageScreenState) _then;

/// Create a copy of ManageScreenState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobsState = null,Object? activeApplicantTab = null,Object? selectedJobIndex = freezed,Object? previousJobsState = freezed,}) {
  return _then(_self.copyWith(
jobsState: null == jobsState ? _self.jobsState : jobsState // ignore: cast_nullable_to_non_nullable
as JobsSectionState,activeApplicantTab: null == activeApplicantTab ? _self.activeApplicantTab : activeApplicantTab // ignore: cast_nullable_to_non_nullable
as ApplicantTab,selectedJobIndex: freezed == selectedJobIndex ? _self.selectedJobIndex : selectedJobIndex // ignore: cast_nullable_to_non_nullable
as int?,previousJobsState: freezed == previousJobsState ? _self.previousJobsState : previousJobsState // ignore: cast_nullable_to_non_nullable
as JobsSectionState?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManageScreenState].
extension ManageScreenStatePatterns on ManageScreenState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageScreenState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageScreenState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageScreenState value)  $default,){
final _that = this;
switch (_that) {
case _ManageScreenState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageScreenState value)?  $default,){
final _that = this;
switch (_that) {
case _ManageScreenState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JobsSectionState jobsState,  ApplicantTab activeApplicantTab,  int? selectedJobIndex,  JobsSectionState? previousJobsState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageScreenState() when $default != null:
return $default(_that.jobsState,_that.activeApplicantTab,_that.selectedJobIndex,_that.previousJobsState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JobsSectionState jobsState,  ApplicantTab activeApplicantTab,  int? selectedJobIndex,  JobsSectionState? previousJobsState)  $default,) {final _that = this;
switch (_that) {
case _ManageScreenState():
return $default(_that.jobsState,_that.activeApplicantTab,_that.selectedJobIndex,_that.previousJobsState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JobsSectionState jobsState,  ApplicantTab activeApplicantTab,  int? selectedJobIndex,  JobsSectionState? previousJobsState)?  $default,) {final _that = this;
switch (_that) {
case _ManageScreenState() when $default != null:
return $default(_that.jobsState,_that.activeApplicantTab,_that.selectedJobIndex,_that.previousJobsState);case _:
  return null;

}
}

}

/// @nodoc


class _ManageScreenState implements ManageScreenState {
  const _ManageScreenState({this.jobsState = JobsSectionState.listing, this.activeApplicantTab = ApplicantTab.newApplicants, this.selectedJobIndex, this.previousJobsState});
  

/// Current section being displayed in the jobs tab
@override@JsonKey() final  JobsSectionState jobsState;
/// Currently active tab in the applicants view
@override@JsonKey() final  ApplicantTab activeApplicantTab;
/// Index of the currently selected job
@override final  int? selectedJobIndex;
/// Previous jobs state for back navigation
@override final  JobsSectionState? previousJobsState;

/// Create a copy of ManageScreenState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageScreenStateCopyWith<_ManageScreenState> get copyWith => __$ManageScreenStateCopyWithImpl<_ManageScreenState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageScreenState&&(identical(other.jobsState, jobsState) || other.jobsState == jobsState)&&(identical(other.activeApplicantTab, activeApplicantTab) || other.activeApplicantTab == activeApplicantTab)&&(identical(other.selectedJobIndex, selectedJobIndex) || other.selectedJobIndex == selectedJobIndex)&&(identical(other.previousJobsState, previousJobsState) || other.previousJobsState == previousJobsState));
}


@override
int get hashCode => Object.hash(runtimeType,jobsState,activeApplicantTab,selectedJobIndex,previousJobsState);

@override
String toString() {
  return 'ManageScreenState(jobsState: $jobsState, activeApplicantTab: $activeApplicantTab, selectedJobIndex: $selectedJobIndex, previousJobsState: $previousJobsState)';
}


}

/// @nodoc
abstract mixin class _$ManageScreenStateCopyWith<$Res> implements $ManageScreenStateCopyWith<$Res> {
  factory _$ManageScreenStateCopyWith(_ManageScreenState value, $Res Function(_ManageScreenState) _then) = __$ManageScreenStateCopyWithImpl;
@override @useResult
$Res call({
 JobsSectionState jobsState, ApplicantTab activeApplicantTab, int? selectedJobIndex, JobsSectionState? previousJobsState
});




}
/// @nodoc
class __$ManageScreenStateCopyWithImpl<$Res>
    implements _$ManageScreenStateCopyWith<$Res> {
  __$ManageScreenStateCopyWithImpl(this._self, this._then);

  final _ManageScreenState _self;
  final $Res Function(_ManageScreenState) _then;

/// Create a copy of ManageScreenState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobsState = null,Object? activeApplicantTab = null,Object? selectedJobIndex = freezed,Object? previousJobsState = freezed,}) {
  return _then(_ManageScreenState(
jobsState: null == jobsState ? _self.jobsState : jobsState // ignore: cast_nullable_to_non_nullable
as JobsSectionState,activeApplicantTab: null == activeApplicantTab ? _self.activeApplicantTab : activeApplicantTab // ignore: cast_nullable_to_non_nullable
as ApplicantTab,selectedJobIndex: freezed == selectedJobIndex ? _self.selectedJobIndex : selectedJobIndex // ignore: cast_nullable_to_non_nullable
as int?,previousJobsState: freezed == previousJobsState ? _self.previousJobsState : previousJobsState // ignore: cast_nullable_to_non_nullable
as JobsSectionState?,
  ));
}


}

// dart format on
