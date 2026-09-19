import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/repo/movie_repo/movie_repo.dart';

class FetchPopularMovies {
  final MovieRepo _repository;

  const FetchPopularMovies(this._repository);

  Future<List<Movie>> call({int page = 1}) {
    return _repository.fetchPopular(page: page);
  }
}
