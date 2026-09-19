import 'package:mbooking/feature/home/domain/enums/media_type_enums.dart';

import '../value_objects/genre.dart';
import '../value_objects/media_id.dart';
import '../value_objects/media_image.dart';
import '../value_objects/media_rating.dart';
import '../value_objects/media_title.dart';

abstract class Media {
  MediaId get id;
  MediaTitle get title;
  String get overview;
  DateTime? get releaseDate;
  MediaImage get image;
  List<Genre> get genres;
  MediaRating get rating;
  double get popularity;
  String get originalLanguage;
  MediaType get mediaType;
}
