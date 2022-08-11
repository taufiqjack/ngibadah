class PrayerModel {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  PrayerModel({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  PrayerModel.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Fajr'] = fajr;
    data['Sunrise'] = sunrise;
    data['Dhuhr'] = dhuhr;
    data['Asr'] = asr;
    data['Maghrib'] = maghrib;
    data['Isha'] = isha;
    data['Imsak'] = imsak;
    data['Midnight'] = midnight;
    data['Firstthird'] = firstthird;
    data['Lastthird'] = lastthird;
    return data;
  }
}
