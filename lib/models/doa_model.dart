import 'package:freezed_annotation/freezed_annotation.dart';
part 'doa_model.freezed.dart';
part 'doa_model.g.dart';

@Freezed()
class DoaModel with _$DoaModel {
  const factory DoaModel({
    int? code,
    String? message,
    List<Data>? data,
  }) = _DoaModel;

  factory DoaModel.fromJson(Map<String, dynamic> json) =>
      _$DoaModelFromJson(json);
}

@Freezed()
class Data with _$Data {
  const factory Data({
    String? idDoa,
    String? nama,
    String? lafal,
    String? transliterasi,
    String? arti,
    String? riwayat,
    String? keterangan,
    List<String>? kataKunci,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

// class DoaModel {
//   int? code;
//   String? message;
//   List<Data>? data;

//   DoaModel({this.code, this.message, this.data});

//   DoaModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String? idDoa;
//   String? nama;
//   String? lafal;
//   String? transliterasi;
//   String? arti;
//   String? riwayat;
//   String? keterangan;
//   List<String>? kataKunci;

//   Data(
//       {this.idDoa,
//       this.nama,
//       this.lafal,
//       this.transliterasi,
//       this.arti,
//       this.riwayat,
//       this.keterangan,
//       this.kataKunci});

//   Data.fromJson(Map<String, dynamic> json) {
//     idDoa = json['id_doa'];
//     nama = json['nama'];
//     lafal = json['lafal'];
//     transliterasi = json['transliterasi'];
//     arti = json['arti'];
//     riwayat = json['riwayat'];
//     keterangan = null;
//     kataKunci = List.castFrom<dynamic, String>(json['kata_kunci']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id_doa'] = this.idDoa;
//     data['nama'] = this.nama;
//     data['lafal'] = this.lafal;
//     data['transliterasi'] = this.transliterasi;
//     data['arti'] = this.arti;
//     data['riwayat'] = this.riwayat;
//     data['keterangan'] = this.keterangan;
//     data['kata_kunci'] = this.kataKunci;
//     return data;
//   }
// }

