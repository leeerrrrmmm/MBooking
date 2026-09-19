// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CastModel _$CastModelFromJson(Map<String, dynamic> json) => _CastModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  character: json['character'] as String?,
  profilePath: json['profile_path'] as String?,
  order: (json['order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CastModelToJson(_CastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profilePath,
      'order': instance.order,
    };

_CrewModel _$CrewModelFromJson(Map<String, dynamic> json) => _CrewModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  job: json['job'] as String,
  department: json['department'] as String?,
  profilePath: json['profile_path'] as String?,
);

Map<String, dynamic> _$CrewModelToJson(_CrewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'job': instance.job,
      'department': instance.department,
      'profile_path': instance.profilePath,
    };

_CreditsModel _$CreditsModelFromJson(Map<String, dynamic> json) =>
    _CreditsModel(
      cast:
          (json['cast'] as List<dynamic>?)
              ?.map((e) => CastModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      crew:
          (json['crew'] as List<dynamic>?)
              ?.map((e) => CrewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CreditsModelToJson(_CreditsModel instance) =>
    <String, dynamic>{'cast': instance.cast, 'crew': instance.crew};
