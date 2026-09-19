import 'package:mbooking/feature/home/data/datasource/movie/movie_remote_data_source.dart';
import 'package:mbooking/feature/home/data/repo/genre_cache/genre_cache.dart';
import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/repo/movie_repo/movie_repo.dart';

class MovieRepoImpl implements MovieRepo {
  final MovieRemoteDataSource _remoteDataSource;
  final GenreCache _genreCache;

  MovieRepoImpl(this._remoteDataSource, this._genreCache);

  @override
  Future<List<Movie>> fetchPopular({int page = 1}) async {
    final response = await _remoteDataSource.getPopular(page: page);
    final genreMap = await _genreCache.fetchGenreMap(); // Map<int, String>

    return response.results
        .map((dto) => dto.toEntity(genreNames: genreMap))
        .toList();
  }

  @override
  Future<List<Movie>> fetchUpcoming({int page = 1}) async {
    final response = await _remoteDataSource.getUpcoming(page: page);
    final genreMap = await _genreCache.fetchGenreMap(); // Map<int, String>

    return response.results
        .map((dto) => dto.toEntity(genreNames: genreMap))
        .toList();
  }

  @override
  Future<Movie> fetchMovieDetails({required int id}) async {
    final response = await _remoteDataSource.getMovieDetails(id: id);
    final genreMap = await _genreCache.fetchGenreMap(); // Map<int, String>

    return response.toEntity(genreNames: genreMap);
  }
}
