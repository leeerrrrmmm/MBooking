// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieModel {

 int get id; String get title;@JsonKey(name: 'original_title') String get originalTitle; String get overview;@JsonKey(name: 'release_date') String? get releaseDate;@JsonKey(name: 'poster_path') String? get posterPath;@JsonKey(name: 'backdrop_path') String? get backdropPath;@JsonKey(name: 'genre_ids') List<int> get genreIds;@JsonKey(name: 'vote_average') double get voteAverage;@JsonKey(name: 'vote_count') int get voteCount; double get popularity;@JsonKey(name: 'original_language') String get originalLanguage; int? get runtime; int? get budget; int? get revenue; CreditsModel? get credits;@JsonKey(name: 'release_dates') ReleaseDatesModel? get releaseDates; List<GenreModel> get genres;
/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieModelCopyWith<MovieModel> get copyWith => _$MovieModelCopyWithImpl<MovieModel>(this as MovieModel, _$identity);

  /// Serializes this MovieModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other.genreIds, genreIds)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.releaseDates, releaseDates) || other.releaseDates == releaseDates)&&const DeepCollectionEquality().equals(other.genres, genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalTitle,overview,releaseDate,posterPath,backdropPath,const DeepCollectionEquality().hash(genreIds),voteAverage,voteCount,popularity,originalLanguage,runtime,budget,revenue,credits,releaseDates,const DeepCollectionEquality().hash(genres));

@override
String toString() {
  return 'MovieModel(id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, releaseDate: $releaseDate, posterPath: $posterPath, backdropPath: $backdropPath, genreIds: $genreIds, voteAverage: $voteAverage, voteCount: $voteCount, popularity: $popularity, originalLanguage: $originalLanguage, runtime: $runtime, budget: $budget, revenue: $revenue, credits: $credits, releaseDates: $releaseDates, genres: $genres)';
}


}

/// @nodoc
abstract mixin class $MovieModelCopyWith<$Res>  {
  factory $MovieModelCopyWith(MovieModel value, $Res Function(MovieModel) _then) = _$MovieModelCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'original_title') String originalTitle, String overview,@JsonKey(name: 'release_date') String? releaseDate,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'genre_ids') List<int> genreIds,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount, double popularity,@JsonKey(name: 'original_language') String originalLanguage, int? runtime, int? budget, int? revenue, CreditsModel? credits,@JsonKey(name: 'release_dates') ReleaseDatesModel? releaseDates, List<GenreModel> genres
});


$CreditsModelCopyWith<$Res>? get credits;$ReleaseDatesModelCopyWith<$Res>? get releaseDates;

}
/// @nodoc
class _$MovieModelCopyWithImpl<$Res>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._self, this._then);

  final MovieModel _self;
  final $Res Function(MovieModel) _then;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? originalTitle = null,Object? overview = null,Object? releaseDate = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? genreIds = null,Object? voteAverage = null,Object? voteCount = null,Object? popularity = null,Object? originalLanguage = null,Object? runtime = freezed,Object? budget = freezed,Object? revenue = freezed,Object? credits = freezed,Object? releaseDates = freezed,Object? genres = null,}) {
  return _then(MovieModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,genreIds: null == genreIds ? _self.genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int?,revenue: freezed == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int?,credits: freezed == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as CreditsModel?,releaseDates: freezed == releaseDates ? _self.releaseDates : releaseDates // ignore: cast_nullable_to_non_nullable
as ReleaseDatesModel?,genres: null == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,
  ));
}
/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreditsModelCopyWith<$Res>? get credits {
    if (_self.credits == null) {
    return null;
  }

  return $CreditsModelCopyWith<$Res>(_self.credits!, (value) {
    return _then(_self.copyWith(credits: value));
  });
}/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReleaseDatesModelCopyWith<$Res>? get releaseDates {
    if (_self.releaseDates == null) {
    return null;
  }

  return $ReleaseDatesModelCopyWith<$Res>(_self.releaseDates!, (value) {
    return _then(_self.copyWith(releaseDates: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieModel].
extension MovieModelPatterns on MovieModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'original_title')  String originalTitle,  String overview, @JsonKey(name: 'release_date')  String? releaseDate, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'genre_ids')  List<int> genreIds, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount,  double popularity, @JsonKey(name: 'original_language')  String originalLanguage,  int? runtime,  int? budget,  int? revenue,  CreditsModel? credits, @JsonKey(name: 'release_dates')  ReleaseDatesModel? releaseDates,  List<GenreModel> genres)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.releaseDate,_that.posterPath,_that.backdropPath,_that.genreIds,_that.voteAverage,_that.voteCount,_that.popularity,_that.originalLanguage,_that.runtime,_that.budget,_that.revenue,_that.credits,_that.releaseDates,_that.genres);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'original_title')  String originalTitle,  String overview, @JsonKey(name: 'release_date')  String? releaseDate, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'genre_ids')  List<int> genreIds, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount,  double popularity, @JsonKey(name: 'original_language')  String originalLanguage,  int? runtime,  int? budget,  int? revenue,  CreditsModel? credits, @JsonKey(name: 'release_dates')  ReleaseDatesModel? releaseDates,  List<GenreModel> genres)  $default,) {final _that = this;
switch (_that) {
case _MovieModel():
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.releaseDate,_that.posterPath,_that.backdropPath,_that.genreIds,_that.voteAverage,_that.voteCount,_that.popularity,_that.originalLanguage,_that.runtime,_that.budget,_that.revenue,_that.credits,_that.releaseDates,_that.genres);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'original_title')  String originalTitle,  String overview, @JsonKey(name: 'release_date')  String? releaseDate, @JsonKey(name: 'poster_path')  String? posterPath, @JsonKey(name: 'backdrop_path')  String? backdropPath, @JsonKey(name: 'genre_ids')  List<int> genreIds, @JsonKey(name: 'vote_average')  double voteAverage, @JsonKey(name: 'vote_count')  int voteCount,  double popularity, @JsonKey(name: 'original_language')  String originalLanguage,  int? runtime,  int? budget,  int? revenue,  CreditsModel? credits, @JsonKey(name: 'release_dates')  ReleaseDatesModel? releaseDates,  List<GenreModel> genres)?  $default,) {final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that.id,_that.title,_that.originalTitle,_that.overview,_that.releaseDate,_that.posterPath,_that.backdropPath,_that.genreIds,_that.voteAverage,_that.voteCount,_that.popularity,_that.originalLanguage,_that.runtime,_that.budget,_that.revenue,_that.credits,_that.releaseDates,_that.genres);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieModel extends MovieModel {
  const _MovieModel({required this.id, required this.title, @JsonKey(name: 'original_title') required this.originalTitle, this.overview = '', @JsonKey(name: 'release_date') this.releaseDate, @JsonKey(name: 'poster_path') this.posterPath, @JsonKey(name: 'backdrop_path') this.backdropPath, @JsonKey(name: 'genre_ids')  List<int> genreIds = const [], @JsonKey(name: 'vote_average') this.voteAverage = 0.0, @JsonKey(name: 'vote_count') this.voteCount = 0, this.popularity = 0.0, @JsonKey(name: 'original_language') this.originalLanguage = '', this.runtime, this.budget, this.revenue, this.credits, @JsonKey(name: 'release_dates') this.releaseDates,  List<GenreModel> genres = const []}): _genreIds = genreIds,_genres = genres,super._();
  factory _MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

@override final  int id;
@override final  String title;
@override@JsonKey(name: 'original_title') final  String originalTitle;
@override@JsonKey() final  String overview;
@override@JsonKey(name: 'release_date') final  String? releaseDate;
@override@JsonKey(name: 'poster_path') final  String? posterPath;
@override@JsonKey(name: 'backdrop_path') final  String? backdropPath;
 final  List<int> _genreIds;
@override@JsonKey(name: 'genre_ids') List<int> get genreIds {
  if (_genreIds is EqualUnmodifiableListView) return _genreIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genreIds);
}

@override@JsonKey(name: 'vote_average') final  double voteAverage;
@override@JsonKey(name: 'vote_count') final  int voteCount;
@override@JsonKey() final  double popularity;
@override@JsonKey(name: 'original_language') final  String originalLanguage;
@override final  int? runtime;
@override final  int? budget;
@override final  int? revenue;
@override final  CreditsModel? credits;
@override@JsonKey(name: 'release_dates') final  ReleaseDatesModel? releaseDates;
 final  List<GenreModel> _genres;
@override@JsonKey() List<GenreModel> get genres {
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genres);
}


/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieModelCopyWith<_MovieModel> get copyWith => __$MovieModelCopyWithImpl<_MovieModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.originalTitle, originalTitle) || other.originalTitle == originalTitle)&&(identical(other.overview, overview) || other.overview == overview)&&(identical(other.releaseDate, releaseDate) || other.releaseDate == releaseDate)&&(identical(other.posterPath, posterPath) || other.posterPath == posterPath)&&(identical(other.backdropPath, backdropPath) || other.backdropPath == backdropPath)&&const DeepCollectionEquality().equals(other._genreIds, _genreIds)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount)&&(identical(other.popularity, popularity) || other.popularity == popularity)&&(identical(other.originalLanguage, originalLanguage) || other.originalLanguage == originalLanguage)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.releaseDates, releaseDates) || other.releaseDates == releaseDates)&&const DeepCollectionEquality().equals(other._genres, _genres));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,originalTitle,overview,releaseDate,posterPath,backdropPath,const DeepCollectionEquality().hash(_genreIds),voteAverage,voteCount,popularity,originalLanguage,runtime,budget,revenue,credits,releaseDates,const DeepCollectionEquality().hash(_genres));

@override
String toString() {
  return 'MovieModel(id: $id, title: $title, originalTitle: $originalTitle, overview: $overview, releaseDate: $releaseDate, posterPath: $posterPath, backdropPath: $backdropPath, genreIds: $genreIds, voteAverage: $voteAverage, voteCount: $voteCount, popularity: $popularity, originalLanguage: $originalLanguage, runtime: $runtime, budget: $budget, revenue: $revenue, credits: $credits, releaseDates: $releaseDates, genres: $genres)';
}


}

/// @nodoc
abstract mixin class _$MovieModelCopyWith<$Res> implements $MovieModelCopyWith<$Res> {
  factory _$MovieModelCopyWith(_MovieModel value, $Res Function(_MovieModel) _then) = __$MovieModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'original_title') String originalTitle, String overview,@JsonKey(name: 'release_date') String? releaseDate,@JsonKey(name: 'poster_path') String? posterPath,@JsonKey(name: 'backdrop_path') String? backdropPath,@JsonKey(name: 'genre_ids') List<int> genreIds,@JsonKey(name: 'vote_average') double voteAverage,@JsonKey(name: 'vote_count') int voteCount, double popularity,@JsonKey(name: 'original_language') String originalLanguage, int? runtime, int? budget, int? revenue, CreditsModel? credits,@JsonKey(name: 'release_dates') ReleaseDatesModel? releaseDates, List<GenreModel> genres
});


@override $CreditsModelCopyWith<$Res>? get credits;@override $ReleaseDatesModelCopyWith<$Res>? get releaseDates;

}
/// @nodoc
class __$MovieModelCopyWithImpl<$Res>
    implements _$MovieModelCopyWith<$Res> {
  __$MovieModelCopyWithImpl(this._self, this._then);

  final _MovieModel _self;
  final $Res Function(_MovieModel) _then;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? originalTitle = null,Object? overview = null,Object? releaseDate = freezed,Object? posterPath = freezed,Object? backdropPath = freezed,Object? genreIds = null,Object? voteAverage = null,Object? voteCount = null,Object? popularity = null,Object? originalLanguage = null,Object? runtime = freezed,Object? budget = freezed,Object? revenue = freezed,Object? credits = freezed,Object? releaseDates = freezed,Object? genres = null,}) {
  return _then(_MovieModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,originalTitle: null == originalTitle ? _self.originalTitle : originalTitle // ignore: cast_nullable_to_non_nullable
as String,overview: null == overview ? _self.overview : overview // ignore: cast_nullable_to_non_nullable
as String,releaseDate: freezed == releaseDate ? _self.releaseDate : releaseDate // ignore: cast_nullable_to_non_nullable
as String?,posterPath: freezed == posterPath ? _self.posterPath : posterPath // ignore: cast_nullable_to_non_nullable
as String?,backdropPath: freezed == backdropPath ? _self.backdropPath : backdropPath // ignore: cast_nullable_to_non_nullable
as String?,genreIds: null == genreIds ? _self._genreIds : genreIds // ignore: cast_nullable_to_non_nullable
as List<int>,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,popularity: null == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as double,originalLanguage: null == originalLanguage ? _self.originalLanguage : originalLanguage // ignore: cast_nullable_to_non_nullable
as String,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as int?,budget: freezed == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int?,revenue: freezed == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as int?,credits: freezed == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as CreditsModel?,releaseDates: freezed == releaseDates ? _self.releaseDates : releaseDates // ignore: cast_nullable_to_non_nullable
as ReleaseDatesModel?,genres: null == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<GenreModel>,
  ));
}

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreditsModelCopyWith<$Res>? get credits {
    if (_self.credits == null) {
    return null;
  }

  return $CreditsModelCopyWith<$Res>(_self.credits!, (value) {
    return _then(_self.copyWith(credits: value));
  });
}/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReleaseDatesModelCopyWith<$Res>? get releaseDates {
    if (_self.releaseDates == null) {
    return null;
  }

  return $ReleaseDatesModelCopyWith<$Res>(_self.releaseDates!, (value) {
    return _then(_self.copyWith(releaseDates: value));
  });
}
}

// dart format on
