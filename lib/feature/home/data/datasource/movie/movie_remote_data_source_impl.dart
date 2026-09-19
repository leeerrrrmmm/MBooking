import 'package:dio/dio.dart';
import 'package:mbooking/feature/home/data/datasource/movie/movie_remote_data_source.dart';
import 'package:mbooking/feature/home/data/model/movie/movie_list_response.dart';
import 'package:mbooking/feature/home/data/model/movie/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio _dio;

  const MovieRemoteDataSourceImpl(this._dio);

  @override
  Future<MovieModel> getMovieDetails({required int id}) async {
    final response = await _dio.get(
      '/movie/$id',
      queryParameters: {'append_to_response': 'credits,release_dates'},
    );
    return MovieModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MovieListResponse> getPopular({int page = 1}) async {
    final response = await _dio.get(
      '/movie/popular',
      queryParameters: {'page': page, 'language': 'en-US'},
    );
    return MovieListResponse.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<MovieListResponse> getUpcoming({int page = 1}) async {
    final response = await _dio.get(
      '/movie/upcoming',
      queryParameters: {'page': page, 'language': 'en-US'},
    );
    return MovieListResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
