// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'hadis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HadisModel _$$_HadisModelFromJson(Map<String, dynamic> json) =>
    _$_HadisModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool?,
    );

Map<String, dynamic> _$$_HadisModelToJson(_$_HadisModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      name: json['name'] as String?,
      id: json['id'] as String?,
      available: json['available'] as int?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'available': instance.available,
    };
