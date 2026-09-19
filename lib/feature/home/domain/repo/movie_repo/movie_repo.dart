import 'package:mbooking/feature/home/domain/entity/movie/movie.dart';

abstract class MovieRepo {
  Future<Movie> fetchMovieDetails({required int id});
  Future<List<Movie>> fetchPopular({int page = 1});
  Future<List<Movie>> fetchUpcoming({int page = 1});
}
