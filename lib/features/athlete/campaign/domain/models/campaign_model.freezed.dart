// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'campaign_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CampaignModel {

@JsonKey(name: '_id') String? get id; CampaignTitleModel? get title; String? get createdAt;
/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignModelCopyWith<CampaignModel> get copyWith => _$CampaignModelCopyWithImpl<CampaignModel>(this as CampaignModel, _$identity);

  /// Serializes this CampaignModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt);

@override
String toString() {
  return 'CampaignModel(id: $id, title: $title, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CampaignModelCopyWith<$Res>  {
  factory $CampaignModelCopyWith(CampaignModel value, $Res Function(CampaignModel) _then) = _$CampaignModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, CampaignTitleModel? title, String? createdAt
});


$CampaignTitleModelCopyWith<$Res>? get title;

}
/// @nodoc
class _$CampaignModelCopyWithImpl<$Res>
    implements $CampaignModelCopyWith<$Res> {
  _$CampaignModelCopyWithImpl(this._self, this._then);

  final CampaignModel _self;
  final $Res Function(CampaignModel) _then;

/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as CampaignTitleModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CampaignModel
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
}
}


/// Adds pattern-matching-related methods to [CampaignModel].
extension CampaignModelPatterns on CampaignModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignModel value)  $default,){
final _that = this;
switch (_that) {
case _CampaignModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignModel value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  CampaignTitleModel? title,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  CampaignTitleModel? title,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CampaignModel():
return $default(_that.id,_that.title,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  CampaignTitleModel? title,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CampaignModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampaignModel implements CampaignModel {
  const _CampaignModel({@JsonKey(name: '_id') this.id, this.title, this.createdAt});
  factory _CampaignModel.fromJson(Map<String, dynamic> json) => _$CampaignModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  CampaignTitleModel? title;
@override final  String? createdAt;

/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignModelCopyWith<_CampaignModel> get copyWith => __$CampaignModelCopyWithImpl<_CampaignModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampaignModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,createdAt);

@override
String toString() {
  return 'CampaignModel(id: $id, title: $title, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CampaignModelCopyWith<$Res> implements $CampaignModelCopyWith<$Res> {
  factory _$CampaignModelCopyWith(_CampaignModel value, $Res Function(_CampaignModel) _then) = __$CampaignModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, CampaignTitleModel? title, String? createdAt
});


@override $CampaignTitleModelCopyWith<$Res>? get title;

}
/// @nodoc
class __$CampaignModelCopyWithImpl<$Res>
    implements _$CampaignModelCopyWith<$Res> {
  __$CampaignModelCopyWithImpl(this._self, this._then);

  final _CampaignModel _self;
  final $Res Function(_CampaignModel) _then;

/// Create a copy of CampaignModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? createdAt = freezed,}) {
  return _then(_CampaignModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as CampaignTitleModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CampaignModel
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
}
}


/// @nodoc
mixin _$CampaignTitleModel {

 String? get text; bool? get isActive; double? get fundedPercentage;
/// Create a copy of CampaignTitleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CampaignTitleModelCopyWith<CampaignTitleModel> get copyWith => _$CampaignTitleModelCopyWithImpl<CampaignTitleModel>(this as CampaignTitleModel, _$identity);

  /// Serializes this CampaignTitleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CampaignTitleModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.fundedPercentage, fundedPercentage) || other.fundedPercentage == fundedPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isActive,fundedPercentage);

@override
String toString() {
  return 'CampaignTitleModel(text: $text, isActive: $isActive, fundedPercentage: $fundedPercentage)';
}


}

/// @nodoc
abstract mixin class $CampaignTitleModelCopyWith<$Res>  {
  factory $CampaignTitleModelCopyWith(CampaignTitleModel value, $Res Function(CampaignTitleModel) _then) = _$CampaignTitleModelCopyWithImpl;
@useResult
$Res call({
 String? text, bool? isActive, double? fundedPercentage
});




}
/// @nodoc
class _$CampaignTitleModelCopyWithImpl<$Res>
    implements $CampaignTitleModelCopyWith<$Res> {
  _$CampaignTitleModelCopyWithImpl(this._self, this._then);

  final CampaignTitleModel _self;
  final $Res Function(CampaignTitleModel) _then;

/// Create a copy of CampaignTitleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = freezed,Object? isActive = freezed,Object? fundedPercentage = freezed,}) {
  return _then(_self.copyWith(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,fundedPercentage: freezed == fundedPercentage ? _self.fundedPercentage : fundedPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CampaignTitleModel].
extension CampaignTitleModelPatterns on CampaignTitleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CampaignTitleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CampaignTitleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CampaignTitleModel value)  $default,){
final _that = this;
switch (_that) {
case _CampaignTitleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CampaignTitleModel value)?  $default,){
final _that = this;
switch (_that) {
case _CampaignTitleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? text,  bool? isActive,  double? fundedPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CampaignTitleModel() when $default != null:
return $default(_that.text,_that.isActive,_that.fundedPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? text,  bool? isActive,  double? fundedPercentage)  $default,) {final _that = this;
switch (_that) {
case _CampaignTitleModel():
return $default(_that.text,_that.isActive,_that.fundedPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? text,  bool? isActive,  double? fundedPercentage)?  $default,) {final _that = this;
switch (_that) {
case _CampaignTitleModel() when $default != null:
return $default(_that.text,_that.isActive,_that.fundedPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CampaignTitleModel implements CampaignTitleModel {
  const _CampaignTitleModel({this.text, this.isActive, this.fundedPercentage});
  factory _CampaignTitleModel.fromJson(Map<String, dynamic> json) => _$CampaignTitleModelFromJson(json);

@override final  String? text;
@override final  bool? isActive;
@override final  double? fundedPercentage;

/// Create a copy of CampaignTitleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CampaignTitleModelCopyWith<_CampaignTitleModel> get copyWith => __$CampaignTitleModelCopyWithImpl<_CampaignTitleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CampaignTitleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CampaignTitleModel&&(identical(other.text, text) || other.text == text)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.fundedPercentage, fundedPercentage) || other.fundedPercentage == fundedPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,isActive,fundedPercentage);

@override
String toString() {
  return 'CampaignTitleModel(text: $text, isActive: $isActive, fundedPercentage: $fundedPercentage)';
}


}

/// @nodoc
abstract mixin class _$CampaignTitleModelCopyWith<$Res> implements $CampaignTitleModelCopyWith<$Res> {
  factory _$CampaignTitleModelCopyWith(_CampaignTitleModel value, $Res Function(_CampaignTitleModel) _then) = __$CampaignTitleModelCopyWithImpl;
@override @useResult
$Res call({
 String? text, bool? isActive, double? fundedPercentage
});




}
/// @nodoc
class __$CampaignTitleModelCopyWithImpl<$Res>
    implements _$CampaignTitleModelCopyWith<$Res> {
  __$CampaignTitleModelCopyWithImpl(this._self, this._then);

  final _CampaignTitleModel _self;
  final $Res Function(_CampaignTitleModel) _then;

/// Create a copy of CampaignTitleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = freezed,Object? isActive = freezed,Object? fundedPercentage = freezed,}) {
  return _then(_CampaignTitleModel(
text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,fundedPercentage: freezed == fundedPercentage ? _self.fundedPercentage : fundedPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
