// data/model/movie/credits_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credits_model.freezed.dart';
part 'credits_model.g.dart';

@freezed
abstract class CastModel with _$CastModel {
  const factory CastModel({
    required int id,
    required String name,
    String? character,
    @JsonKey(name: 'profile_path') String? profilePath,
    @Default(0) int order,
  }) = _CastModel;

  factory CastModel.fromJson(Map<String, dynamic> json) =>
      _$CastModelFromJson(json);
}

@freezed
abstract class CrewModel with _$CrewModel {
  const factory CrewModel({
    required int id,
    required String name,
    required String job,
    String? department,
    @JsonKey(name: 'profile_path') String? profilePath,
  }) = _CrewModel;

  factory CrewModel.fromJson(Map<String, dynamic> json) =>
      _$CrewModelFromJson(json);
}

@freezed
abstract class CreditsModel with _$CreditsModel {
  const factory CreditsModel({
    @Default([]) List<CastModel> cast,
    @Default([]) List<CrewModel> crew,
  }) = _CreditsModel;

  factory CreditsModel.fromJson(Map<String, dynamic> json) =>
      _$CreditsModelFromJson(json);
}
