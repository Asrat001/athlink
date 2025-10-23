// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sport_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sport {

@JsonKey(name: "_id") String get id; String get name; String? get icon; bool get isVisible; DateTime get createdAt; DateTime get updatedAt;@JsonKey(name: "sportCategory") String get sportCategoryId;
/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportCopyWith<Sport> get copyWith => _$SportCopyWithImpl<Sport>(this as Sport, _$identity);

  /// Serializes this Sport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sportCategoryId, sportCategoryId) || other.sportCategoryId == sportCategoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,isVisible,createdAt,updatedAt,sportCategoryId);

@override
String toString() {
  return 'Sport(id: $id, name: $name, icon: $icon, isVisible: $isVisible, createdAt: $createdAt, updatedAt: $updatedAt, sportCategoryId: $sportCategoryId)';
}


}

/// @nodoc
abstract mixin class $SportCopyWith<$Res>  {
  factory $SportCopyWith(Sport value, $Res Function(Sport) _then) = _$SportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? icon, bool isVisible, DateTime createdAt, DateTime updatedAt,@JsonKey(name: "sportCategory") String sportCategoryId
});




}
/// @nodoc
class _$SportCopyWithImpl<$Res>
    implements $SportCopyWith<$Res> {
  _$SportCopyWithImpl(this._self, this._then);

  final Sport _self;
  final $Res Function(Sport) _then;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? isVisible = null,Object? createdAt = null,Object? updatedAt = null,Object? sportCategoryId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sportCategoryId: null == sportCategoryId ? _self.sportCategoryId : sportCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? icon,  bool isVisible,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "sportCategory")  String sportCategoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sport() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.isVisible,_that.createdAt,_that.updatedAt,_that.sportCategoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? icon,  bool isVisible,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "sportCategory")  String sportCategoryId)  $default,) {final _that = this;
switch (_that) {
case _Sport():
return $default(_that.id,_that.name,_that.icon,_that.isVisible,_that.createdAt,_that.updatedAt,_that.sportCategoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name,  String? icon,  bool isVisible,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "sportCategory")  String sportCategoryId)?  $default,) {final _that = this;
switch (_that) {
case _Sport() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.isVisible,_that.createdAt,_that.updatedAt,_that.sportCategoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sport implements Sport {
  const _Sport({@JsonKey(name: "_id") required this.id, required this.name, this.icon, required this.isVisible, required this.createdAt, required this.updatedAt, @JsonKey(name: "sportCategory") required this.sportCategoryId});
  factory _Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;
@override final  String? icon;
@override final  bool isVisible;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey(name: "sportCategory") final  String sportCategoryId;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sportCategoryId, sportCategoryId) || other.sportCategoryId == sportCategoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,isVisible,createdAt,updatedAt,sportCategoryId);

@override
String toString() {
  return 'Sport(id: $id, name: $name, icon: $icon, isVisible: $isVisible, createdAt: $createdAt, updatedAt: $updatedAt, sportCategoryId: $sportCategoryId)';
}


}

/// @nodoc
abstract mixin class _$SportCopyWith<$Res> implements $SportCopyWith<$Res> {
  factory _$SportCopyWith(_Sport value, $Res Function(_Sport) _then) = __$SportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? icon, bool isVisible, DateTime createdAt, DateTime updatedAt,@JsonKey(name: "sportCategory") String sportCategoryId
});




}
/// @nodoc
class __$SportCopyWithImpl<$Res>
    implements _$SportCopyWith<$Res> {
  __$SportCopyWithImpl(this._self, this._then);

  final _Sport _self;
  final $Res Function(_Sport) _then;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? isVisible = null,Object? createdAt = null,Object? updatedAt = null,Object? sportCategoryId = null,}) {
  return _then(_Sport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sportCategoryId: null == sportCategoryId ? _self.sportCategoryId : sportCategoryId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
