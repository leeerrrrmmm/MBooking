import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';
import 'package:mbooking/feature/home/domain/repo/movie_repo/movie_repo.dart';

class FetchMovieDetailsUsecase {
  final MovieRepo _repo;

  FetchMovieDetailsUsecase(this._repo);

  Future<Movie> call({required int id}) async {
    return _repo.fetchMovieDetails(id: id);
  }
}
