// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HadisModelImpl _$$HadisModelImplFromJson(Map<String, dynamic> json) =>
    _$HadisModelImpl(
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool?,
    );

Map<String, dynamic> _$$HadisModelImplToJson(_$HadisModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      name: json['name'] as String?,
      id: json['id'] as String?,
      available: (json['available'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'available': instance.available,
    };
