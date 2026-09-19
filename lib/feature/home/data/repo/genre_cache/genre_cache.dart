import 'package:mbooking/feature/home/data/datasource/genre/genre_remote_data_source.dart';

class GenreCache {
  GenreCache(this._remoteDataSource);

  final GenreRemoteDataSource _remoteDataSource;
  Map<int, String>? _genreMap;

  Future<Map<int, String>> fetchGenreMap() async {
    if (_genreMap != null) return _genreMap!;

    final genres = await _remoteDataSource.fetchGenres();
    _genreMap = {for (final genre in genres) genre.id: genre.name};
    return _genreMap!;
  }
}
