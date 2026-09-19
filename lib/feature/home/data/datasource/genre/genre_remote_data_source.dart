import 'package:mbooking/feature/home/data/model/genre/genre_model.dart';

abstract class GenreRemoteDataSource {
  Future<List<GenreModel>> fetchGenres();
}
