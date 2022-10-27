// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoaModel _$$_DoaModelFromJson(Map<String, dynamic> json) => _$_DoaModel(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DoaModelToJson(_$_DoaModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      idDoa: json['idDoa'] as String?,
      nama: json['nama'] as String?,
      lafal: json['lafal'] as String?,
      transliterasi: json['transliterasi'] as String?,
      arti: json['arti'] as String?,
      riwayat: json['riwayat'] as String?,
      keterangan: json['keterangan'] as String?,
      kataKunci: (json['kataKunci'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'idDoa': instance.idDoa,
      'nama': instance.nama,
      'lafal': instance.lafal,
      'transliterasi': instance.transliterasi,
      'arti': instance.arti,
      'riwayat': instance.riwayat,
      'keterangan': instance.keterangan,
      'kataKunci': instance.kataKunci,
    };
