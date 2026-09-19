// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_dates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReleaseDateItemModel _$ReleaseDateItemModelFromJson(
  Map<String, dynamic> json,
) => _ReleaseDateItemModel(
  certification: json['certification'] as String? ?? '',
  type: (json['type'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ReleaseDateItemModelToJson(
  _ReleaseDateItemModel instance,
) => <String, dynamic>{
  'certification': instance.certification,
  'type': instance.type,
};

_ReleaseDateResultModel _$ReleaseDateResultModelFromJson(
  Map<String, dynamic> json,
) => _ReleaseDateResultModel(
  country: json['iso_3166_1'] as String,
  releaseDates:
      (json['release_dates'] as List<dynamic>?)
          ?.map((e) => ReleaseDateItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ReleaseDateResultModelToJson(
  _ReleaseDateResultModel instance,
) => <String, dynamic>{
  'iso_3166_1': instance.country,
  'release_dates': instance.releaseDates,
};

_ReleaseDatesModel _$ReleaseDatesModelFromJson(Map<String, dynamic> json) =>
    _ReleaseDatesModel(
      results:
          (json['results'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ReleaseDateResultModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReleaseDatesModelToJson(_ReleaseDatesModel instance) =>
    <String, dynamic>{'results': instance.results};
