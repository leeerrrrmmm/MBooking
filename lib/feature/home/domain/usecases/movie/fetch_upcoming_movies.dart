import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/repo/movie_repo/movie_repo.dart';

class FetchUpcomingMovies {
  final MovieRepo _repository;

  const FetchUpcomingMovies(this._repository);

  Future<List<Movie>> call({int page = 1}) {
    return _repository.fetchUpcoming(page: page);
  }
}
