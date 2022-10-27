// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'surah_model.freezed.dart';
part 'surah_model.g.dart';

@Freezed()
class SurahModel with _$SurahModel {
  const factory SurahModel({
    int? nomor,
    String? nama,
    @JsonKey(name: 'nama_latin') String? namaLatin,
    @JsonKey(name: 'jumlah_ayat') int? jumlahAyat,
    @JsonKey(name: 'tempat_turun') String? tempatTurun,
    String? arti,
    String? deskripsi,
    String? audio,
  }) = _SurahModel;

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);
}
// class SurahModel {
//   int? nomor;
//   String? nama;
//   String? namaLatin;
//   int? jumlahAyat;
//   String? tempatTurun;
//   String? arti;
//   String? deskripsi;
//   String? audio;

//   SurahModel({
//     this.nomor,
//     this.nama,
//     this.namaLatin,
//     this.jumlahAyat,
//     this.tempatTurun,
//     this.arti,
//     this.deskripsi,
//     this.audio,
//   });

//   SurahModel.fromJson(Map<String, dynamic> json) {
//     nomor = json['nomor'];
//     nama = json['nama'];
//     namaLatin = json['nama_latin'];
//     jumlahAyat = json['jumlah_ayat'];
//     tempatTurun = json['tempat_turun'];
//     arti = json['arti'];
//     deskripsi = json['deskripsi'];
//     audio = json['audio'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['nomor'] = nomor;
//     data['nama'] = nomor;
//     data['nama_latin'] = nomor;
//     data['jumlah_ayat'] = nomor;
//     data['tempat_turun'] = nomor;
//     data['arti'] = nomor;
//     data['deskripsi'] = nomor;
//     data['audio'] = nomor;

//     return data;
//   }
// }
