// data/model/movie/release_dates_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_dates_model.freezed.dart';
part 'release_dates_model.g.dart';

@freezed
abstract class ReleaseDateItemModel with _$ReleaseDateItemModel {
  const factory ReleaseDateItemModel({
    @Default('') String certification,
    @Default(0) int type,
  }) = _ReleaseDateItemModel;

  factory ReleaseDateItemModel.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateItemModelFromJson(json);
}

@freezed
abstract class ReleaseDateResultModel with _$ReleaseDateResultModel {
  const factory ReleaseDateResultModel({
    @JsonKey(name: 'iso_3166_1') required String country,
    @JsonKey(name: 'release_dates')
    @Default([])
    List<ReleaseDateItemModel> releaseDates,
  }) = _ReleaseDateResultModel;

  factory ReleaseDateResultModel.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateResultModelFromJson(json);
}

@freezed
abstract class ReleaseDatesModel with _$ReleaseDatesModel {
  const factory ReleaseDatesModel({
    @Default([]) List<ReleaseDateResultModel> results,
  }) = _ReleaseDatesModel;

  factory ReleaseDatesModel.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDatesModelFromJson(json);
}
