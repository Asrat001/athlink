// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SportCategory {

@JsonKey(name: '_id') String? get id; String? get name;
/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<SportCategory> get copyWith => _$SportCategoryCopyWithImpl<SportCategory>(this as SportCategory, _$identity);

  /// Serializes this SportCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SportCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SportCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SportCategoryCopyWith<$Res>  {
  factory $SportCategoryCopyWith(SportCategory value, $Res Function(SportCategory) _then) = _$SportCategoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name
});




}
/// @nodoc
class _$SportCategoryCopyWithImpl<$Res>
    implements $SportCategoryCopyWith<$Res> {
  _$SportCategoryCopyWithImpl(this._self, this._then);

  final SportCategory _self;
  final $Res Function(SportCategory) _then;

/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SportCategory].
extension SportCategoryPatterns on SportCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SportCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SportCategory value)  $default,){
final _that = this;
switch (_that) {
case _SportCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SportCategory value)?  $default,){
final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _SportCategory():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _SportCategory() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SportCategory implements SportCategory {
  const _SportCategory({@JsonKey(name: '_id') this.id, this.name});
  factory _SportCategory.fromJson(Map<String, dynamic> json) => _$SportCategoryFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? name;

/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportCategoryCopyWith<_SportCategory> get copyWith => __$SportCategoryCopyWithImpl<_SportCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SportCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SportCategory(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SportCategoryCopyWith<$Res> implements $SportCategoryCopyWith<$Res> {
  factory _$SportCategoryCopyWith(_SportCategory value, $Res Function(_SportCategory) _then) = __$SportCategoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name
});




}
/// @nodoc
class __$SportCategoryCopyWithImpl<$Res>
    implements _$SportCategoryCopyWith<$Res> {
  __$SportCategoryCopyWithImpl(this._self, this._then);

  final _SportCategory _self;
  final $Res Function(_SportCategory) _then;

/// Create a copy of SportCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_SportCategory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Sport {

@JsonKey(name: '_id') String? get id; String? get name; SportCategory? get categoryId; String? get icon;
/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportCopyWith<Sport> get copyWith => _$SportCopyWithImpl<Sport>(this as Sport, _$identity);

  /// Serializes this Sport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,icon);

@override
String toString() {
  return 'Sport(id: $id, name: $name, categoryId: $categoryId, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $SportCopyWith<$Res>  {
  factory $SportCopyWith(Sport value, $Res Function(Sport) _then) = _$SportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, SportCategory? categoryId, String? icon
});


$SportCategoryCopyWith<$Res>? get categoryId;

}
/// @nodoc
class _$SportCopyWithImpl<$Res>
    implements $SportCopyWith<$Res> {
  _$SportCopyWithImpl(this._self, this._then);

  final Sport _self;
  final $Res Function(Sport) _then;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? categoryId = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as SportCategory?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<$Res>? get categoryId {
    if (_self.categoryId == null) {
    return null;
  }

  return $SportCategoryCopyWith<$Res>(_self.categoryId!, (value) {
    return _then(_self.copyWith(categoryId: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sport].
extension SportPatterns on Sport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sport value)  $default,){
final _that = this;
switch (_that) {
case _Sport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sport value)?  $default,){
final _that = this;
switch (_that) {
case _Sport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  SportCategory? categoryId,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sport() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  SportCategory? categoryId,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _Sport():
return $default(_that.id,_that.name,_that.categoryId,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? name,  SportCategory? categoryId,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _Sport() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sport implements Sport {
  const _Sport({@JsonKey(name: '_id') this.id, this.name, this.categoryId, this.icon});
  factory _Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? name;
@override final  SportCategory? categoryId;
@override final  String? icon;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SportCopyWith<_Sport> get copyWith => __$SportCopyWithImpl<_Sport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,icon);

@override
String toString() {
  return 'Sport(id: $id, name: $name, categoryId: $categoryId, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$SportCopyWith<$Res> implements $SportCopyWith<$Res> {
  factory _$SportCopyWith(_Sport value, $Res Function(_Sport) _then) = __$SportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, SportCategory? categoryId, String? icon
});


@override $SportCategoryCopyWith<$Res>? get categoryId;

}
/// @nodoc
class __$SportCopyWithImpl<$Res>
    implements _$SportCopyWith<$Res> {
  __$SportCopyWithImpl(this._self, this._then);

  final _Sport _self;
  final $Res Function(_Sport) _then;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? categoryId = freezed,Object? icon = freezed,}) {
  return _then(_Sport(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as SportCategory?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<$Res>? get categoryId {
    if (_self.categoryId == null) {
    return null;
  }

  return $SportCategoryCopyWith<$Res>(_self.categoryId!, (value) {
    return _then(_self.copyWith(categoryId: value));
  });
}
}


/// @nodoc
mixin _$SponsorStats {

 int get sponsorshipCampaigns; int get athletesSponsored; int get globalPartners;
/// Create a copy of SponsorStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorStatsCopyWith<SponsorStats> get copyWith => _$SponsorStatsCopyWithImpl<SponsorStats>(this as SponsorStats, _$identity);

  /// Serializes this SponsorStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorStats&&(identical(other.sponsorshipCampaigns, sponsorshipCampaigns) || other.sponsorshipCampaigns == sponsorshipCampaigns)&&(identical(other.athletesSponsored, athletesSponsored) || other.athletesSponsored == athletesSponsored)&&(identical(other.globalPartners, globalPartners) || other.globalPartners == globalPartners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsorshipCampaigns,athletesSponsored,globalPartners);

@override
String toString() {
  return 'SponsorStats(sponsorshipCampaigns: $sponsorshipCampaigns, athletesSponsored: $athletesSponsored, globalPartners: $globalPartners)';
}


}

/// @nodoc
abstract mixin class $SponsorStatsCopyWith<$Res>  {
  factory $SponsorStatsCopyWith(SponsorStats value, $Res Function(SponsorStats) _then) = _$SponsorStatsCopyWithImpl;
@useResult
$Res call({
 int sponsorshipCampaigns, int athletesSponsored, int globalPartners
});




}
/// @nodoc
class _$SponsorStatsCopyWithImpl<$Res>
    implements $SponsorStatsCopyWith<$Res> {
  _$SponsorStatsCopyWithImpl(this._self, this._then);

  final SponsorStats _self;
  final $Res Function(SponsorStats) _then;

/// Create a copy of SponsorStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sponsorshipCampaigns = null,Object? athletesSponsored = null,Object? globalPartners = null,}) {
  return _then(_self.copyWith(
sponsorshipCampaigns: null == sponsorshipCampaigns ? _self.sponsorshipCampaigns : sponsorshipCampaigns // ignore: cast_nullable_to_non_nullable
as int,athletesSponsored: null == athletesSponsored ? _self.athletesSponsored : athletesSponsored // ignore: cast_nullable_to_non_nullable
as int,globalPartners: null == globalPartners ? _self.globalPartners : globalPartners // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SponsorStats].
extension SponsorStatsPatterns on SponsorStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorStats value)  $default,){
final _that = this;
switch (_that) {
case _SponsorStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorStats value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sponsorshipCampaigns,  int athletesSponsored,  int globalPartners)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorStats() when $default != null:
return $default(_that.sponsorshipCampaigns,_that.athletesSponsored,_that.globalPartners);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sponsorshipCampaigns,  int athletesSponsored,  int globalPartners)  $default,) {final _that = this;
switch (_that) {
case _SponsorStats():
return $default(_that.sponsorshipCampaigns,_that.athletesSponsored,_that.globalPartners);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sponsorshipCampaigns,  int athletesSponsored,  int globalPartners)?  $default,) {final _that = this;
switch (_that) {
case _SponsorStats() when $default != null:
return $default(_that.sponsorshipCampaigns,_that.athletesSponsored,_that.globalPartners);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorStats implements SponsorStats {
  const _SponsorStats({this.sponsorshipCampaigns = 0, this.athletesSponsored = 0, this.globalPartners = 0});
  factory _SponsorStats.fromJson(Map<String, dynamic> json) => _$SponsorStatsFromJson(json);

@override@JsonKey() final  int sponsorshipCampaigns;
@override@JsonKey() final  int athletesSponsored;
@override@JsonKey() final  int globalPartners;

/// Create a copy of SponsorStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorStatsCopyWith<_SponsorStats> get copyWith => __$SponsorStatsCopyWithImpl<_SponsorStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorStats&&(identical(other.sponsorshipCampaigns, sponsorshipCampaigns) || other.sponsorshipCampaigns == sponsorshipCampaigns)&&(identical(other.athletesSponsored, athletesSponsored) || other.athletesSponsored == athletesSponsored)&&(identical(other.globalPartners, globalPartners) || other.globalPartners == globalPartners));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsorshipCampaigns,athletesSponsored,globalPartners);

@override
String toString() {
  return 'SponsorStats(sponsorshipCampaigns: $sponsorshipCampaigns, athletesSponsored: $athletesSponsored, globalPartners: $globalPartners)';
}


}

/// @nodoc
abstract mixin class _$SponsorStatsCopyWith<$Res> implements $SponsorStatsCopyWith<$Res> {
  factory _$SponsorStatsCopyWith(_SponsorStats value, $Res Function(_SponsorStats) _then) = __$SponsorStatsCopyWithImpl;
@override @useResult
$Res call({
 int sponsorshipCampaigns, int athletesSponsored, int globalPartners
});




}
/// @nodoc
class __$SponsorStatsCopyWithImpl<$Res>
    implements _$SponsorStatsCopyWith<$Res> {
  __$SponsorStatsCopyWithImpl(this._self, this._then);

  final _SponsorStats _self;
  final $Res Function(_SponsorStats) _then;

/// Create a copy of SponsorStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sponsorshipCampaigns = null,Object? athletesSponsored = null,Object? globalPartners = null,}) {
  return _then(_SponsorStats(
sponsorshipCampaigns: null == sponsorshipCampaigns ? _self.sponsorshipCampaigns : sponsorshipCampaigns // ignore: cast_nullable_to_non_nullable
as int,athletesSponsored: null == athletesSponsored ? _self.athletesSponsored : athletesSponsored // ignore: cast_nullable_to_non_nullable
as int,globalPartners: null == globalPartners ? _self.globalPartners : globalPartners // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SponsorProfile {

 SponsorStats? get stats; String? get name; String? get profileImageUrl; String? get bannerImageUrl; List<dynamic> get jobPosts;
/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorProfileCopyWith<SponsorProfile> get copyWith => _$SponsorProfileCopyWithImpl<SponsorProfile>(this as SponsorProfile, _$identity);

  /// Serializes this SponsorProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorProfile&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&const DeepCollectionEquality().equals(other.jobPosts, jobPosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stats,name,profileImageUrl,bannerImageUrl,const DeepCollectionEquality().hash(jobPosts));

@override
String toString() {
  return 'SponsorProfile(stats: $stats, name: $name, profileImageUrl: $profileImageUrl, bannerImageUrl: $bannerImageUrl, jobPosts: $jobPosts)';
}


}

/// @nodoc
abstract mixin class $SponsorProfileCopyWith<$Res>  {
  factory $SponsorProfileCopyWith(SponsorProfile value, $Res Function(SponsorProfile) _then) = _$SponsorProfileCopyWithImpl;
@useResult
$Res call({
 SponsorStats? stats, String? name, String? profileImageUrl, String? bannerImageUrl, List<dynamic> jobPosts
});


$SponsorStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class _$SponsorProfileCopyWithImpl<$Res>
    implements $SponsorProfileCopyWith<$Res> {
  _$SponsorProfileCopyWithImpl(this._self, this._then);

  final SponsorProfile _self;
  final $Res Function(SponsorProfile) _then;

/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stats = freezed,Object? name = freezed,Object? profileImageUrl = freezed,Object? bannerImageUrl = freezed,Object? jobPosts = null,}) {
  return _then(_self.copyWith(
stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as SponsorStats?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerImageUrl: freezed == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,jobPosts: null == jobPosts ? _self.jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}
/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $SponsorStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorProfile].
extension SponsorProfilePatterns on SponsorProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorProfile value)  $default,){
final _that = this;
switch (_that) {
case _SponsorProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorProfile value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SponsorStats? stats,  String? name,  String? profileImageUrl,  String? bannerImageUrl,  List<dynamic> jobPosts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
return $default(_that.stats,_that.name,_that.profileImageUrl,_that.bannerImageUrl,_that.jobPosts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SponsorStats? stats,  String? name,  String? profileImageUrl,  String? bannerImageUrl,  List<dynamic> jobPosts)  $default,) {final _that = this;
switch (_that) {
case _SponsorProfile():
return $default(_that.stats,_that.name,_that.profileImageUrl,_that.bannerImageUrl,_that.jobPosts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SponsorStats? stats,  String? name,  String? profileImageUrl,  String? bannerImageUrl,  List<dynamic> jobPosts)?  $default,) {final _that = this;
switch (_that) {
case _SponsorProfile() when $default != null:
return $default(_that.stats,_that.name,_that.profileImageUrl,_that.bannerImageUrl,_that.jobPosts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorProfile implements SponsorProfile {
  const _SponsorProfile({this.stats, this.name, this.profileImageUrl, this.bannerImageUrl, final  List<dynamic> jobPosts = const []}): _jobPosts = jobPosts;
  factory _SponsorProfile.fromJson(Map<String, dynamic> json) => _$SponsorProfileFromJson(json);

@override final  SponsorStats? stats;
@override final  String? name;
@override final  String? profileImageUrl;
@override final  String? bannerImageUrl;
 final  List<dynamic> _jobPosts;
@override@JsonKey() List<dynamic> get jobPosts {
  if (_jobPosts is EqualUnmodifiableListView) return _jobPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobPosts);
}


/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorProfileCopyWith<_SponsorProfile> get copyWith => __$SponsorProfileCopyWithImpl<_SponsorProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorProfile&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.bannerImageUrl, bannerImageUrl) || other.bannerImageUrl == bannerImageUrl)&&const DeepCollectionEquality().equals(other._jobPosts, _jobPosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stats,name,profileImageUrl,bannerImageUrl,const DeepCollectionEquality().hash(_jobPosts));

@override
String toString() {
  return 'SponsorProfile(stats: $stats, name: $name, profileImageUrl: $profileImageUrl, bannerImageUrl: $bannerImageUrl, jobPosts: $jobPosts)';
}


}

/// @nodoc
abstract mixin class _$SponsorProfileCopyWith<$Res> implements $SponsorProfileCopyWith<$Res> {
  factory _$SponsorProfileCopyWith(_SponsorProfile value, $Res Function(_SponsorProfile) _then) = __$SponsorProfileCopyWithImpl;
@override @useResult
$Res call({
 SponsorStats? stats, String? name, String? profileImageUrl, String? bannerImageUrl, List<dynamic> jobPosts
});


@override $SponsorStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class __$SponsorProfileCopyWithImpl<$Res>
    implements _$SponsorProfileCopyWith<$Res> {
  __$SponsorProfileCopyWithImpl(this._self, this._then);

  final _SponsorProfile _self;
  final $Res Function(_SponsorProfile) _then;

/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stats = freezed,Object? name = freezed,Object? profileImageUrl = freezed,Object? bannerImageUrl = freezed,Object? jobPosts = null,}) {
  return _then(_SponsorProfile(
stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as SponsorStats?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerImageUrl: freezed == bannerImageUrl ? _self.bannerImageUrl : bannerImageUrl // ignore: cast_nullable_to_non_nullable
as String?,jobPosts: null == jobPosts ? _self._jobPosts : jobPosts // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

/// Create a copy of SponsorProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $SponsorStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$Sponsor {

@JsonKey(name: '_id') String? get id; String? get email; String? get name; SponsorProfile? get sponsorProfile; List<Sport> get sport;
/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorCopyWith<Sponsor> get copyWith => _$SponsorCopyWithImpl<Sponsor>(this as Sponsor, _$identity);

  /// Serializes this Sponsor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile)&&const DeepCollectionEquality().equals(other.sport, sport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,sponsorProfile,const DeepCollectionEquality().hash(sport));

@override
String toString() {
  return 'Sponsor(id: $id, email: $email, name: $name, sponsorProfile: $sponsorProfile, sport: $sport)';
}


}

/// @nodoc
abstract mixin class $SponsorCopyWith<$Res>  {
  factory $SponsorCopyWith(Sponsor value, $Res Function(Sponsor) _then) = _$SponsorCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? email, String? name, SponsorProfile? sponsorProfile, List<Sport> sport
});


$SponsorProfileCopyWith<$Res>? get sponsorProfile;

}
/// @nodoc
class _$SponsorCopyWithImpl<$Res>
    implements $SponsorCopyWith<$Res> {
  _$SponsorCopyWithImpl(this._self, this._then);

  final Sponsor _self;
  final $Res Function(Sponsor) _then;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? sponsorProfile = freezed,Object? sport = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sponsorProfile: freezed == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as SponsorProfile?,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as List<Sport>,
  ));
}
/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorProfileCopyWith<$Res>? get sponsorProfile {
    if (_self.sponsorProfile == null) {
    return null;
  }

  return $SponsorProfileCopyWith<$Res>(_self.sponsorProfile!, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [Sponsor].
extension SponsorPatterns on Sponsor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sponsor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sponsor value)  $default,){
final _that = this;
switch (_that) {
case _Sponsor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sponsor value)?  $default,){
final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? email,  String? name,  SponsorProfile? sponsorProfile,  List<Sport> sport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.sponsorProfile,_that.sport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? email,  String? name,  SponsorProfile? sponsorProfile,  List<Sport> sport)  $default,) {final _that = this;
switch (_that) {
case _Sponsor():
return $default(_that.id,_that.email,_that.name,_that.sponsorProfile,_that.sport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? email,  String? name,  SponsorProfile? sponsorProfile,  List<Sport> sport)?  $default,) {final _that = this;
switch (_that) {
case _Sponsor() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.sponsorProfile,_that.sport);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sponsor implements Sponsor {
  const _Sponsor({@JsonKey(name: '_id') this.id, this.email, this.name, this.sponsorProfile, final  List<Sport> sport = const []}): _sport = sport;
  factory _Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? email;
@override final  String? name;
@override final  SponsorProfile? sponsorProfile;
 final  List<Sport> _sport;
@override@JsonKey() List<Sport> get sport {
  if (_sport is EqualUnmodifiableListView) return _sport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sport);
}


/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorCopyWith<_Sponsor> get copyWith => __$SponsorCopyWithImpl<_Sponsor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sponsor&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.sponsorProfile, sponsorProfile) || other.sponsorProfile == sponsorProfile)&&const DeepCollectionEquality().equals(other._sport, _sport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,sponsorProfile,const DeepCollectionEquality().hash(_sport));

@override
String toString() {
  return 'Sponsor(id: $id, email: $email, name: $name, sponsorProfile: $sponsorProfile, sport: $sport)';
}


}

/// @nodoc
abstract mixin class _$SponsorCopyWith<$Res> implements $SponsorCopyWith<$Res> {
  factory _$SponsorCopyWith(_Sponsor value, $Res Function(_Sponsor) _then) = __$SponsorCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? email, String? name, SponsorProfile? sponsorProfile, List<Sport> sport
});


@override $SponsorProfileCopyWith<$Res>? get sponsorProfile;

}
/// @nodoc
class __$SponsorCopyWithImpl<$Res>
    implements _$SponsorCopyWith<$Res> {
  __$SponsorCopyWithImpl(this._self, this._then);

  final _Sponsor _self;
  final $Res Function(_Sponsor) _then;

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? sponsorProfile = freezed,Object? sport = null,}) {
  return _then(_Sponsor(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,sponsorProfile: freezed == sponsorProfile ? _self.sponsorProfile : sponsorProfile // ignore: cast_nullable_to_non_nullable
as SponsorProfile?,sport: null == sport ? _self._sport : sport // ignore: cast_nullable_to_non_nullable
as List<Sport>,
  ));
}

/// Create a copy of Sponsor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorProfileCopyWith<$Res>? get sponsorProfile {
    if (_self.sponsorProfile == null) {
    return null;
  }

  return $SponsorProfileCopyWith<$Res>(_self.sponsorProfile!, (value) {
    return _then(_self.copyWith(sponsorProfile: value));
  });
}
}


/// @nodoc
mixin _$Achievement {

 String? get name; String? get rank; String? get difficulty; int? get score;
/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementCopyWith<Achievement> get copyWith => _$AchievementCopyWithImpl<Achievement>(this as Achievement, _$identity);

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Achievement&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,rank,difficulty,score);

@override
String toString() {
  return 'Achievement(name: $name, rank: $rank, difficulty: $difficulty, score: $score)';
}


}

/// @nodoc
abstract mixin class $AchievementCopyWith<$Res>  {
  factory $AchievementCopyWith(Achievement value, $Res Function(Achievement) _then) = _$AchievementCopyWithImpl;
@useResult
$Res call({
 String? name, String? rank, String? difficulty, int? score
});




}
/// @nodoc
class _$AchievementCopyWithImpl<$Res>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._self, this._then);

  final Achievement _self;
  final $Res Function(Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? rank = freezed,Object? difficulty = freezed,Object? score = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Achievement].
extension AchievementPatterns on Achievement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Achievement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Achievement value)  $default,){
final _that = this;
switch (_that) {
case _Achievement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Achievement value)?  $default,){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? rank,  String? difficulty,  int? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.name,_that.rank,_that.difficulty,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? rank,  String? difficulty,  int? score)  $default,) {final _that = this;
switch (_that) {
case _Achievement():
return $default(_that.name,_that.rank,_that.difficulty,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? rank,  String? difficulty,  int? score)?  $default,) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.name,_that.rank,_that.difficulty,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Achievement implements Achievement {
  const _Achievement({this.name, this.rank, this.difficulty, this.score});
  factory _Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);

@override final  String? name;
@override final  String? rank;
@override final  String? difficulty;
@override final  int? score;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementCopyWith<_Achievement> get copyWith => __$AchievementCopyWithImpl<_Achievement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Achievement&&(identical(other.name, name) || other.name == name)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,rank,difficulty,score);

@override
String toString() {
  return 'Achievement(name: $name, rank: $rank, difficulty: $difficulty, score: $score)';
}


}

/// @nodoc
abstract mixin class _$AchievementCopyWith<$Res> implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(_Achievement value, $Res Function(_Achievement) _then) = __$AchievementCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? rank, String? difficulty, int? score
});




}
/// @nodoc
class __$AchievementCopyWithImpl<$Res>
    implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(this._self, this._then);

  final _Achievement _self;
  final $Res Function(_Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? rank = freezed,Object? difficulty = freezed,Object? score = freezed,}) {
  return _then(_Achievement(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,rank: freezed == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as String?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AthleteProfile {

 String? get name; String? get profileImageUrl; int? get age; String? get position; String? get location; String? get level; double? get rating; String? get countryFlag; int get sponsorshipDone; String get highestSocialMediaPresence; String get club; List<Achievement> get achievements;
/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<AthleteProfile> get copyWith => _$AthleteProfileCopyWithImpl<AthleteProfile>(this as AthleteProfile, _$identity);

  /// Serializes this AthleteProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AthleteProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.age, age) || other.age == age)&&(identical(other.position, position) || other.position == position)&&(identical(other.location, location) || other.location == location)&&(identical(other.level, level) || other.level == level)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.countryFlag, countryFlag) || other.countryFlag == countryFlag)&&(identical(other.sponsorshipDone, sponsorshipDone) || other.sponsorshipDone == sponsorshipDone)&&(identical(other.highestSocialMediaPresence, highestSocialMediaPresence) || other.highestSocialMediaPresence == highestSocialMediaPresence)&&(identical(other.club, club) || other.club == club)&&const DeepCollectionEquality().equals(other.achievements, achievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,profileImageUrl,age,position,location,level,rating,countryFlag,sponsorshipDone,highestSocialMediaPresence,club,const DeepCollectionEquality().hash(achievements));

@override
String toString() {
  return 'AthleteProfile(name: $name, profileImageUrl: $profileImageUrl, age: $age, position: $position, location: $location, level: $level, rating: $rating, countryFlag: $countryFlag, sponsorshipDone: $sponsorshipDone, highestSocialMediaPresence: $highestSocialMediaPresence, club: $club, achievements: $achievements)';
}


}

/// @nodoc
abstract mixin class $AthleteProfileCopyWith<$Res>  {
  factory $AthleteProfileCopyWith(AthleteProfile value, $Res Function(AthleteProfile) _then) = _$AthleteProfileCopyWithImpl;
@useResult
$Res call({
 String? name, String? profileImageUrl, int? age, String? position, String? location, String? level, double? rating, String? countryFlag, int sponsorshipDone, String highestSocialMediaPresence, String club, List<Achievement> achievements
});




}
/// @nodoc
class _$AthleteProfileCopyWithImpl<$Res>
    implements $AthleteProfileCopyWith<$Res> {
  _$AthleteProfileCopyWithImpl(this._self, this._then);

  final AthleteProfile _self;
  final $Res Function(AthleteProfile) _then;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? profileImageUrl = freezed,Object? age = freezed,Object? position = freezed,Object? location = freezed,Object? level = freezed,Object? rating = freezed,Object? countryFlag = freezed,Object? sponsorshipDone = null,Object? highestSocialMediaPresence = null,Object? club = null,Object? achievements = null,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,countryFlag: freezed == countryFlag ? _self.countryFlag : countryFlag // ignore: cast_nullable_to_non_nullable
as String?,sponsorshipDone: null == sponsorshipDone ? _self.sponsorshipDone : sponsorshipDone // ignore: cast_nullable_to_non_nullable
as int,highestSocialMediaPresence: null == highestSocialMediaPresence ? _self.highestSocialMediaPresence : highestSocialMediaPresence // ignore: cast_nullable_to_non_nullable
as String,club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,
  ));
}

}


/// Adds pattern-matching-related methods to [AthleteProfile].
extension AthleteProfilePatterns on AthleteProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AthleteProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AthleteProfile value)  $default,){
final _that = this;
switch (_that) {
case _AthleteProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AthleteProfile value)?  $default,){
final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? profileImageUrl,  int? age,  String? position,  String? location,  String? level,  double? rating,  String? countryFlag,  int sponsorshipDone,  String highestSocialMediaPresence,  String club,  List<Achievement> achievements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
return $default(_that.name,_that.profileImageUrl,_that.age,_that.position,_that.location,_that.level,_that.rating,_that.countryFlag,_that.sponsorshipDone,_that.highestSocialMediaPresence,_that.club,_that.achievements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? profileImageUrl,  int? age,  String? position,  String? location,  String? level,  double? rating,  String? countryFlag,  int sponsorshipDone,  String highestSocialMediaPresence,  String club,  List<Achievement> achievements)  $default,) {final _that = this;
switch (_that) {
case _AthleteProfile():
return $default(_that.name,_that.profileImageUrl,_that.age,_that.position,_that.location,_that.level,_that.rating,_that.countryFlag,_that.sponsorshipDone,_that.highestSocialMediaPresence,_that.club,_that.achievements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? profileImageUrl,  int? age,  String? position,  String? location,  String? level,  double? rating,  String? countryFlag,  int sponsorshipDone,  String highestSocialMediaPresence,  String club,  List<Achievement> achievements)?  $default,) {final _that = this;
switch (_that) {
case _AthleteProfile() when $default != null:
return $default(_that.name,_that.profileImageUrl,_that.age,_that.position,_that.location,_that.level,_that.rating,_that.countryFlag,_that.sponsorshipDone,_that.highestSocialMediaPresence,_that.club,_that.achievements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AthleteProfile implements AthleteProfile {
  const _AthleteProfile({this.name, this.profileImageUrl, this.age, this.position, this.location, this.level, this.rating, this.countryFlag, this.sponsorshipDone = 0, this.highestSocialMediaPresence = "", this.club = "", final  List<Achievement> achievements = const []}): _achievements = achievements;
  factory _AthleteProfile.fromJson(Map<String, dynamic> json) => _$AthleteProfileFromJson(json);

@override final  String? name;
@override final  String? profileImageUrl;
@override final  int? age;
@override final  String? position;
@override final  String? location;
@override final  String? level;
@override final  double? rating;
@override final  String? countryFlag;
@override@JsonKey() final  int sponsorshipDone;
@override@JsonKey() final  String highestSocialMediaPresence;
@override@JsonKey() final  String club;
 final  List<Achievement> _achievements;
@override@JsonKey() List<Achievement> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}


/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteProfileCopyWith<_AthleteProfile> get copyWith => __$AthleteProfileCopyWithImpl<_AthleteProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AthleteProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.age, age) || other.age == age)&&(identical(other.position, position) || other.position == position)&&(identical(other.location, location) || other.location == location)&&(identical(other.level, level) || other.level == level)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.countryFlag, countryFlag) || other.countryFlag == countryFlag)&&(identical(other.sponsorshipDone, sponsorshipDone) || other.sponsorshipDone == sponsorshipDone)&&(identical(other.highestSocialMediaPresence, highestSocialMediaPresence) || other.highestSocialMediaPresence == highestSocialMediaPresence)&&(identical(other.club, club) || other.club == club)&&const DeepCollectionEquality().equals(other._achievements, _achievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,profileImageUrl,age,position,location,level,rating,countryFlag,sponsorshipDone,highestSocialMediaPresence,club,const DeepCollectionEquality().hash(_achievements));

@override
String toString() {
  return 'AthleteProfile(name: $name, profileImageUrl: $profileImageUrl, age: $age, position: $position, location: $location, level: $level, rating: $rating, countryFlag: $countryFlag, sponsorshipDone: $sponsorshipDone, highestSocialMediaPresence: $highestSocialMediaPresence, club: $club, achievements: $achievements)';
}


}

/// @nodoc
abstract mixin class _$AthleteProfileCopyWith<$Res> implements $AthleteProfileCopyWith<$Res> {
  factory _$AthleteProfileCopyWith(_AthleteProfile value, $Res Function(_AthleteProfile) _then) = __$AthleteProfileCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? profileImageUrl, int? age, String? position, String? location, String? level, double? rating, String? countryFlag, int sponsorshipDone, String highestSocialMediaPresence, String club, List<Achievement> achievements
});




}
/// @nodoc
class __$AthleteProfileCopyWithImpl<$Res>
    implements _$AthleteProfileCopyWith<$Res> {
  __$AthleteProfileCopyWithImpl(this._self, this._then);

  final _AthleteProfile _self;
  final $Res Function(_AthleteProfile) _then;

/// Create a copy of AthleteProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? profileImageUrl = freezed,Object? age = freezed,Object? position = freezed,Object? location = freezed,Object? level = freezed,Object? rating = freezed,Object? countryFlag = freezed,Object? sponsorshipDone = null,Object? highestSocialMediaPresence = null,Object? club = null,Object? achievements = null,}) {
  return _then(_AthleteProfile(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,age: freezed == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,countryFlag: freezed == countryFlag ? _self.countryFlag : countryFlag // ignore: cast_nullable_to_non_nullable
as String?,sponsorshipDone: null == sponsorshipDone ? _self.sponsorshipDone : sponsorshipDone // ignore: cast_nullable_to_non_nullable
as int,highestSocialMediaPresence: null == highestSocialMediaPresence ? _self.highestSocialMediaPresence : highestSocialMediaPresence // ignore: cast_nullable_to_non_nullable
as String,club: null == club ? _self.club : club // ignore: cast_nullable_to_non_nullable
as String,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,
  ));
}


}


/// @nodoc
mixin _$Athlete {

@JsonKey(name: '_id') String? get id; String? get email; String? get name; AthleteProfile? get athleteProfile; List<Sport> get sport;
/// Create a copy of Athlete
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AthleteCopyWith<Athlete> get copyWith => _$AthleteCopyWithImpl<Athlete>(this as Athlete, _$identity);

  /// Serializes this Athlete to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Athlete&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile)&&const DeepCollectionEquality().equals(other.sport, sport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,athleteProfile,const DeepCollectionEquality().hash(sport));

@override
String toString() {
  return 'Athlete(id: $id, email: $email, name: $name, athleteProfile: $athleteProfile, sport: $sport)';
}


}

/// @nodoc
abstract mixin class $AthleteCopyWith<$Res>  {
  factory $AthleteCopyWith(Athlete value, $Res Function(Athlete) _then) = _$AthleteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? email, String? name, AthleteProfile? athleteProfile, List<Sport> sport
});


$AthleteProfileCopyWith<$Res>? get athleteProfile;

}
/// @nodoc
class _$AthleteCopyWithImpl<$Res>
    implements $AthleteCopyWith<$Res> {
  _$AthleteCopyWithImpl(this._self, this._then);

  final Athlete _self;
  final $Res Function(Athlete) _then;

/// Create a copy of Athlete
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? athleteProfile = freezed,Object? sport = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,sport: null == sport ? _self.sport : sport // ignore: cast_nullable_to_non_nullable
as List<Sport>,
  ));
}
/// Create a copy of Athlete
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get athleteProfile {
    if (_self.athleteProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.athleteProfile!, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [Athlete].
extension AthletePatterns on Athlete {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Athlete value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Athlete() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Athlete value)  $default,){
final _that = this;
switch (_that) {
case _Athlete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Athlete value)?  $default,){
final _that = this;
switch (_that) {
case _Athlete() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? email,  String? name,  AthleteProfile? athleteProfile,  List<Sport> sport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Athlete() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.athleteProfile,_that.sport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? email,  String? name,  AthleteProfile? athleteProfile,  List<Sport> sport)  $default,) {final _that = this;
switch (_that) {
case _Athlete():
return $default(_that.id,_that.email,_that.name,_that.athleteProfile,_that.sport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? email,  String? name,  AthleteProfile? athleteProfile,  List<Sport> sport)?  $default,) {final _that = this;
switch (_that) {
case _Athlete() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.athleteProfile,_that.sport);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Athlete implements Athlete {
  const _Athlete({@JsonKey(name: '_id') this.id, this.email, this.name, this.athleteProfile, final  List<Sport> sport = const []}): _sport = sport;
  factory _Athlete.fromJson(Map<String, dynamic> json) => _$AthleteFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? email;
@override final  String? name;
@override final  AthleteProfile? athleteProfile;
 final  List<Sport> _sport;
@override@JsonKey() List<Sport> get sport {
  if (_sport is EqualUnmodifiableListView) return _sport;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sport);
}


/// Create a copy of Athlete
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AthleteCopyWith<_Athlete> get copyWith => __$AthleteCopyWithImpl<_Athlete>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AthleteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Athlete&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.athleteProfile, athleteProfile) || other.athleteProfile == athleteProfile)&&const DeepCollectionEquality().equals(other._sport, _sport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,athleteProfile,const DeepCollectionEquality().hash(_sport));

@override
String toString() {
  return 'Athlete(id: $id, email: $email, name: $name, athleteProfile: $athleteProfile, sport: $sport)';
}


}

/// @nodoc
abstract mixin class _$AthleteCopyWith<$Res> implements $AthleteCopyWith<$Res> {
  factory _$AthleteCopyWith(_Athlete value, $Res Function(_Athlete) _then) = __$AthleteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? email, String? name, AthleteProfile? athleteProfile, List<Sport> sport
});


@override $AthleteProfileCopyWith<$Res>? get athleteProfile;

}
/// @nodoc
class __$AthleteCopyWithImpl<$Res>
    implements _$AthleteCopyWith<$Res> {
  __$AthleteCopyWithImpl(this._self, this._then);

  final _Athlete _self;
  final $Res Function(_Athlete) _then;

/// Create a copy of Athlete
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? name = freezed,Object? athleteProfile = freezed,Object? sport = null,}) {
  return _then(_Athlete(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,athleteProfile: freezed == athleteProfile ? _self.athleteProfile : athleteProfile // ignore: cast_nullable_to_non_nullable
as AthleteProfile?,sport: null == sport ? _self._sport : sport // ignore: cast_nullable_to_non_nullable
as List<Sport>,
  ));
}

/// Create a copy of Athlete
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AthleteProfileCopyWith<$Res>? get athleteProfile {
    if (_self.athleteProfile == null) {
    return null;
  }

  return $AthleteProfileCopyWith<$Res>(_self.athleteProfile!, (value) {
    return _then(_self.copyWith(athleteProfile: value));
  });
}
}


/// @nodoc
mixin _$FeedData {

 List<Athlete> get athletes; List<Sponsor> get sponsors; int get totalAthletes; int get totalSponsors;
/// Create a copy of FeedData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedDataCopyWith<FeedData> get copyWith => _$FeedDataCopyWithImpl<FeedData>(this as FeedData, _$identity);

  /// Serializes this FeedData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedData&&const DeepCollectionEquality().equals(other.athletes, athletes)&&const DeepCollectionEquality().equals(other.sponsors, sponsors)&&(identical(other.totalAthletes, totalAthletes) || other.totalAthletes == totalAthletes)&&(identical(other.totalSponsors, totalSponsors) || other.totalSponsors == totalSponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(athletes),const DeepCollectionEquality().hash(sponsors),totalAthletes,totalSponsors);

@override
String toString() {
  return 'FeedData(athletes: $athletes, sponsors: $sponsors, totalAthletes: $totalAthletes, totalSponsors: $totalSponsors)';
}


}

/// @nodoc
abstract mixin class $FeedDataCopyWith<$Res>  {
  factory $FeedDataCopyWith(FeedData value, $Res Function(FeedData) _then) = _$FeedDataCopyWithImpl;
@useResult
$Res call({
 List<Athlete> athletes, List<Sponsor> sponsors, int totalAthletes, int totalSponsors
});




}
/// @nodoc
class _$FeedDataCopyWithImpl<$Res>
    implements $FeedDataCopyWith<$Res> {
  _$FeedDataCopyWithImpl(this._self, this._then);

  final FeedData _self;
  final $Res Function(FeedData) _then;

/// Create a copy of FeedData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? athletes = null,Object? sponsors = null,Object? totalAthletes = null,Object? totalSponsors = null,}) {
  return _then(_self.copyWith(
athletes: null == athletes ? _self.athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<Athlete>,sponsors: null == sponsors ? _self.sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>,totalAthletes: null == totalAthletes ? _self.totalAthletes : totalAthletes // ignore: cast_nullable_to_non_nullable
as int,totalSponsors: null == totalSponsors ? _self.totalSponsors : totalSponsors // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedData].
extension FeedDataPatterns on FeedData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedData value)  $default,){
final _that = this;
switch (_that) {
case _FeedData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedData value)?  $default,){
final _that = this;
switch (_that) {
case _FeedData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Athlete> athletes,  List<Sponsor> sponsors,  int totalAthletes,  int totalSponsors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedData() when $default != null:
return $default(_that.athletes,_that.sponsors,_that.totalAthletes,_that.totalSponsors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Athlete> athletes,  List<Sponsor> sponsors,  int totalAthletes,  int totalSponsors)  $default,) {final _that = this;
switch (_that) {
case _FeedData():
return $default(_that.athletes,_that.sponsors,_that.totalAthletes,_that.totalSponsors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Athlete> athletes,  List<Sponsor> sponsors,  int totalAthletes,  int totalSponsors)?  $default,) {final _that = this;
switch (_that) {
case _FeedData() when $default != null:
return $default(_that.athletes,_that.sponsors,_that.totalAthletes,_that.totalSponsors);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedData implements FeedData {
  const _FeedData({final  List<Athlete> athletes = const [], final  List<Sponsor> sponsors = const [], this.totalAthletes = 0, this.totalSponsors = 0}): _athletes = athletes,_sponsors = sponsors;
  factory _FeedData.fromJson(Map<String, dynamic> json) => _$FeedDataFromJson(json);

 final  List<Athlete> _athletes;
@override@JsonKey() List<Athlete> get athletes {
  if (_athletes is EqualUnmodifiableListView) return _athletes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_athletes);
}

 final  List<Sponsor> _sponsors;
@override@JsonKey() List<Sponsor> get sponsors {
  if (_sponsors is EqualUnmodifiableListView) return _sponsors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sponsors);
}

@override@JsonKey() final  int totalAthletes;
@override@JsonKey() final  int totalSponsors;

/// Create a copy of FeedData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedDataCopyWith<_FeedData> get copyWith => __$FeedDataCopyWithImpl<_FeedData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedData&&const DeepCollectionEquality().equals(other._athletes, _athletes)&&const DeepCollectionEquality().equals(other._sponsors, _sponsors)&&(identical(other.totalAthletes, totalAthletes) || other.totalAthletes == totalAthletes)&&(identical(other.totalSponsors, totalSponsors) || other.totalSponsors == totalSponsors));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_athletes),const DeepCollectionEquality().hash(_sponsors),totalAthletes,totalSponsors);

@override
String toString() {
  return 'FeedData(athletes: $athletes, sponsors: $sponsors, totalAthletes: $totalAthletes, totalSponsors: $totalSponsors)';
}


}

/// @nodoc
abstract mixin class _$FeedDataCopyWith<$Res> implements $FeedDataCopyWith<$Res> {
  factory _$FeedDataCopyWith(_FeedData value, $Res Function(_FeedData) _then) = __$FeedDataCopyWithImpl;
@override @useResult
$Res call({
 List<Athlete> athletes, List<Sponsor> sponsors, int totalAthletes, int totalSponsors
});




}
/// @nodoc
class __$FeedDataCopyWithImpl<$Res>
    implements _$FeedDataCopyWith<$Res> {
  __$FeedDataCopyWithImpl(this._self, this._then);

  final _FeedData _self;
  final $Res Function(_FeedData) _then;

/// Create a copy of FeedData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? athletes = null,Object? sponsors = null,Object? totalAthletes = null,Object? totalSponsors = null,}) {
  return _then(_FeedData(
athletes: null == athletes ? _self._athletes : athletes // ignore: cast_nullable_to_non_nullable
as List<Athlete>,sponsors: null == sponsors ? _self._sponsors : sponsors // ignore: cast_nullable_to_non_nullable
as List<Sponsor>,totalAthletes: null == totalAthletes ? _self.totalAthletes : totalAthletes // ignore: cast_nullable_to_non_nullable
as int,totalSponsors: null == totalSponsors ? _self.totalSponsors : totalSponsors // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FeedResponse {

 bool get success; String get message; FeedData? get data;
/// Create a copy of FeedResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedResponseCopyWith<FeedResponse> get copyWith => _$FeedResponseCopyWithImpl<FeedResponse>(this as FeedResponse, _$identity);

  /// Serializes this FeedResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'FeedResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $FeedResponseCopyWith<$Res>  {
  factory $FeedResponseCopyWith(FeedResponse value, $Res Function(FeedResponse) _then) = _$FeedResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, FeedData? data
});


$FeedDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$FeedResponseCopyWithImpl<$Res>
    implements $FeedResponseCopyWith<$Res> {
  _$FeedResponseCopyWithImpl(this._self, this._then);

  final FeedResponse _self;
  final $Res Function(FeedResponse) _then;

/// Create a copy of FeedResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FeedData?,
  ));
}
/// Create a copy of FeedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $FeedDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeedResponse].
extension FeedResponsePatterns on FeedResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedResponse value)  $default,){
final _that = this;
switch (_that) {
case _FeedResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FeedResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  FeedData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  FeedData? data)  $default,) {final _that = this;
switch (_that) {
case _FeedResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  FeedData? data)?  $default,) {final _that = this;
switch (_that) {
case _FeedResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedResponse implements FeedResponse {
  const _FeedResponse({this.success = false, this.message = '', this.data});
  factory _FeedResponse.fromJson(Map<String, dynamic> json) => _$FeedResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  FeedData? data;

/// Create a copy of FeedResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedResponseCopyWith<_FeedResponse> get copyWith => __$FeedResponseCopyWithImpl<_FeedResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'FeedResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$FeedResponseCopyWith<$Res> implements $FeedResponseCopyWith<$Res> {
  factory _$FeedResponseCopyWith(_FeedResponse value, $Res Function(_FeedResponse) _then) = __$FeedResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, FeedData? data
});


@override $FeedDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$FeedResponseCopyWithImpl<$Res>
    implements _$FeedResponseCopyWith<$Res> {
  __$FeedResponseCopyWithImpl(this._self, this._then);

  final _FeedResponse _self;
  final $Res Function(_FeedResponse) _then;

/// Create a copy of FeedResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_FeedResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FeedData?,
  ));
}

/// Create a copy of FeedResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeedDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $FeedDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
