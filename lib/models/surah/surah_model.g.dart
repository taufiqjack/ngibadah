// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurahModelAdapter extends TypeAdapter<SurahModel> {
  @override
  final int typeId = 4;

  @override
  SurahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurahModel(
      nomor: fields[0] as int?,
      nama: fields[1] as String?,
      namaLatin: fields[2] as String?,
      jumlahAyat: fields[3] as int?,
      tempatTurun: fields[4] as String?,
      arti: fields[5] as String?,
      deskripsi: fields[6] as String?,
      audio: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SurahModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nomor)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.namaLatin)
      ..writeByte(3)
      ..write(obj.jumlahAyat)
      ..writeByte(4)
      ..write(obj.tempatTurun)
      ..writeByte(5)
      ..write(obj.arti)
      ..writeByte(6)
      ..write(obj.deskripsi)
      ..writeByte(7)
      ..write(obj.audio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurahModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
