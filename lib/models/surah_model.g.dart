// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'surah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurahModel _$$_SurahModelFromJson(Map<String, dynamic> json) =>
    _$_SurahModel(
      nomor: json['nomor'] as int?,
      nama: json['nama'] as String?,
      namaLatin: json['nama_latin'] as String?,
      jumlahAyat: json['jumlah_ayat'] as int?,
      tempatTurun: json['tempat_turun'] as String?,
      arti: json['arti'] as String?,
      deskripsi: json['deskripsi'] as String?,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$$_SurahModelToJson(_$_SurahModel instance) =>
    <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'nama_latin': instance.namaLatin,
      'jumlah_ayat': instance.jumlahAyat,
      'tempat_turun': instance.tempatTurun,
      'arti': instance.arti,
      'deskripsi': instance.deskripsi,
      'audio': instance.audio,
    };
