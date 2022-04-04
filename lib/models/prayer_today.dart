class PrayerScheduleModel {
  bool? status;
  Data? data;

  PrayerScheduleModel({this.status, this.data});

  PrayerScheduleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? lokasi;
  String? daerah;
  Koordinat? koordinat;
  Jadwal? jadwal;

  Data({this.id, this.lokasi, this.daerah, this.koordinat, this.jadwal});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
    daerah = json['daerah'];
    koordinat = json['koordinat'] != null
        ? new Koordinat.fromJson(json['koordinat'])
        : null;
    jadwal =
        json['jadwal'] != null ? new Jadwal.fromJson(json['jadwal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lokasi'] = this.lokasi;
    data['daerah'] = this.daerah;
    if (this.koordinat != null) {
      data['koordinat'] = this.koordinat!.toJson();
    }
    if (this.jadwal != null) {
      data['jadwal'] = this.jadwal!.toJson();
    }
    return data;
  }
}

class Koordinat {
  double? lat;
  double? lon;
  String? lintang;
  String? bujur;

  Koordinat({this.lat, this.lon, this.lintang, this.bujur});

  Koordinat.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    lintang = json['lintang'];
    bujur = json['bujur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  Jadwal(
      {this.tanggal,
      this.imsak,
      this.subuh,
      this.terbit,
      this.dhuha,
      this.dzuhur,
      this.ashar,
      this.maghrib,
      this.isya,
      this.date});

  Jadwal.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tanggal'] = this.tanggal;
    data['imsak'] = this.imsak;
    data['subuh'] = this.subuh;
    data['terbit'] = this.terbit;
    data['dhuha'] = this.dhuha;
    data['dzuhur'] = this.dzuhur;
    data['ashar'] = this.ashar;
    data['maghrib'] = this.maghrib;
    data['isya'] = this.isya;
    data['date'] = this.date;
    return data;
  }
}
