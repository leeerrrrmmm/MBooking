// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credits_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CastModel {

 int get id; String get name; String? get character;@JsonKey(name: 'profile_path') String? get profilePath; int get order;
/// Create a copy of CastModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CastModelCopyWith<CastModel> get copyWith => _$CastModelCopyWithImpl<CastModel>(this as CastModel, _$identity);

  /// Serializes this CastModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CastModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.character, character) || other.character == character)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,character,profilePath,order);

@override
String toString() {
  return 'CastModel(id: $id, name: $name, character: $character, profilePath: $profilePath, order: $order)';
}


}

/// @nodoc
abstract mixin class $CastModelCopyWith<$Res>  {
  factory $CastModelCopyWith(CastModel value, $Res Function(CastModel) _then) = _$CastModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? character,@JsonKey(name: 'profile_path') String? profilePath, int order
});




}
/// @nodoc
class _$CastModelCopyWithImpl<$Res>
    implements $CastModelCopyWith<$Res> {
  _$CastModelCopyWithImpl(this._self, this._then);

  final CastModel _self;
  final $Res Function(CastModel) _then;

/// Create a copy of CastModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? character = freezed,Object? profilePath = freezed,Object? order = null,}) {
  return _then(CastModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CastModel].
extension CastModelPatterns on CastModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CastModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CastModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CastModel value)  $default,){
final _that = this;
switch (_that) {
case _CastModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CastModel value)?  $default,){
final _that = this;
switch (_that) {
case _CastModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? character, @JsonKey(name: 'profile_path')  String? profilePath,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CastModel() when $default != null:
return $default(_that.id,_that.name,_that.character,_that.profilePath,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? character, @JsonKey(name: 'profile_path')  String? profilePath,  int order)  $default,) {final _that = this;
switch (_that) {
case _CastModel():
return $default(_that.id,_that.name,_that.character,_that.profilePath,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? character, @JsonKey(name: 'profile_path')  String? profilePath,  int order)?  $default,) {final _that = this;
switch (_that) {
case _CastModel() when $default != null:
return $default(_that.id,_that.name,_that.character,_that.profilePath,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CastModel implements CastModel {
  const _CastModel({required this.id, required this.name, this.character, @JsonKey(name: 'profile_path') this.profilePath, this.order = 0});
  factory _CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? character;
@override@JsonKey(name: 'profile_path') final  String? profilePath;
@override@JsonKey() final  int order;

/// Create a copy of CastModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CastModelCopyWith<_CastModel> get copyWith => __$CastModelCopyWithImpl<_CastModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CastModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CastModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.character, character) || other.character == character)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,character,profilePath,order);

@override
String toString() {
  return 'CastModel(id: $id, name: $name, character: $character, profilePath: $profilePath, order: $order)';
}


}

/// @nodoc
abstract mixin class _$CastModelCopyWith<$Res> implements $CastModelCopyWith<$Res> {
  factory _$CastModelCopyWith(_CastModel value, $Res Function(_CastModel) _then) = __$CastModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? character,@JsonKey(name: 'profile_path') String? profilePath, int order
});




}
/// @nodoc
class __$CastModelCopyWithImpl<$Res>
    implements _$CastModelCopyWith<$Res> {
  __$CastModelCopyWithImpl(this._self, this._then);

  final _CastModel _self;
  final $Res Function(_CastModel) _then;

/// Create a copy of CastModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? character = freezed,Object? profilePath = freezed,Object? order = null,}) {
  return _then(_CastModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,character: freezed == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as String?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CrewModel {

 int get id; String get name; String get job; String? get department;@JsonKey(name: 'profile_path') String? get profilePath;
/// Create a copy of CrewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrewModelCopyWith<CrewModel> get copyWith => _$CrewModelCopyWithImpl<CrewModel>(this as CrewModel, _$identity);

  /// Serializes this CrewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.job, job) || other.job == job)&&(identical(other.department, department) || other.department == department)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,job,department,profilePath);

@override
String toString() {
  return 'CrewModel(id: $id, name: $name, job: $job, department: $department, profilePath: $profilePath)';
}


}

/// @nodoc
abstract mixin class $CrewModelCopyWith<$Res>  {
  factory $CrewModelCopyWith(CrewModel value, $Res Function(CrewModel) _then) = _$CrewModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String job, String? department,@JsonKey(name: 'profile_path') String? profilePath
});




}
/// @nodoc
class _$CrewModelCopyWithImpl<$Res>
    implements $CrewModelCopyWith<$Res> {
  _$CrewModelCopyWithImpl(this._self, this._then);

  final CrewModel _self;
  final $Res Function(CrewModel) _then;

/// Create a copy of CrewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? job = null,Object? department = freezed,Object? profilePath = freezed,}) {
  return _then(CrewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CrewModel].
extension CrewModelPatterns on CrewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CrewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CrewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CrewModel value)  $default,){
final _that = this;
switch (_that) {
case _CrewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CrewModel value)?  $default,){
final _that = this;
switch (_that) {
case _CrewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String job,  String? department, @JsonKey(name: 'profile_path')  String? profilePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CrewModel() when $default != null:
return $default(_that.id,_that.name,_that.job,_that.department,_that.profilePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String job,  String? department, @JsonKey(name: 'profile_path')  String? profilePath)  $default,) {final _that = this;
switch (_that) {
case _CrewModel():
return $default(_that.id,_that.name,_that.job,_that.department,_that.profilePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String job,  String? department, @JsonKey(name: 'profile_path')  String? profilePath)?  $default,) {final _that = this;
switch (_that) {
case _CrewModel() when $default != null:
return $default(_that.id,_that.name,_that.job,_that.department,_that.profilePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CrewModel implements CrewModel {
  const _CrewModel({required this.id, required this.name, required this.job, this.department, @JsonKey(name: 'profile_path') this.profilePath});
  factory _CrewModel.fromJson(Map<String, dynamic> json) => _$CrewModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String job;
@override final  String? department;
@override@JsonKey(name: 'profile_path') final  String? profilePath;

/// Create a copy of CrewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CrewModelCopyWith<_CrewModel> get copyWith => __$CrewModelCopyWithImpl<_CrewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CrewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CrewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.job, job) || other.job == job)&&(identical(other.department, department) || other.department == department)&&(identical(other.profilePath, profilePath) || other.profilePath == profilePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,job,department,profilePath);

@override
String toString() {
  return 'CrewModel(id: $id, name: $name, job: $job, department: $department, profilePath: $profilePath)';
}


}

/// @nodoc
abstract mixin class _$CrewModelCopyWith<$Res> implements $CrewModelCopyWith<$Res> {
  factory _$CrewModelCopyWith(_CrewModel value, $Res Function(_CrewModel) _then) = __$CrewModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String job, String? department,@JsonKey(name: 'profile_path') String? profilePath
});




}
/// @nodoc
class __$CrewModelCopyWithImpl<$Res>
    implements _$CrewModelCopyWith<$Res> {
  __$CrewModelCopyWithImpl(this._self, this._then);

  final _CrewModel _self;
  final $Res Function(_CrewModel) _then;

/// Create a copy of CrewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? job = null,Object? department = freezed,Object? profilePath = freezed,}) {
  return _then(_CrewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,job: null == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,profilePath: freezed == profilePath ? _self.profilePath : profilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreditsModel {

 List<CastModel> get cast; List<CrewModel> get crew;
/// Create a copy of CreditsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditsModelCopyWith<CreditsModel> get copyWith => _$CreditsModelCopyWithImpl<CreditsModel>(this as CreditsModel, _$identity);

  /// Serializes this CreditsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditsModel&&const DeepCollectionEquality().equals(other.cast, cast)&&const DeepCollectionEquality().equals(other.crew, crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cast),const DeepCollectionEquality().hash(crew));

@override
String toString() {
  return 'CreditsModel(cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class $CreditsModelCopyWith<$Res>  {
  factory $CreditsModelCopyWith(CreditsModel value, $Res Function(CreditsModel) _then) = _$CreditsModelCopyWithImpl;
@useResult
$Res call({
 List<CastModel> cast, List<CrewModel> crew
});




}
/// @nodoc
class _$CreditsModelCopyWithImpl<$Res>
    implements $CreditsModelCopyWith<$Res> {
  _$CreditsModelCopyWithImpl(this._self, this._then);

  final CreditsModel _self;
  final $Res Function(CreditsModel) _then;

/// Create a copy of CreditsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cast = null,Object? crew = null,}) {
  return _then(CreditsModel(
cast: null == cast ? _self.cast : cast // ignore: cast_nullable_to_non_nullable
as List<CastModel>,crew: null == crew ? _self.crew : crew // ignore: cast_nullable_to_non_nullable
as List<CrewModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditsModel].
extension CreditsModelPatterns on CreditsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditsModel value)  $default,){
final _that = this;
switch (_that) {
case _CreditsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreditsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CastModel> cast,  List<CrewModel> crew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditsModel() when $default != null:
return $default(_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CastModel> cast,  List<CrewModel> crew)  $default,) {final _that = this;
switch (_that) {
case _CreditsModel():
return $default(_that.cast,_that.crew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CastModel> cast,  List<CrewModel> crew)?  $default,) {final _that = this;
switch (_that) {
case _CreditsModel() when $default != null:
return $default(_that.cast,_that.crew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditsModel implements CreditsModel {
  const _CreditsModel({ List<CastModel> cast = const [],  List<CrewModel> crew = const []}): _cast = cast,_crew = crew;
  factory _CreditsModel.fromJson(Map<String, dynamic> json) => _$CreditsModelFromJson(json);

 final  List<CastModel> _cast;
@override@JsonKey() List<CastModel> get cast {
  if (_cast is EqualUnmodifiableListView) return _cast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cast);
}

 final  List<CrewModel> _crew;
@override@JsonKey() List<CrewModel> get crew {
  if (_crew is EqualUnmodifiableListView) return _crew;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_crew);
}


/// Create a copy of CreditsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditsModelCopyWith<_CreditsModel> get copyWith => __$CreditsModelCopyWithImpl<_CreditsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditsModel&&const DeepCollectionEquality().equals(other._cast, _cast)&&const DeepCollectionEquality().equals(other._crew, _crew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cast),const DeepCollectionEquality().hash(_crew));

@override
String toString() {
  return 'CreditsModel(cast: $cast, crew: $crew)';
}


}

/// @nodoc
abstract mixin class _$CreditsModelCopyWith<$Res> implements $CreditsModelCopyWith<$Res> {
  factory _$CreditsModelCopyWith(_CreditsModel value, $Res Function(_CreditsModel) _then) = __$CreditsModelCopyWithImpl;
@override @useResult
$Res call({
 List<CastModel> cast, List<CrewModel> crew
});




}
/// @nodoc
class __$CreditsModelCopyWithImpl<$Res>
    implements _$CreditsModelCopyWith<$Res> {
  __$CreditsModelCopyWithImpl(this._self, this._then);

  final _CreditsModel _self;
  final $Res Function(_CreditsModel) _then;

/// Create a copy of CreditsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cast = null,Object? crew = null,}) {
  return _then(_CreditsModel(
cast: null == cast ? _self._cast : cast // ignore: cast_nullable_to_non_nullable
as List<CastModel>,crew: null == crew ? _self._crew : crew // ignore: cast_nullable_to_non_nullable
as List<CrewModel>,
  ));
}


}

// dart format on
