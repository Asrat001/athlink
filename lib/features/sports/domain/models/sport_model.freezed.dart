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

@JsonKey(name: "_id") String get id; String get name; String? get icon; bool get isVisible; DateTime get createdAt; DateTime get updatedAt;@JsonKey(name: "sportCategory") String get sportCategoryId;@JsonKey(name: "categoryId") SportCategory? get sportCategory;
/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SportCopyWith<Sport> get copyWith => _$SportCopyWithImpl<Sport>(this as Sport, _$identity);

  /// Serializes this Sport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sportCategoryId, sportCategoryId) || other.sportCategoryId == sportCategoryId)&&(identical(other.sportCategory, sportCategory) || other.sportCategory == sportCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,isVisible,createdAt,updatedAt,sportCategoryId,sportCategory);

@override
String toString() {
  return 'Sport(id: $id, name: $name, icon: $icon, isVisible: $isVisible, createdAt: $createdAt, updatedAt: $updatedAt, sportCategoryId: $sportCategoryId, sportCategory: $sportCategory)';
}


}

/// @nodoc
abstract mixin class $SportCopyWith<$Res>  {
  factory $SportCopyWith(Sport value, $Res Function(Sport) _then) = _$SportCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? icon, bool isVisible, DateTime createdAt, DateTime updatedAt,@JsonKey(name: "sportCategory") String sportCategoryId,@JsonKey(name: "categoryId") SportCategory? sportCategory
});


$SportCategoryCopyWith<$Res>? get sportCategory;

}
/// @nodoc
class _$SportCopyWithImpl<$Res>
    implements $SportCopyWith<$Res> {
  _$SportCopyWithImpl(this._self, this._then);

  final Sport _self;
  final $Res Function(Sport) _then;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? isVisible = null,Object? createdAt = null,Object? updatedAt = null,Object? sportCategoryId = null,Object? sportCategory = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sportCategoryId: null == sportCategoryId ? _self.sportCategoryId : sportCategoryId // ignore: cast_nullable_to_non_nullable
as String,sportCategory: freezed == sportCategory ? _self.sportCategory : sportCategory // ignore: cast_nullable_to_non_nullable
as SportCategory?,
  ));
}
/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<$Res>? get sportCategory {
    if (_self.sportCategory == null) {
    return null;
  }

  return $SportCategoryCopyWith<$Res>(_self.sportCategory!, (value) {
    return _then(_self.copyWith(sportCategory: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? icon,  bool isVisible,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "sportCategory")  String sportCategoryId, @JsonKey(name: "categoryId")  SportCategory? sportCategory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sport() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.isVisible,_that.createdAt,_that.updatedAt,_that.sportCategoryId,_that.sportCategory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? icon,  bool isVisible,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "sportCategory")  String sportCategoryId, @JsonKey(name: "categoryId")  SportCategory? sportCategory)  $default,) {final _that = this;
switch (_that) {
case _Sport():
return $default(_that.id,_that.name,_that.icon,_that.isVisible,_that.createdAt,_that.updatedAt,_that.sportCategoryId,_that.sportCategory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name,  String? icon,  bool isVisible,  DateTime createdAt,  DateTime updatedAt, @JsonKey(name: "sportCategory")  String sportCategoryId, @JsonKey(name: "categoryId")  SportCategory? sportCategory)?  $default,) {final _that = this;
switch (_that) {
case _Sport() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.isVisible,_that.createdAt,_that.updatedAt,_that.sportCategoryId,_that.sportCategory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Sport implements Sport {
  const _Sport({@JsonKey(name: "_id") required this.id, required this.name, this.icon, required this.isVisible, required this.createdAt, required this.updatedAt, @JsonKey(name: "sportCategory") required this.sportCategoryId, @JsonKey(name: "categoryId") this.sportCategory});
  factory _Sport.fromJson(Map<String, dynamic> json) => _$SportFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;
@override final  String? icon;
@override final  bool isVisible;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey(name: "sportCategory") final  String sportCategoryId;
@override@JsonKey(name: "categoryId") final  SportCategory? sportCategory;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sport&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sportCategoryId, sportCategoryId) || other.sportCategoryId == sportCategoryId)&&(identical(other.sportCategory, sportCategory) || other.sportCategory == sportCategory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,isVisible,createdAt,updatedAt,sportCategoryId,sportCategory);

@override
String toString() {
  return 'Sport(id: $id, name: $name, icon: $icon, isVisible: $isVisible, createdAt: $createdAt, updatedAt: $updatedAt, sportCategoryId: $sportCategoryId, sportCategory: $sportCategory)';
}


}

/// @nodoc
abstract mixin class _$SportCopyWith<$Res> implements $SportCopyWith<$Res> {
  factory _$SportCopyWith(_Sport value, $Res Function(_Sport) _then) = __$SportCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? icon, bool isVisible, DateTime createdAt, DateTime updatedAt,@JsonKey(name: "sportCategory") String sportCategoryId,@JsonKey(name: "categoryId") SportCategory? sportCategory
});


@override $SportCategoryCopyWith<$Res>? get sportCategory;

}
/// @nodoc
class __$SportCopyWithImpl<$Res>
    implements _$SportCopyWith<$Res> {
  __$SportCopyWithImpl(this._self, this._then);

  final _Sport _self;
  final $Res Function(_Sport) _then;

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? isVisible = null,Object? createdAt = null,Object? updatedAt = null,Object? sportCategoryId = null,Object? sportCategory = freezed,}) {
  return _then(_Sport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,sportCategoryId: null == sportCategoryId ? _self.sportCategoryId : sportCategoryId // ignore: cast_nullable_to_non_nullable
as String,sportCategory: freezed == sportCategory ? _self.sportCategory : sportCategory // ignore: cast_nullable_to_non_nullable
as SportCategory?,
  ));
}

/// Create a copy of Sport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SportCategoryCopyWith<$Res>? get sportCategory {
    if (_self.sportCategory == null) {
    return null;
  }

  return $SportCategoryCopyWith<$Res>(_self.sportCategory!, (value) {
    return _then(_self.copyWith(sportCategory: value));
  });
}
}


/// @nodoc
mixin _$SportCategory {

@JsonKey(name: "_id") String get id; String get name;
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
@JsonKey(name: "_id") String id, String name
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name)?  $default,) {final _that = this;
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
  const _SportCategory({@JsonKey(name: "_id") required this.id, required this.name});
  factory _SportCategory.fromJson(Map<String, dynamic> json) => _$SportCategoryFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;

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
@JsonKey(name: "_id") String id, String name
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_SportCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
