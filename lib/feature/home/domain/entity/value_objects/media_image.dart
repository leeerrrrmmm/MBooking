import 'package:equatable/equatable.dart';

class MediaImage extends Equatable {
  const MediaImage({this.posterPath, this.backdropPath});

  final String? posterPath;
  final String? backdropPath;

  static const _baseUrl = 'https://image.tmdb.org/t/p/';

  String? get posterUrl => _url(posterPath, size: 'w500');

  String? get backdropUrl => _url(backdropPath, size: 'w780');

  String? _url(String? path, {required String size}) {
    if (path == null || path.isEmpty) return null;
    return '$_baseUrl$size$path';
  }

  @override
  List<Object?> get props => [posterPath, backdropPath];
}
