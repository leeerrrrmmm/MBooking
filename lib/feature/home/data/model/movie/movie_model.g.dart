// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  originalTitle: json['original_title'] as String,
  overview: json['overview'] as String? ?? '',
  releaseDate: json['release_date'] as String?,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  genreIds:
      (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [],
  voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
  voteCount: (json['vote_count'] as num?)?.toInt() ?? 0,
  popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
  originalLanguage: json['original_language'] as String? ?? '',
  runtime: (json['runtime'] as num?)?.toInt(),
  budget: (json['budget'] as num?)?.toInt(),
  revenue: (json['revenue'] as num?)?.toInt(),
  credits: json['credits'] == null
      ? null
      : CreditsModel.fromJson(json['credits'] as Map<String, dynamic>),
  releaseDates: json['release_dates'] == null
      ? null
      : ReleaseDatesModel.fromJson(
          json['release_dates'] as Map<String, dynamic>,
        ),
  genres:
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MovieModelToJson(_MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'original_language': instance.originalLanguage,
      'runtime': instance.runtime,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'credits': instance.credits,
      'release_dates': instance.releaseDates,
      'genres': instance.genres,
    };
