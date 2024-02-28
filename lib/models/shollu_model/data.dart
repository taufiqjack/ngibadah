import 'jadwal.dart';

class Data {
  int? id;
  String? lokasi;
  String? daerah;
  Jadwal? jadwal;

  Data({this.id, this.lokasi, this.daerah, this.jadwal});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        lokasi: json['lokasi'] as String?,
        daerah: json['daerah'] as String?,
        jadwal: json['jadwal'] == null
            ? null
            : Jadwal.fromJson(json['jadwal'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'lokasi': lokasi,
        'daerah': daerah,
        'jadwal': jadwal?.toJson(),
      };
}
