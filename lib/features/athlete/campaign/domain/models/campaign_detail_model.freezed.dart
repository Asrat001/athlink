// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampaignDetailModel {

@JsonKey(name: '_id') String? get id; String? get owner; CampaignTitleModel? get title; FinancialGoal? get financialGoal; List<CostBreakdownItem>? get costBreakdown; List<GoalItem>? get goals; List<PreferredSponsor>? get preferredSponsors; SponsorshipPreferences? get sponsorshipPreferences; String? get createdAt; String? get updatedAt;
/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignDetailModelCopyWith<CampaignDetailModel> get copyWith => _$CampaignDetailModelCopyWithImpl<CampaignDetailModel>(this as CampaignDetailModel, _$identity);

  /// Serializes this CampaignDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.title, title) || other.title == title)&&(identical(other.financialGoal, financialGoal) || other.financialGoal == financialGoal)&&const DeepCollectionEquality().equals(other.costBreakdown, costBreakdown)&&const DeepCollectionEquality().equals(other.goals, goals)&&const DeepCollectionEquality().equals(other.preferredSponsors, preferredSponsors)&&(identical(other.sponsorshipPreferences, sponsorshipPreferences) || other.sponsorshipPreferences == sponsorshipPreferences)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,owner,title,financialGoal,const DeepCollectionEquality().hash(costBreakdown),const DeepCollectionEquality().hash(goals),const DeepCollectionEquality().hash(preferredSponsors),sponsorshipPreferences,createdAt,updatedAt);

@override
String toString() {
  return 'CampaignDetailModel(id: $id, owner: $owner, title: $title, financialGoal: $financialGoal, costBreakdown: $costBreakdown, goals: $goals, preferredSponsors: $preferredSponsors, sponsorshipPreferences: $sponsorshipPreferences, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CampaignDetailModelCopyWith<$Res>  {
  factory $CampaignDetailModelCopyWith(CampaignDetailModel value, $Res Function(CampaignDetailModel) _then) = _$CampaignDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? owner, CampaignTitleModel? title, FinancialGoal? financialGoal, List<CostBreakdownItem>? costBreakdown, List<GoalItem>? goals, List<PreferredSponsor>? preferredSponsors, SponsorshipPreferences? sponsorshipPreferences, String? createdAt, String? updatedAt
});


$CampaignTitleModelCopyWith<$Res>? get title;$FinancialGoalCopyWith<$Res>? get financialGoal;$SponsorshipPreferencesCopyWith<$Res>? get sponsorshipPreferences;

}
/// @nodoc
class _$CampaignDetailModelCopyWithImpl<$Res>
    implements $CampaignDetailModelCopyWith<$Res> {
  _$CampaignDetailModelCopyWithImpl(this._self, this._then);

  final CampaignDetailModel _self;
  final $Res Function(CampaignDetailModel) _then;

/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? owner = freezed,Object? title = freezed,Object? financialGoal = freezed,Object? costBreakdown = freezed,Object? goals = freezed,Object? preferredSponsors = freezed,Object? sponsorshipPreferences = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as CampaignTitleModel?,financialGoal: freezed == financialGoal ? _self.financialGoal : financialGoal // ignore: cast_nullable_to_non_nullable
as FinancialGoal?,costBreakdown: freezed == costBreakdown ? _self.costBreakdown : costBreakdown // ignore: cast_nullable_to_non_nullable
as List<CostBreakdownItem>?,goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalItem>?,preferredSponsors: freezed == preferredSponsors ? _self.preferredSponsors : preferredSponsors // ignore: cast_nullable_to_non_nullable
as List<PreferredSponsor>?,sponsorshipPreferences: freezed == sponsorshipPreferences ? _self.sponsorshipPreferences : sponsorshipPreferences // ignore: cast_nullable_to_non_nullable
as SponsorshipPreferences?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CampaignTitleModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $CampaignTitleModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinancialGoalCopyWith<$Res>? get financialGoal {
    if (_self.financialGoal == null) {
    return null;
  }

  return $FinancialGoalCopyWith<$Res>(_self.financialGoal!, (value) {
    return _then(_self.copyWith(financialGoal: value));
  });
}/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorshipPreferencesCopyWith<$Res>? get sponsorshipPreferences {
    if (_self.sponsorshipPreferences == null) {
    return null;
  }

  return $SponsorshipPreferencesCopyWith<$Res>(_self.sponsorshipPreferences!, (value) {
    return _then(_self.copyWith(sponsorshipPreferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [CampaignDetailModel].
extension CampaignDetailModelPatterns on CampaignDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _CampaignDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? owner,  CampaignTitleModel? title,  FinancialGoal? financialGoal,  List<CostBreakdownItem>? costBreakdown,  List<GoalItem>? goals,  List<PreferredSponsor>? preferredSponsors,  SponsorshipPreferences? sponsorshipPreferences,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignDetailModel() when $default != null:
return $default(_that.id,_that.owner,_that.title,_that.financialGoal,_that.costBreakdown,_that.goals,_that.preferredSponsors,_that.sponsorshipPreferences,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? owner,  CampaignTitleModel? title,  FinancialGoal? financialGoal,  List<CostBreakdownItem>? costBreakdown,  List<GoalItem>? goals,  List<PreferredSponsor>? preferredSponsors,  SponsorshipPreferences? sponsorshipPreferences,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CampaignDetailModel():
return $default(_that.id,_that.owner,_that.title,_that.financialGoal,_that.costBreakdown,_that.goals,_that.preferredSponsors,_that.sponsorshipPreferences,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? owner,  CampaignTitleModel? title,  FinancialGoal? financialGoal,  List<CostBreakdownItem>? costBreakdown,  List<GoalItem>? goals,  List<PreferredSponsor>? preferredSponsors,  SponsorshipPreferences? sponsorshipPreferences,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CampaignDetailModel() when $default != null:
return $default(_that.id,_that.owner,_that.title,_that.financialGoal,_that.costBreakdown,_that.goals,_that.preferredSponsors,_that.sponsorshipPreferences,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampaignDetailModel implements CampaignDetailModel {
  const _CampaignDetailModel({@JsonKey(name: '_id') this.id, this.owner, this.title, this.financialGoal, final  List<CostBreakdownItem>? costBreakdown, final  List<GoalItem>? goals, final  List<PreferredSponsor>? preferredSponsors, this.sponsorshipPreferences, this.createdAt, this.updatedAt}): _costBreakdown = costBreakdown,_goals = goals,_preferredSponsors = preferredSponsors;
  factory _CampaignDetailModel.fromJson(Map<String, dynamic> json) => _$CampaignDetailModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? owner;
@override final  CampaignTitleModel? title;
@override final  FinancialGoal? financialGoal;
 final  List<CostBreakdownItem>? _costBreakdown;
@override List<CostBreakdownItem>? get costBreakdown {
  final value = _costBreakdown;
  if (value == null) return null;
  if (_costBreakdown is EqualUnmodifiableListView) return _costBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<GoalItem>? _goals;
@override List<GoalItem>? get goals {
  final value = _goals;
  if (value == null) return null;
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PreferredSponsor>? _preferredSponsors;
@override List<PreferredSponsor>? get preferredSponsors {
  final value = _preferredSponsors;
  if (value == null) return null;
  if (_preferredSponsors is EqualUnmodifiableListView) return _preferredSponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  SponsorshipPreferences? sponsorshipPreferences;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignDetailModelCopyWith<_CampaignDetailModel> get copyWith => __$CampaignDetailModelCopyWithImpl<_CampaignDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampaignDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.title, title) || other.title == title)&&(identical(other.financialGoal, financialGoal) || other.financialGoal == financialGoal)&&const DeepCollectionEquality().equals(other._costBreakdown, _costBreakdown)&&const DeepCollectionEquality().equals(other._goals, _goals)&&const DeepCollectionEquality().equals(other._preferredSponsors, _preferredSponsors)&&(identical(other.sponsorshipPreferences, sponsorshipPreferences) || other.sponsorshipPreferences == sponsorshipPreferences)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,owner,title,financialGoal,const DeepCollectionEquality().hash(_costBreakdown),const DeepCollectionEquality().hash(_goals),const DeepCollectionEquality().hash(_preferredSponsors),sponsorshipPreferences,createdAt,updatedAt);

@override
String toString() {
  return 'CampaignDetailModel(id: $id, owner: $owner, title: $title, financialGoal: $financialGoal, costBreakdown: $costBreakdown, goals: $goals, preferredSponsors: $preferredSponsors, sponsorshipPreferences: $sponsorshipPreferences, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CampaignDetailModelCopyWith<$Res> implements $CampaignDetailModelCopyWith<$Res> {
  factory _$CampaignDetailModelCopyWith(_CampaignDetailModel value, $Res Function(_CampaignDetailModel) _then) = __$CampaignDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? owner, CampaignTitleModel? title, FinancialGoal? financialGoal, List<CostBreakdownItem>? costBreakdown, List<GoalItem>? goals, List<PreferredSponsor>? preferredSponsors, SponsorshipPreferences? sponsorshipPreferences, String? createdAt, String? updatedAt
});


@override $CampaignTitleModelCopyWith<$Res>? get title;@override $FinancialGoalCopyWith<$Res>? get financialGoal;@override $SponsorshipPreferencesCopyWith<$Res>? get sponsorshipPreferences;

}
/// @nodoc
class __$CampaignDetailModelCopyWithImpl<$Res>
    implements _$CampaignDetailModelCopyWith<$Res> {
  __$CampaignDetailModelCopyWithImpl(this._self, this._then);

  final _CampaignDetailModel _self;
  final $Res Function(_CampaignDetailModel) _then;

/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? owner = freezed,Object? title = freezed,Object? financialGoal = freezed,Object? costBreakdown = freezed,Object? goals = freezed,Object? preferredSponsors = freezed,Object? sponsorshipPreferences = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CampaignDetailModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as CampaignTitleModel?,financialGoal: freezed == financialGoal ? _self.financialGoal : financialGoal // ignore: cast_nullable_to_non_nullable
as FinancialGoal?,costBreakdown: freezed == costBreakdown ? _self._costBreakdown : costBreakdown // ignore: cast_nullable_to_non_nullable
as List<CostBreakdownItem>?,goals: freezed == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<GoalItem>?,preferredSponsors: freezed == preferredSponsors ? _self._preferredSponsors : preferredSponsors // ignore: cast_nullable_to_non_nullable
as List<PreferredSponsor>?,sponsorshipPreferences: freezed == sponsorshipPreferences ? _self.sponsorshipPreferences : sponsorshipPreferences // ignore: cast_nullable_to_non_nullable
as SponsorshipPreferences?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CampaignTitleModelCopyWith<$Res>? get title {
    if (_self.title == null) {
    return null;
  }

  return $CampaignTitleModelCopyWith<$Res>(_self.title!, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FinancialGoalCopyWith<$Res>? get financialGoal {
    if (_self.financialGoal == null) {
    return null;
  }

  return $FinancialGoalCopyWith<$Res>(_self.financialGoal!, (value) {
    return _then(_self.copyWith(financialGoal: value));
  });
}/// Create a copy of CampaignDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorshipPreferencesCopyWith<$Res>? get sponsorshipPreferences {
    if (_self.sponsorshipPreferences == null) {
    return null;
  }

  return $SponsorshipPreferencesCopyWith<$Res>(_self.sponsorshipPreferences!, (value) {
    return _then(_self.copyWith(sponsorshipPreferences: value));
  });
}
}


/// @nodoc
mixin _$FinancialGoal {

 double? get totalAmount; String? get deadline;
/// Create a copy of FinancialGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinancialGoalCopyWith<FinancialGoal> get copyWith => _$FinancialGoalCopyWithImpl<FinancialGoal>(this as FinancialGoal, _$identity);

  /// Serializes this FinancialGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinancialGoal&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.deadline, deadline) || other.deadline == deadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAmount,deadline);

@override
String toString() {
  return 'FinancialGoal(totalAmount: $totalAmount, deadline: $deadline)';
}


}

/// @nodoc
abstract mixin class $FinancialGoalCopyWith<$Res>  {
  factory $FinancialGoalCopyWith(FinancialGoal value, $Res Function(FinancialGoal) _then) = _$FinancialGoalCopyWithImpl;
@useResult
$Res call({
 double? totalAmount, String? deadline
});




}
/// @nodoc
class _$FinancialGoalCopyWithImpl<$Res>
    implements $FinancialGoalCopyWith<$Res> {
  _$FinancialGoalCopyWithImpl(this._self, this._then);

  final FinancialGoal _self;
  final $Res Function(FinancialGoal) _then;

/// Create a copy of FinancialGoal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalAmount = freezed,Object? deadline = freezed,}) {
  return _then(_self.copyWith(
totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FinancialGoal].
extension FinancialGoalPatterns on FinancialGoal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinancialGoal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinancialGoal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinancialGoal value)  $default,){
final _that = this;
switch (_that) {
case _FinancialGoal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinancialGoal value)?  $default,){
final _that = this;
switch (_that) {
case _FinancialGoal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? totalAmount,  String? deadline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinancialGoal() when $default != null:
return $default(_that.totalAmount,_that.deadline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? totalAmount,  String? deadline)  $default,) {final _that = this;
switch (_that) {
case _FinancialGoal():
return $default(_that.totalAmount,_that.deadline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? totalAmount,  String? deadline)?  $default,) {final _that = this;
switch (_that) {
case _FinancialGoal() when $default != null:
return $default(_that.totalAmount,_that.deadline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinancialGoal implements FinancialGoal {
  const _FinancialGoal({this.totalAmount, this.deadline});
  factory _FinancialGoal.fromJson(Map<String, dynamic> json) => _$FinancialGoalFromJson(json);

@override final  double? totalAmount;
@override final  String? deadline;

/// Create a copy of FinancialGoal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinancialGoalCopyWith<_FinancialGoal> get copyWith => __$FinancialGoalCopyWithImpl<_FinancialGoal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinancialGoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinancialGoal&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.deadline, deadline) || other.deadline == deadline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalAmount,deadline);

@override
String toString() {
  return 'FinancialGoal(totalAmount: $totalAmount, deadline: $deadline)';
}


}

/// @nodoc
abstract mixin class _$FinancialGoalCopyWith<$Res> implements $FinancialGoalCopyWith<$Res> {
  factory _$FinancialGoalCopyWith(_FinancialGoal value, $Res Function(_FinancialGoal) _then) = __$FinancialGoalCopyWithImpl;
@override @useResult
$Res call({
 double? totalAmount, String? deadline
});




}
/// @nodoc
class __$FinancialGoalCopyWithImpl<$Res>
    implements _$FinancialGoalCopyWith<$Res> {
  __$FinancialGoalCopyWithImpl(this._self, this._then);

  final _FinancialGoal _self;
  final $Res Function(_FinancialGoal) _then;

/// Create a copy of FinancialGoal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalAmount = freezed,Object? deadline = freezed,}) {
  return _then(_FinancialGoal(
totalAmount: freezed == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CostBreakdownItem {

@JsonKey(name: '_id') String? get id; String? get title; double? get amount;
/// Create a copy of CostBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CostBreakdownItemCopyWith<CostBreakdownItem> get copyWith => _$CostBreakdownItemCopyWithImpl<CostBreakdownItem>(this as CostBreakdownItem, _$identity);

  /// Serializes this CostBreakdownItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CostBreakdownItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount);

@override
String toString() {
  return 'CostBreakdownItem(id: $id, title: $title, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $CostBreakdownItemCopyWith<$Res>  {
  factory $CostBreakdownItemCopyWith(CostBreakdownItem value, $Res Function(CostBreakdownItem) _then) = _$CostBreakdownItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, double? amount
});




}
/// @nodoc
class _$CostBreakdownItemCopyWithImpl<$Res>
    implements $CostBreakdownItemCopyWith<$Res> {
  _$CostBreakdownItemCopyWithImpl(this._self, this._then);

  final CostBreakdownItem _self;
  final $Res Function(CostBreakdownItem) _then;

/// Create a copy of CostBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CostBreakdownItem].
extension CostBreakdownItemPatterns on CostBreakdownItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CostBreakdownItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CostBreakdownItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CostBreakdownItem value)  $default,){
final _that = this;
switch (_that) {
case _CostBreakdownItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CostBreakdownItem value)?  $default,){
final _that = this;
switch (_that) {
case _CostBreakdownItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  double? amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CostBreakdownItem() when $default != null:
return $default(_that.id,_that.title,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  double? amount)  $default,) {final _that = this;
switch (_that) {
case _CostBreakdownItem():
return $default(_that.id,_that.title,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? title,  double? amount)?  $default,) {final _that = this;
switch (_that) {
case _CostBreakdownItem() when $default != null:
return $default(_that.id,_that.title,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CostBreakdownItem implements CostBreakdownItem {
  const _CostBreakdownItem({@JsonKey(name: '_id') this.id, this.title, this.amount});
  factory _CostBreakdownItem.fromJson(Map<String, dynamic> json) => _$CostBreakdownItemFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? title;
@override final  double? amount;

/// Create a copy of CostBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CostBreakdownItemCopyWith<_CostBreakdownItem> get copyWith => __$CostBreakdownItemCopyWithImpl<_CostBreakdownItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CostBreakdownItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CostBreakdownItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,amount);

@override
String toString() {
  return 'CostBreakdownItem(id: $id, title: $title, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$CostBreakdownItemCopyWith<$Res> implements $CostBreakdownItemCopyWith<$Res> {
  factory _$CostBreakdownItemCopyWith(_CostBreakdownItem value, $Res Function(_CostBreakdownItem) _then) = __$CostBreakdownItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, double? amount
});




}
/// @nodoc
class __$CostBreakdownItemCopyWithImpl<$Res>
    implements _$CostBreakdownItemCopyWith<$Res> {
  __$CostBreakdownItemCopyWithImpl(this._self, this._then);

  final _CostBreakdownItem _self;
  final $Res Function(_CostBreakdownItem) _then;

/// Create a copy of CostBreakdownItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? amount = freezed,}) {
  return _then(_CostBreakdownItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$GoalItem {

@JsonKey(name: '_id') String? get id; String? get title; String? get targetDate; String? get status;
/// Create a copy of GoalItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalItemCopyWith<GoalItem> get copyWith => _$GoalItemCopyWithImpl<GoalItem>(this as GoalItem, _$identity);

  /// Serializes this GoalItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoalItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,targetDate,status);

@override
String toString() {
  return 'GoalItem(id: $id, title: $title, targetDate: $targetDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $GoalItemCopyWith<$Res>  {
  factory $GoalItemCopyWith(GoalItem value, $Res Function(GoalItem) _then) = _$GoalItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? targetDate, String? status
});




}
/// @nodoc
class _$GoalItemCopyWithImpl<$Res>
    implements $GoalItemCopyWith<$Res> {
  _$GoalItemCopyWithImpl(this._self, this._then);

  final GoalItem _self;
  final $Res Function(GoalItem) _then;

/// Create a copy of GoalItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? targetDate = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoalItem].
extension GoalItemPatterns on GoalItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoalItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoalItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoalItem value)  $default,){
final _that = this;
switch (_that) {
case _GoalItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoalItem value)?  $default,){
final _that = this;
switch (_that) {
case _GoalItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? targetDate,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoalItem() when $default != null:
return $default(_that.id,_that.title,_that.targetDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? targetDate,  String? status)  $default,) {final _that = this;
switch (_that) {
case _GoalItem():
return $default(_that.id,_that.title,_that.targetDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? title,  String? targetDate,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _GoalItem() when $default != null:
return $default(_that.id,_that.title,_that.targetDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoalItem implements GoalItem {
  const _GoalItem({@JsonKey(name: '_id') this.id, this.title, this.targetDate, this.status});
  factory _GoalItem.fromJson(Map<String, dynamic> json) => _$GoalItemFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? title;
@override final  String? targetDate;
@override final  String? status;

/// Create a copy of GoalItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalItemCopyWith<_GoalItem> get copyWith => __$GoalItemCopyWithImpl<_GoalItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoalItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.targetDate, targetDate) || other.targetDate == targetDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,targetDate,status);

@override
String toString() {
  return 'GoalItem(id: $id, title: $title, targetDate: $targetDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$GoalItemCopyWith<$Res> implements $GoalItemCopyWith<$Res> {
  factory _$GoalItemCopyWith(_GoalItem value, $Res Function(_GoalItem) _then) = __$GoalItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? targetDate, String? status
});




}
/// @nodoc
class __$GoalItemCopyWithImpl<$Res>
    implements _$GoalItemCopyWith<$Res> {
  __$GoalItemCopyWithImpl(this._self, this._then);

  final _GoalItem _self;
  final $Res Function(_GoalItem) _then;

/// Create a copy of GoalItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? targetDate = freezed,Object? status = freezed,}) {
  return _then(_GoalItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,targetDate: freezed == targetDate ? _self.targetDate : targetDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PreferredSponsor {

@JsonKey(name: '_id') String? get id; String? get email; String? get role;
/// Create a copy of PreferredSponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferredSponsorCopyWith<PreferredSponsor> get copyWith => _$PreferredSponsorCopyWithImpl<PreferredSponsor>(this as PreferredSponsor, _$identity);

  /// Serializes this PreferredSponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferredSponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role);

@override
String toString() {
  return 'PreferredSponsor(id: $id, email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class $PreferredSponsorCopyWith<$Res>  {
  factory $PreferredSponsorCopyWith(PreferredSponsor value, $Res Function(PreferredSponsor) _then) = _$PreferredSponsorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? email, String? role
});




}
/// @nodoc
class _$PreferredSponsorCopyWithImpl<$Res>
    implements $PreferredSponsorCopyWith<$Res> {
  _$PreferredSponsorCopyWithImpl(this._self, this._then);

  final PreferredSponsor _self;
  final $Res Function(PreferredSponsor) _then;

/// Create a copy of PreferredSponsor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? role = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferredSponsor].
extension PreferredSponsorPatterns on PreferredSponsor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferredSponsor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferredSponsor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferredSponsor value)  $default,){
final _that = this;
switch (_that) {
case _PreferredSponsor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferredSponsor value)?  $default,){
final _that = this;
switch (_that) {
case _PreferredSponsor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? email,  String? role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferredSponsor() when $default != null:
return $default(_that.id,_that.email,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? email,  String? role)  $default,) {final _that = this;
switch (_that) {
case _PreferredSponsor():
return $default(_that.id,_that.email,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? email,  String? role)?  $default,) {final _that = this;
switch (_that) {
case _PreferredSponsor() when $default != null:
return $default(_that.id,_that.email,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreferredSponsor implements PreferredSponsor {
  const _PreferredSponsor({@JsonKey(name: '_id') this.id, this.email, this.role});
  factory _PreferredSponsor.fromJson(Map<String, dynamic> json) => _$PreferredSponsorFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? email;
@override final  String? role;

/// Create a copy of PreferredSponsor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferredSponsorCopyWith<_PreferredSponsor> get copyWith => __$PreferredSponsorCopyWithImpl<_PreferredSponsor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreferredSponsorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferredSponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role);

@override
String toString() {
  return 'PreferredSponsor(id: $id, email: $email, role: $role)';
}


}

/// @nodoc
abstract mixin class _$PreferredSponsorCopyWith<$Res> implements $PreferredSponsorCopyWith<$Res> {
  factory _$PreferredSponsorCopyWith(_PreferredSponsor value, $Res Function(_PreferredSponsor) _then) = __$PreferredSponsorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? email, String? role
});




}
/// @nodoc
class __$PreferredSponsorCopyWithImpl<$Res>
    implements _$PreferredSponsorCopyWith<$Res> {
  __$PreferredSponsorCopyWithImpl(this._self, this._then);

  final _PreferredSponsor _self;
  final $Res Function(_PreferredSponsor) _then;

/// Create a copy of PreferredSponsor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? role = freezed,}) {
  return _then(_PreferredSponsor(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SponsorshipPreferences {

 bool? get socialMedia; bool? get eventAppearance; bool? get contentCreation; bool? get productEndorsement; bool? get speech; bool? get workshop; SponsorshipOtherPreference? get other;
/// Create a copy of SponsorshipPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorshipPreferencesCopyWith<SponsorshipPreferences> get copyWith => _$SponsorshipPreferencesCopyWithImpl<SponsorshipPreferences>(this as SponsorshipPreferences, _$identity);

  /// Serializes this SponsorshipPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorshipPreferences&&(identical(other.socialMedia, socialMedia) || other.socialMedia == socialMedia)&&(identical(other.eventAppearance, eventAppearance) || other.eventAppearance == eventAppearance)&&(identical(other.contentCreation, contentCreation) || other.contentCreation == contentCreation)&&(identical(other.productEndorsement, productEndorsement) || other.productEndorsement == productEndorsement)&&(identical(other.speech, speech) || other.speech == speech)&&(identical(other.workshop, workshop) || other.workshop == workshop)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,socialMedia,eventAppearance,contentCreation,productEndorsement,speech,workshop,other);

@override
String toString() {
  return 'SponsorshipPreferences(socialMedia: $socialMedia, eventAppearance: $eventAppearance, contentCreation: $contentCreation, productEndorsement: $productEndorsement, speech: $speech, workshop: $workshop, other: $other)';
}


}

/// @nodoc
abstract mixin class $SponsorshipPreferencesCopyWith<$Res>  {
  factory $SponsorshipPreferencesCopyWith(SponsorshipPreferences value, $Res Function(SponsorshipPreferences) _then) = _$SponsorshipPreferencesCopyWithImpl;
@useResult
$Res call({
 bool? socialMedia, bool? eventAppearance, bool? contentCreation, bool? productEndorsement, bool? speech, bool? workshop, SponsorshipOtherPreference? other
});


$SponsorshipOtherPreferenceCopyWith<$Res>? get other;

}
/// @nodoc
class _$SponsorshipPreferencesCopyWithImpl<$Res>
    implements $SponsorshipPreferencesCopyWith<$Res> {
  _$SponsorshipPreferencesCopyWithImpl(this._self, this._then);

  final SponsorshipPreferences _self;
  final $Res Function(SponsorshipPreferences) _then;

/// Create a copy of SponsorshipPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? socialMedia = freezed,Object? eventAppearance = freezed,Object? contentCreation = freezed,Object? productEndorsement = freezed,Object? speech = freezed,Object? workshop = freezed,Object? other = freezed,}) {
  return _then(_self.copyWith(
socialMedia: freezed == socialMedia ? _self.socialMedia : socialMedia // ignore: cast_nullable_to_non_nullable
as bool?,eventAppearance: freezed == eventAppearance ? _self.eventAppearance : eventAppearance // ignore: cast_nullable_to_non_nullable
as bool?,contentCreation: freezed == contentCreation ? _self.contentCreation : contentCreation // ignore: cast_nullable_to_non_nullable
as bool?,productEndorsement: freezed == productEndorsement ? _self.productEndorsement : productEndorsement // ignore: cast_nullable_to_non_nullable
as bool?,speech: freezed == speech ? _self.speech : speech // ignore: cast_nullable_to_non_nullable
as bool?,workshop: freezed == workshop ? _self.workshop : workshop // ignore: cast_nullable_to_non_nullable
as bool?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as SponsorshipOtherPreference?,
  ));
}
/// Create a copy of SponsorshipPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorshipOtherPreferenceCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $SponsorshipOtherPreferenceCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorshipPreferences].
extension SponsorshipPreferencesPatterns on SponsorshipPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorshipPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorshipPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorshipPreferences value)  $default,){
final _that = this;
switch (_that) {
case _SponsorshipPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorshipPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorshipPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? socialMedia,  bool? eventAppearance,  bool? contentCreation,  bool? productEndorsement,  bool? speech,  bool? workshop,  SponsorshipOtherPreference? other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorshipPreferences() when $default != null:
return $default(_that.socialMedia,_that.eventAppearance,_that.contentCreation,_that.productEndorsement,_that.speech,_that.workshop,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? socialMedia,  bool? eventAppearance,  bool? contentCreation,  bool? productEndorsement,  bool? speech,  bool? workshop,  SponsorshipOtherPreference? other)  $default,) {final _that = this;
switch (_that) {
case _SponsorshipPreferences():
return $default(_that.socialMedia,_that.eventAppearance,_that.contentCreation,_that.productEndorsement,_that.speech,_that.workshop,_that.other);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? socialMedia,  bool? eventAppearance,  bool? contentCreation,  bool? productEndorsement,  bool? speech,  bool? workshop,  SponsorshipOtherPreference? other)?  $default,) {final _that = this;
switch (_that) {
case _SponsorshipPreferences() when $default != null:
return $default(_that.socialMedia,_that.eventAppearance,_that.contentCreation,_that.productEndorsement,_that.speech,_that.workshop,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorshipPreferences implements SponsorshipPreferences {
  const _SponsorshipPreferences({this.socialMedia, this.eventAppearance, this.contentCreation, this.productEndorsement, this.speech, this.workshop, this.other});
  factory _SponsorshipPreferences.fromJson(Map<String, dynamic> json) => _$SponsorshipPreferencesFromJson(json);

@override final  bool? socialMedia;
@override final  bool? eventAppearance;
@override final  bool? contentCreation;
@override final  bool? productEndorsement;
@override final  bool? speech;
@override final  bool? workshop;
@override final  SponsorshipOtherPreference? other;

/// Create a copy of SponsorshipPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorshipPreferencesCopyWith<_SponsorshipPreferences> get copyWith => __$SponsorshipPreferencesCopyWithImpl<_SponsorshipPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorshipPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorshipPreferences&&(identical(other.socialMedia, socialMedia) || other.socialMedia == socialMedia)&&(identical(other.eventAppearance, eventAppearance) || other.eventAppearance == eventAppearance)&&(identical(other.contentCreation, contentCreation) || other.contentCreation == contentCreation)&&(identical(other.productEndorsement, productEndorsement) || other.productEndorsement == productEndorsement)&&(identical(other.speech, speech) || other.speech == speech)&&(identical(other.workshop, workshop) || other.workshop == workshop)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,socialMedia,eventAppearance,contentCreation,productEndorsement,speech,workshop,other);

@override
String toString() {
  return 'SponsorshipPreferences(socialMedia: $socialMedia, eventAppearance: $eventAppearance, contentCreation: $contentCreation, productEndorsement: $productEndorsement, speech: $speech, workshop: $workshop, other: $other)';
}


}

/// @nodoc
abstract mixin class _$SponsorshipPreferencesCopyWith<$Res> implements $SponsorshipPreferencesCopyWith<$Res> {
  factory _$SponsorshipPreferencesCopyWith(_SponsorshipPreferences value, $Res Function(_SponsorshipPreferences) _then) = __$SponsorshipPreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool? socialMedia, bool? eventAppearance, bool? contentCreation, bool? productEndorsement, bool? speech, bool? workshop, SponsorshipOtherPreference? other
});


@override $SponsorshipOtherPreferenceCopyWith<$Res>? get other;

}
/// @nodoc
class __$SponsorshipPreferencesCopyWithImpl<$Res>
    implements _$SponsorshipPreferencesCopyWith<$Res> {
  __$SponsorshipPreferencesCopyWithImpl(this._self, this._then);

  final _SponsorshipPreferences _self;
  final $Res Function(_SponsorshipPreferences) _then;

/// Create a copy of SponsorshipPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? socialMedia = freezed,Object? eventAppearance = freezed,Object? contentCreation = freezed,Object? productEndorsement = freezed,Object? speech = freezed,Object? workshop = freezed,Object? other = freezed,}) {
  return _then(_SponsorshipPreferences(
socialMedia: freezed == socialMedia ? _self.socialMedia : socialMedia // ignore: cast_nullable_to_non_nullable
as bool?,eventAppearance: freezed == eventAppearance ? _self.eventAppearance : eventAppearance // ignore: cast_nullable_to_non_nullable
as bool?,contentCreation: freezed == contentCreation ? _self.contentCreation : contentCreation // ignore: cast_nullable_to_non_nullable
as bool?,productEndorsement: freezed == productEndorsement ? _self.productEndorsement : productEndorsement // ignore: cast_nullable_to_non_nullable
as bool?,speech: freezed == speech ? _self.speech : speech // ignore: cast_nullable_to_non_nullable
as bool?,workshop: freezed == workshop ? _self.workshop : workshop // ignore: cast_nullable_to_non_nullable
as bool?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as SponsorshipOtherPreference?,
  ));
}

/// Create a copy of SponsorshipPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorshipOtherPreferenceCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $SponsorshipOtherPreferenceCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// @nodoc
mixin _$SponsorshipOtherPreference {

 bool? get enabled; String? get description;
/// Create a copy of SponsorshipOtherPreference
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorshipOtherPreferenceCopyWith<SponsorshipOtherPreference> get copyWith => _$SponsorshipOtherPreferenceCopyWithImpl<SponsorshipOtherPreference>(this as SponsorshipOtherPreference, _$identity);

  /// Serializes this SponsorshipOtherPreference to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorshipOtherPreference&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,description);

@override
String toString() {
  return 'SponsorshipOtherPreference(enabled: $enabled, description: $description)';
}


}

/// @nodoc
abstract mixin class $SponsorshipOtherPreferenceCopyWith<$Res>  {
  factory $SponsorshipOtherPreferenceCopyWith(SponsorshipOtherPreference value, $Res Function(SponsorshipOtherPreference) _then) = _$SponsorshipOtherPreferenceCopyWithImpl;
@useResult
$Res call({
 bool? enabled, String? description
});




}
/// @nodoc
class _$SponsorshipOtherPreferenceCopyWithImpl<$Res>
    implements $SponsorshipOtherPreferenceCopyWith<$Res> {
  _$SponsorshipOtherPreferenceCopyWithImpl(this._self, this._then);

  final SponsorshipOtherPreference _self;
  final $Res Function(SponsorshipOtherPreference) _then;

/// Create a copy of SponsorshipOtherPreference
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorshipOtherPreference].
extension SponsorshipOtherPreferencePatterns on SponsorshipOtherPreference {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorshipOtherPreference value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorshipOtherPreference() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorshipOtherPreference value)  $default,){
final _that = this;
switch (_that) {
case _SponsorshipOtherPreference():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorshipOtherPreference value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorshipOtherPreference() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? enabled,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorshipOtherPreference() when $default != null:
return $default(_that.enabled,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? enabled,  String? description)  $default,) {final _that = this;
switch (_that) {
case _SponsorshipOtherPreference():
return $default(_that.enabled,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? enabled,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _SponsorshipOtherPreference() when $default != null:
return $default(_that.enabled,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorshipOtherPreference implements SponsorshipOtherPreference {
  const _SponsorshipOtherPreference({this.enabled, this.description});
  factory _SponsorshipOtherPreference.fromJson(Map<String, dynamic> json) => _$SponsorshipOtherPreferenceFromJson(json);

@override final  bool? enabled;
@override final  String? description;

/// Create a copy of SponsorshipOtherPreference
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorshipOtherPreferenceCopyWith<_SponsorshipOtherPreference> get copyWith => __$SponsorshipOtherPreferenceCopyWithImpl<_SponsorshipOtherPreference>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorshipOtherPreferenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorshipOtherPreference&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,description);

@override
String toString() {
  return 'SponsorshipOtherPreference(enabled: $enabled, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SponsorshipOtherPreferenceCopyWith<$Res> implements $SponsorshipOtherPreferenceCopyWith<$Res> {
  factory _$SponsorshipOtherPreferenceCopyWith(_SponsorshipOtherPreference value, $Res Function(_SponsorshipOtherPreference) _then) = __$SponsorshipOtherPreferenceCopyWithImpl;
@override @useResult
$Res call({
 bool? enabled, String? description
});




}
/// @nodoc
class __$SponsorshipOtherPreferenceCopyWithImpl<$Res>
    implements _$SponsorshipOtherPreferenceCopyWith<$Res> {
  __$SponsorshipOtherPreferenceCopyWithImpl(this._self, this._then);

  final _SponsorshipOtherPreference _self;
  final $Res Function(_SponsorshipOtherPreference) _then;

/// Create a copy of SponsorshipOtherPreference
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = freezed,Object? description = freezed,}) {
  return _then(_SponsorshipOtherPreference(
enabled: freezed == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
