class JadwalSholatModel {
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

  JadwalSholatModel({
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

  JadwalSholatModel.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    imsak = json['imsak'];
    subuh = json['subuh'];
    terbit = json['terbit'];
    dhuha = json['dhuha'];
    dzuhur = json['dzuhur'];
    ashar = json['ashar'];
    maghrib = json['maghrib'];
    isya = json['isya'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tanggal'] = tanggal;
    data['imsak'] = imsak;
    data['subuh'] = subuh;
    data['terbit'] = terbit;
    data['dzuhur'] = dzuhur;
    data['ashar'] = ashar;
    data['maghrib'] = maghrib;
    data['isya'] = isya;
    data['date'] = date;
    return data;
  }
}
