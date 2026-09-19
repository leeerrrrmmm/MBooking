import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mbooking/feature/home/domain/entity/value_objects/genre.dart';

part 'genre_model.freezed.dart';
part 'genre_model.g.dart';

@freezed
abstract class GenreModel with _$GenreModel {
  const GenreModel._();

  const factory GenreModel({required int id, required String name}) =
      _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      _$GenreModelFromJson(json);

  Genre toEntity() => Genre(id: id, name: name);
}
