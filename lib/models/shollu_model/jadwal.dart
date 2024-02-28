class Jadwal {
  String? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  Jadwal({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        tanggal: json['tanggal'] as String?,
        imsak: json['imsak'] as String?,
        subuh: json['subuh'] as String?,
        terbit: json['terbit'] as String?,
        dhuha: json['dhuha'] as String?,
        dzuhur: json['dzuhur'] as String?,
        ashar: json['ashar'] as String?,
        maghrib: json['maghrib'] as String?,
        isya: json['isya'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tanggal': tanggal,
        'imsak': imsak,
        'subuh': subuh,
        'terbit': terbit,
        'dhuha': dhuha,
        'dzuhur': dzuhur,
        'ashar': ashar,
        'maghrib': maghrib,
        'isya': isya,
        'date': date,
      };
}
