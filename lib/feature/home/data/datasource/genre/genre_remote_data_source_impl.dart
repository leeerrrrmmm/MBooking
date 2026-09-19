import 'package:dio/dio.dart';
import 'package:mbooking/feature/home/data/datasource/genre/genre_remote_data_source.dart';
import 'package:mbooking/feature/home/data/model/genre/genre_model.dart';

class GenreRemoteDataSourceImpl implements GenreRemoteDataSource {
  GenreRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<GenreModel>> fetchGenres() async {
    final response = await _dio.get(
      '/genre/movie/list',
      queryParameters: {'language': 'en-US'},
    );

    final list = response.data['genres'] as List<dynamic>;
    return list
        .map((genre) => GenreModel.fromJson(genre as Map<String, dynamic>))
        .toList();
  }
}
