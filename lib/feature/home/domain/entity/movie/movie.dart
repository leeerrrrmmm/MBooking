import 'package:equatable/equatable.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/movie_credits.dart';
import 'package:mbooking/feature/home/domain/enums/media_type_enums.dart';

import '../base/media.dart';
import '../value_objects/genre.dart';
import '../value_objects/media_id.dart';
import '../value_objects/media_image.dart';
import '../value_objects/media_rating.dart';
import '../value_objects/media_title.dart';

class Movie extends Equatable implements Media {
  @override
  final MediaId id;

  @override
  final MediaTitle title;

  @override
  final String overview;

  @override
  final DateTime? releaseDate;

  @override
  final MediaImage image;

  @override
  final List<Genre> genres;

  @override
  final MediaRating rating;

  @override
  final double popularity;

  @override
  final String originalLanguage;

  final int? runtime;

  final int? budget;
  final int? revenue;
  final MovieCredits? movieCredits;
  final String? certification; // ← рейтинг (PG-13, R, etc.)

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.releaseDate,
    required this.image,
    this.genres = const [],
    required this.rating,
    this.popularity = 0.0,
    this.originalLanguage = '',
    this.runtime,
    this.budget,
    this.revenue,
    this.movieCredits,
    this.certification,
  });

  @override
  MediaType get mediaType => MediaType.movie;

  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    releaseDate,
    image,
    genres,
    rating,
    popularity,
    originalLanguage,
    runtime,
    budget,
    revenue,
    movieCredits,
    certification,
  ];
}
