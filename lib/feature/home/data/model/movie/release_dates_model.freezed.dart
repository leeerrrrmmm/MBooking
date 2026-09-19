// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'release_dates_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReleaseDateItemModel {

 String get certification; int get type;
/// Create a copy of ReleaseDateItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReleaseDateItemModelCopyWith<ReleaseDateItemModel> get copyWith => _$ReleaseDateItemModelCopyWithImpl<ReleaseDateItemModel>(this as ReleaseDateItemModel, _$identity);

  /// Serializes this ReleaseDateItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReleaseDateItemModel&&(identical(other.certification, certification) || other.certification == certification)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,certification,type);

@override
String toString() {
  return 'ReleaseDateItemModel(certification: $certification, type: $type)';
}


}

/// @nodoc
abstract mixin class $ReleaseDateItemModelCopyWith<$Res>  {
  factory $ReleaseDateItemModelCopyWith(ReleaseDateItemModel value, $Res Function(ReleaseDateItemModel) _then) = _$ReleaseDateItemModelCopyWithImpl;
@useResult
$Res call({
 String certification, int type
});




}
/// @nodoc
class _$ReleaseDateItemModelCopyWithImpl<$Res>
    implements $ReleaseDateItemModelCopyWith<$Res> {
  _$ReleaseDateItemModelCopyWithImpl(this._self, this._then);

  final ReleaseDateItemModel _self;
  final $Res Function(ReleaseDateItemModel) _then;

/// Create a copy of ReleaseDateItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? certification = null,Object? type = null,}) {
  return _then(ReleaseDateItemModel(
certification: null == certification ? _self.certification : certification // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReleaseDateItemModel].
extension ReleaseDateItemModelPatterns on ReleaseDateItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReleaseDateItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReleaseDateItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReleaseDateItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ReleaseDateItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReleaseDateItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReleaseDateItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String certification,  int type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReleaseDateItemModel() when $default != null:
return $default(_that.certification,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String certification,  int type)  $default,) {final _that = this;
switch (_that) {
case _ReleaseDateItemModel():
return $default(_that.certification,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String certification,  int type)?  $default,) {final _that = this;
switch (_that) {
case _ReleaseDateItemModel() when $default != null:
return $default(_that.certification,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReleaseDateItemModel implements ReleaseDateItemModel {
  const _ReleaseDateItemModel({this.certification = '', this.type = 0});
  factory _ReleaseDateItemModel.fromJson(Map<String, dynamic> json) => _$ReleaseDateItemModelFromJson(json);

@override@JsonKey() final  String certification;
@override@JsonKey() final  int type;

/// Create a copy of ReleaseDateItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReleaseDateItemModelCopyWith<_ReleaseDateItemModel> get copyWith => __$ReleaseDateItemModelCopyWithImpl<_ReleaseDateItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReleaseDateItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReleaseDateItemModel&&(identical(other.certification, certification) || other.certification == certification)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,certification,type);

@override
String toString() {
  return 'ReleaseDateItemModel(certification: $certification, type: $type)';
}


}

/// @nodoc
abstract mixin class _$ReleaseDateItemModelCopyWith<$Res> implements $ReleaseDateItemModelCopyWith<$Res> {
  factory _$ReleaseDateItemModelCopyWith(_ReleaseDateItemModel value, $Res Function(_ReleaseDateItemModel) _then) = __$ReleaseDateItemModelCopyWithImpl;
@override @useResult
$Res call({
 String certification, int type
});




}
/// @nodoc
class __$ReleaseDateItemModelCopyWithImpl<$Res>
    implements _$ReleaseDateItemModelCopyWith<$Res> {
  __$ReleaseDateItemModelCopyWithImpl(this._self, this._then);

  final _ReleaseDateItemModel _self;
  final $Res Function(_ReleaseDateItemModel) _then;

/// Create a copy of ReleaseDateItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? certification = null,Object? type = null,}) {
  return _then(_ReleaseDateItemModel(
certification: null == certification ? _self.certification : certification // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReleaseDateResultModel {

@JsonKey(name: 'iso_3166_1') String get country;@JsonKey(name: 'release_dates') List<ReleaseDateItemModel> get releaseDates;
/// Create a copy of ReleaseDateResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReleaseDateResultModelCopyWith<ReleaseDateResultModel> get copyWith => _$ReleaseDateResultModelCopyWithImpl<ReleaseDateResultModel>(this as ReleaseDateResultModel, _$identity);

  /// Serializes this ReleaseDateResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReleaseDateResultModel&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.releaseDates, releaseDates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,const DeepCollectionEquality().hash(releaseDates));

@override
String toString() {
  return 'ReleaseDateResultModel(country: $country, releaseDates: $releaseDates)';
}


}

/// @nodoc
abstract mixin class $ReleaseDateResultModelCopyWith<$Res>  {
  factory $ReleaseDateResultModelCopyWith(ReleaseDateResultModel value, $Res Function(ReleaseDateResultModel) _then) = _$ReleaseDateResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'iso_3166_1') String country,@JsonKey(name: 'release_dates') List<ReleaseDateItemModel> releaseDates
});




}
/// @nodoc
class _$ReleaseDateResultModelCopyWithImpl<$Res>
    implements $ReleaseDateResultModelCopyWith<$Res> {
  _$ReleaseDateResultModelCopyWithImpl(this._self, this._then);

  final ReleaseDateResultModel _self;
  final $Res Function(ReleaseDateResultModel) _then;

/// Create a copy of ReleaseDateResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,Object? releaseDates = null,}) {
  return _then(ReleaseDateResultModel(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,releaseDates: null == releaseDates ? _self.releaseDates : releaseDates // ignore: cast_nullable_to_non_nullable
as List<ReleaseDateItemModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReleaseDateResultModel].
extension ReleaseDateResultModelPatterns on ReleaseDateResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReleaseDateResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReleaseDateResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReleaseDateResultModel value)  $default,){
final _that = this;
switch (_that) {
case _ReleaseDateResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReleaseDateResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReleaseDateResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'iso_3166_1')  String country, @JsonKey(name: 'release_dates')  List<ReleaseDateItemModel> releaseDates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReleaseDateResultModel() when $default != null:
return $default(_that.country,_that.releaseDates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'iso_3166_1')  String country, @JsonKey(name: 'release_dates')  List<ReleaseDateItemModel> releaseDates)  $default,) {final _that = this;
switch (_that) {
case _ReleaseDateResultModel():
return $default(_that.country,_that.releaseDates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'iso_3166_1')  String country, @JsonKey(name: 'release_dates')  List<ReleaseDateItemModel> releaseDates)?  $default,) {final _that = this;
switch (_that) {
case _ReleaseDateResultModel() when $default != null:
return $default(_that.country,_that.releaseDates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReleaseDateResultModel implements ReleaseDateResultModel {
  const _ReleaseDateResultModel({@JsonKey(name: 'iso_3166_1') required this.country, @JsonKey(name: 'release_dates')  List<ReleaseDateItemModel> releaseDates = const []}): _releaseDates = releaseDates;
  factory _ReleaseDateResultModel.fromJson(Map<String, dynamic> json) => _$ReleaseDateResultModelFromJson(json);

@override@JsonKey(name: 'iso_3166_1') final  String country;
 final  List<ReleaseDateItemModel> _releaseDates;
@override@JsonKey(name: 'release_dates') List<ReleaseDateItemModel> get releaseDates {
  if (_releaseDates is EqualUnmodifiableListView) return _releaseDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_releaseDates);
}


/// Create a copy of ReleaseDateResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReleaseDateResultModelCopyWith<_ReleaseDateResultModel> get copyWith => __$ReleaseDateResultModelCopyWithImpl<_ReleaseDateResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReleaseDateResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReleaseDateResultModel&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._releaseDates, _releaseDates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,const DeepCollectionEquality().hash(_releaseDates));

@override
String toString() {
  return 'ReleaseDateResultModel(country: $country, releaseDates: $releaseDates)';
}


}

/// @nodoc
abstract mixin class _$ReleaseDateResultModelCopyWith<$Res> implements $ReleaseDateResultModelCopyWith<$Res> {
  factory _$ReleaseDateResultModelCopyWith(_ReleaseDateResultModel value, $Res Function(_ReleaseDateResultModel) _then) = __$ReleaseDateResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'iso_3166_1') String country,@JsonKey(name: 'release_dates') List<ReleaseDateItemModel> releaseDates
});




}
/// @nodoc
class __$ReleaseDateResultModelCopyWithImpl<$Res>
    implements _$ReleaseDateResultModelCopyWith<$Res> {
  __$ReleaseDateResultModelCopyWithImpl(this._self, this._then);

  final _ReleaseDateResultModel _self;
  final $Res Function(_ReleaseDateResultModel) _then;

/// Create a copy of ReleaseDateResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,Object? releaseDates = null,}) {
  return _then(_ReleaseDateResultModel(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,releaseDates: null == releaseDates ? _self._releaseDates : releaseDates // ignore: cast_nullable_to_non_nullable
as List<ReleaseDateItemModel>,
  ));
}


}


/// @nodoc
mixin _$ReleaseDatesModel {

 List<ReleaseDateResultModel> get results;
/// Create a copy of ReleaseDatesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReleaseDatesModelCopyWith<ReleaseDatesModel> get copyWith => _$ReleaseDatesModelCopyWithImpl<ReleaseDatesModel>(this as ReleaseDatesModel, _$identity);

  /// Serializes this ReleaseDatesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReleaseDatesModel&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'ReleaseDatesModel(results: $results)';
}


}

/// @nodoc
abstract mixin class $ReleaseDatesModelCopyWith<$Res>  {
  factory $ReleaseDatesModelCopyWith(ReleaseDatesModel value, $Res Function(ReleaseDatesModel) _then) = _$ReleaseDatesModelCopyWithImpl;
@useResult
$Res call({
 List<ReleaseDateResultModel> results
});




}
/// @nodoc
class _$ReleaseDatesModelCopyWithImpl<$Res>
    implements $ReleaseDatesModelCopyWith<$Res> {
  _$ReleaseDatesModelCopyWithImpl(this._self, this._then);

  final ReleaseDatesModel _self;
  final $Res Function(ReleaseDatesModel) _then;

/// Create a copy of ReleaseDatesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(ReleaseDatesModel(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<ReleaseDateResultModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReleaseDatesModel].
extension ReleaseDatesModelPatterns on ReleaseDatesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReleaseDatesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReleaseDatesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReleaseDatesModel value)  $default,){
final _that = this;
switch (_that) {
case _ReleaseDatesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReleaseDatesModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReleaseDatesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReleaseDateResultModel> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReleaseDatesModel() when $default != null:
return $default(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReleaseDateResultModel> results)  $default,) {final _that = this;
switch (_that) {
case _ReleaseDatesModel():
return $default(_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReleaseDateResultModel> results)?  $default,) {final _that = this;
switch (_that) {
case _ReleaseDatesModel() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReleaseDatesModel implements ReleaseDatesModel {
  const _ReleaseDatesModel({ List<ReleaseDateResultModel> results = const []}): _results = results;
  factory _ReleaseDatesModel.fromJson(Map<String, dynamic> json) => _$ReleaseDatesModelFromJson(json);

 final  List<ReleaseDateResultModel> _results;
@override@JsonKey() List<ReleaseDateResultModel> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ReleaseDatesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReleaseDatesModelCopyWith<_ReleaseDatesModel> get copyWith => __$ReleaseDatesModelCopyWithImpl<_ReleaseDatesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReleaseDatesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReleaseDatesModel&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ReleaseDatesModel(results: $results)';
}


}

/// @nodoc
abstract mixin class _$ReleaseDatesModelCopyWith<$Res> implements $ReleaseDatesModelCopyWith<$Res> {
  factory _$ReleaseDatesModelCopyWith(_ReleaseDatesModel value, $Res Function(_ReleaseDatesModel) _then) = __$ReleaseDatesModelCopyWithImpl;
@override @useResult
$Res call({
 List<ReleaseDateResultModel> results
});




}
/// @nodoc
class __$ReleaseDatesModelCopyWithImpl<$Res>
    implements _$ReleaseDatesModelCopyWith<$Res> {
  __$ReleaseDatesModelCopyWithImpl(this._self, this._then);

  final _ReleaseDatesModel _self;
  final $Res Function(_ReleaseDatesModel) _then;

/// Create a copy of ReleaseDatesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_ReleaseDatesModel(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<ReleaseDateResultModel>,
  ));
}


}

// dart format on
