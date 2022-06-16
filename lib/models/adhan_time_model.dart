class AdhanTime {
  String? code;
  String? status;
  Data? data;

  AdhanTime({
    this.code,
    this.status,
    this.data,
  });

  AdhanTime.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['satus'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Timings? timings;
  Date? date;

  Data({
    this.timings,
    this.date,
  });

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (data['timings'] != null) {
      data[''] = this.timings!.toJson();
    }
    if (this.date != null) {
      data['date'] = this.date!.toJson();
    }
    return data;
  }
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
  });

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
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
    return data;
  }
}

class Date {
  String? readable;
  String? timestamps;
  Hijri? hijri;
  Gregorian? gregorian;

  Date({
    this.readable,
    this.timestamps,
    this.hijri,
    this.gregorian,
  });

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamps = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ? Gregorian.fromJson(json['gregorian'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['readable'] = readable;
    data['timestamp'] = timestamps;
    if (this.hijri != null) {
      data['hijri'] = this.hijri!.toJson();
    }
    if (this.gregorian != null) {
      data['gregorian'] = this.gregorian!.toJson();
    }
    return data;
  }
}

class Hijri {
  String? date;
  String? format;
  String? day;

  Hijri({
    this.date,
    this.format,
    this.day,
  });

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['format'] = format;
    data['day'] = day;
    return data;
  }
}

class Gregorian {
  String? date;
  String? format;
  String? day;

  Gregorian({
    this.date,
    this.format,
    this.day,
  });

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['format'] = format;
    data['day'] = day;
    return data;
  }
}
