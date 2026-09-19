import 'package:mbooking/feature/home/data/model/movie/movie_list_response.dart';
import 'package:mbooking/feature/home/data/model/movie/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<MovieModel> getMovieDetails({required int id});
  Future<MovieListResponse> getPopular({int page = 1});
  Future<MovieListResponse> getUpcoming({int page = 1});
}
