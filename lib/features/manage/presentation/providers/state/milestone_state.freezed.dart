// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MilestoneState {

 bool get isLoading; bool get isSuccess; String? get errorMessage; String? get successMessage; Milestone? get milestone; List<Milestone> get milestones; int get milestonesCount;
/// Create a copy of MilestoneState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneStateCopyWith<MilestoneState> get copyWith => _$MilestoneStateCopyWithImpl<MilestoneState>(this as MilestoneState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.milestone, milestone) || other.milestone == milestone)&&const DeepCollectionEquality().equals(other.milestones, milestones)&&(identical(other.milestonesCount, milestonesCount) || other.milestonesCount == milestonesCount));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,errorMessage,successMessage,milestone,const DeepCollectionEquality().hash(milestones),milestonesCount);

@override
String toString() {
  return 'MilestoneState(isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, successMessage: $successMessage, milestone: $milestone, milestones: $milestones, milestonesCount: $milestonesCount)';
}


}

/// @nodoc
abstract mixin class $MilestoneStateCopyWith<$Res>  {
  factory $MilestoneStateCopyWith(MilestoneState value, $Res Function(MilestoneState) _then) = _$MilestoneStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, String? errorMessage, String? successMessage, Milestone? milestone, List<Milestone> milestones, int milestonesCount
});


$MilestoneCopyWith<$Res>? get milestone;

}
/// @nodoc
class _$MilestoneStateCopyWithImpl<$Res>
    implements $MilestoneStateCopyWith<$Res> {
  _$MilestoneStateCopyWithImpl(this._self, this._then);

  final MilestoneState _self;
  final $Res Function(MilestoneState) _then;

/// Create a copy of MilestoneState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? milestone = freezed,Object? milestones = null,Object? milestonesCount = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,milestone: freezed == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone?,milestones: null == milestones ? _self.milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,milestonesCount: null == milestonesCount ? _self.milestonesCount : milestonesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MilestoneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res>? get milestone {
    if (_self.milestone == null) {
    return null;
  }

  return $MilestoneCopyWith<$Res>(_self.milestone!, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}


/// Adds pattern-matching-related methods to [MilestoneState].
extension MilestoneStatePatterns on MilestoneState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneState value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneState value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  String? errorMessage,  String? successMessage,  Milestone? milestone,  List<Milestone> milestones,  int milestonesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.errorMessage,_that.successMessage,_that.milestone,_that.milestones,_that.milestonesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  String? errorMessage,  String? successMessage,  Milestone? milestone,  List<Milestone> milestones,  int milestonesCount)  $default,) {final _that = this;
switch (_that) {
case _MilestoneState():
return $default(_that.isLoading,_that.isSuccess,_that.errorMessage,_that.successMessage,_that.milestone,_that.milestones,_that.milestonesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  String? errorMessage,  String? successMessage,  Milestone? milestone,  List<Milestone> milestones,  int milestonesCount)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.errorMessage,_that.successMessage,_that.milestone,_that.milestones,_that.milestonesCount);case _:
  return null;

}
}

}

/// @nodoc


class _MilestoneState implements MilestoneState {
  const _MilestoneState({this.isLoading = false, this.isSuccess = false, this.errorMessage, this.successMessage, this.milestone, final  List<Milestone> milestones = const [], this.milestonesCount = 0}): _milestones = milestones;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;
@override final  String? successMessage;
@override final  Milestone? milestone;
 final  List<Milestone> _milestones;
@override@JsonKey() List<Milestone> get milestones {
  if (_milestones is EqualUnmodifiableListView) return _milestones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_milestones);
}

@override@JsonKey() final  int milestonesCount;

/// Create a copy of MilestoneState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneStateCopyWith<_MilestoneState> get copyWith => __$MilestoneStateCopyWithImpl<_MilestoneState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.milestone, milestone) || other.milestone == milestone)&&const DeepCollectionEquality().equals(other._milestones, _milestones)&&(identical(other.milestonesCount, milestonesCount) || other.milestonesCount == milestonesCount));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,errorMessage,successMessage,milestone,const DeepCollectionEquality().hash(_milestones),milestonesCount);

@override
String toString() {
  return 'MilestoneState(isLoading: $isLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, successMessage: $successMessage, milestone: $milestone, milestones: $milestones, milestonesCount: $milestonesCount)';
}


}

/// @nodoc
abstract mixin class _$MilestoneStateCopyWith<$Res> implements $MilestoneStateCopyWith<$Res> {
  factory _$MilestoneStateCopyWith(_MilestoneState value, $Res Function(_MilestoneState) _then) = __$MilestoneStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, String? errorMessage, String? successMessage, Milestone? milestone, List<Milestone> milestones, int milestonesCount
});


@override $MilestoneCopyWith<$Res>? get milestone;

}
/// @nodoc
class __$MilestoneStateCopyWithImpl<$Res>
    implements _$MilestoneStateCopyWith<$Res> {
  __$MilestoneStateCopyWithImpl(this._self, this._then);

  final _MilestoneState _self;
  final $Res Function(_MilestoneState) _then;

/// Create a copy of MilestoneState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? milestone = freezed,Object? milestones = null,Object? milestonesCount = null,}) {
  return _then(_MilestoneState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,milestone: freezed == milestone ? _self.milestone : milestone // ignore: cast_nullable_to_non_nullable
as Milestone?,milestones: null == milestones ? _self._milestones : milestones // ignore: cast_nullable_to_non_nullable
as List<Milestone>,milestonesCount: null == milestonesCount ? _self.milestonesCount : milestonesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MilestoneState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneCopyWith<$Res>? get milestone {
    if (_self.milestone == null) {
    return null;
  }

  return $MilestoneCopyWith<$Res>(_self.milestone!, (value) {
    return _then(_self.copyWith(milestone: value));
  });
}
}

// dart format on
