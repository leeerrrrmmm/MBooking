import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mbooking/feature/home/data/model/genre/genre_model.dart';
import 'package:mbooking/feature/home/data/model/movie/credits_model.dart';
import 'package:mbooking/feature/home/data/model/movie/release_dates_model.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/genre.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/media_id.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/media_image.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/media_rating.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/media_title.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/movie_credits.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
abstract class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required String title,
    @JsonKey(name: 'original_title') required String originalTitle,
    @Default('') String overview,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') @Default([]) List<int> genreIds,
    @JsonKey(name: 'vote_average') @Default(0.0) double voteAverage,
    @JsonKey(name: 'vote_count') @Default(0) int voteCount,
    @Default(0.0) double popularity,
    @JsonKey(name: 'original_language') @Default('') String originalLanguage,
    int? runtime,
    int? budget,
    int? revenue,
    CreditsModel? credits,
    @JsonKey(name: 'release_dates') ReleaseDatesModel? releaseDates,
    @Default([]) List<GenreModel> genres,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  const MovieModel._();

  Movie toEntity({Map<int, String>? genreNames}) {
    return Movie(
      id: MediaId(id),
      title: MediaTitle(title: title, originalTitle: originalTitle),
      overview: overview,
      releaseDate: _parseDate(releaseDate),
      image: MediaImage(posterPath: posterPath, backdropPath: backdropPath),
      genres: _mapGenres(genreNames),
      rating: MediaRating(average: voteAverage, voteCount: voteCount),
      popularity: popularity,
      originalLanguage: originalLanguage,
      runtime: runtime,
      budget: budget,
      revenue: revenue,
      movieCredits: _mapCredits(),
      certification: _extractCertification(),
    );
  }

  String? _extractCertification({String country = 'US'}) {
    final results = releaseDates?.results;
    if (results == null || results.isEmpty) return null;

    final preferred = results.where((r) => r.country == country);
    final target = preferred.isNotEmpty ? preferred.first : results.first;

    final theatrical = target.releaseDates.where(
      (rd) => rd.type == 3 && rd.certification.isNotEmpty,
    );

    if (theatrical.isNotEmpty) {
      return theatrical.first.certification;
    }

    return target.releaseDates
        .where((rd) => rd.certification.isNotEmpty)
        .map((rd) => rd.certification)
        .firstOrNull;
  }

  MovieCredits? _mapCredits() {
    if (credits == null) return null;

    final directors = credits!.crew
        .where((c) => c.job == 'Director')
        .map((c) => Director(name: c.name, profilePath: c.profilePath))
        .toList();

    final actors = [...credits!.cast]
      ..sort((a, b) => a.order.compareTo(b.order));

    if (directors.isEmpty && actors.isEmpty) return null;

    return MovieCredits(
      directors: directors,
      cast: actors
          .take(12)
          .map(
            (c) => Actor(
              name: c.name,
              profilePath: c.profilePath,
              character: c.character,
            ),
          )
          .toList(),
    );
  }

  /// List endpoints send `genre_ids`; detail endpoints send `genres`.
  List<Genre> _mapGenres(Map<int, String>? genreNames) {
    if (genres.isNotEmpty) {
      return genres.map((genre) => genre.toEntity()).toList();
    }
    if (genreNames == null) return [];
    return genreIds
        .where(genreNames.containsKey)
        .map((id) => Genre(id: id, name: genreNames[id]!))
        .toList();
  }

  DateTime? _parseDate(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    return DateTime.tryParse(raw);
  }
}
