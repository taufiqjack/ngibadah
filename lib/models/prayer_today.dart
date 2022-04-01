class PrayerScheduleModel {
  bool? status;
  Data? data;

  PrayerScheduleModel({
    this.status,
    this.data,
  });

  PrayerScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
  }
}

class Data {
  String? id;
  String? lokasi;
  String? daerah;
  Koordinat? koordinat;
  Jadwal? jadwal;

  Data({
    this.id,
    this.lokasi,
    this.daerah,
    this.koordinat,
    this.jadwal,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
    koordinat = json['koordinat'];
    id = json['id'];
  }
}

class Koordinat {
  int? lat;
  int? lon;
  String? lintang;
  String? bujur;

  Koordinat({
    this.lat,
    this.lon,
    this.lintang,
    this.bujur,
  });

  Koordinat.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lat = json['lon'];
    lintang = json['lintang'];
    bujur = json['bujur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['lintang'] = this.lintang;
    data['bujur'] = this.bujur;
    return data;
  }
}

class Jadwal {
  String? tanggal;
  String? imsak;
  String? shubuh;
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
    this.shubuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });

  Jadwal.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'];
    imsak = json['imsak'];
    shubuh = json['subuh'];
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
    data['subuh'] = shubuh;
    data['terbit'] = terbit;
    data['dhuha'] = dhuha;
    data['dzuhur'] = dzuhur;
    data['ashar'] = ashar;
    data['maghrib'] = maghrib;
    data['isya'] = isya;
    data['date'] = date;
    return data;
  }
}
