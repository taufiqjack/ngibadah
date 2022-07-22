class ReadSurahModel {
  int? number;
  int? numberOfAyahs;
  String? name;
  String? translation;
  String? revelation;
  String? description;
  String? audio;
  Bismillah? bismillah;
  List<Ayahs>? ayahs;

  ReadSurahModel(
      {this.number,
      this.numberOfAyahs,
      this.name,
      this.translation,
      this.revelation,
      this.description,
      this.audio,
      this.bismillah,
      this.ayahs});

  ReadSurahModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberOfAyahs = json['numberOfAyahs'];
    name = json['name'];
    translation = json['translation'];
    revelation = json['revelation'];
    description = json['description'];
    audio = json['audio'];
    bismillah = json['bismillah'] != null
        ? new Bismillah.fromJson(json['bismillah'])
        : null;
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(new Ayahs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['numberOfAyahs'] = this.numberOfAyahs;
    data['name'] = this.name;
    data['translation'] = this.translation;
    data['revelation'] = this.revelation;
    data['description'] = this.description;
    data['audio'] = this.audio;
    if (this.bismillah != null) {
      data['bismillah'] = this.bismillah!.toJson();
    }
    if (this.ayahs != null) {
      data['ayahs'] = this.ayahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bismillah {
  String? arab;
  String? translation;
  Audio? audio;

  Bismillah({this.arab, this.translation, this.audio});

  Bismillah.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    translation = json['translation'];
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arab'] = this.arab;
    data['translation'] = this.translation;
    if (this.audio != null) {
      data['audio'] = this.audio!.toJson();
    }
    return data;
  }
}

class Audio {
  String? alafasy;
  String? ahmedajamy;
  String? husarymujawwad;
  String? minshawi;
  String? muhammadayyoub;
  String? muhammadjibreel;

  Audio(
      {this.alafasy,
      this.ahmedajamy,
      this.husarymujawwad,
      this.minshawi,
      this.muhammadayyoub,
      this.muhammadjibreel});

  Audio.fromJson(Map<String, dynamic> json) {
    alafasy = json['alafasy'];
    ahmedajamy = json['ahmedajamy'];
    husarymujawwad = json['husarymujawwad'];
    minshawi = json['minshawi'];
    muhammadayyoub = json['muhammadayyoub'];
    muhammadjibreel = json['muhammadjibreel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alafasy'] = this.alafasy;
    data['ahmedajamy'] = this.ahmedajamy;
    data['husarymujawwad'] = this.husarymujawwad;
    data['minshawi'] = this.minshawi;
    data['muhammadayyoub'] = this.muhammadayyoub;
    data['muhammadjibreel'] = this.muhammadjibreel;
    return data;
  }
}

class Ayahs {
  Number? number;
  String? arab;
  String? translation;
  Audio? audio;
  Image? image;
  Tafsir? tafsir;
  Meta? meta;

  Ayahs(
      {this.number,
      this.arab,
      this.translation,
      this.audio,
      this.image,
      this.tafsir,
      this.meta});

  Ayahs.fromJson(Map<String, dynamic> json) {
    number =
        json['number'] != null ? new Number.fromJson(json['number']) : null;
    arab = json['arab'];
    translation = json['translation'];
    audio = json['audio'] != null ? new Audio.fromJson(json['audio']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    tafsir =
        json['tafsir'] != null ? new Tafsir.fromJson(json['tafsir']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.number != null) {
      data['number'] = this.number!.toJson();
    }
    data['arab'] = this.arab;
    data['translation'] = this.translation;
    if (this.audio != null) {
      data['audio'] = this.audio!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.tafsir != null) {
      data['tafsir'] = this.tafsir!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Number {
  int? inQuran;
  int? inSurah;

  Number({this.inQuran, this.inSurah});

  Number.fromJson(Map<String, dynamic> json) {
    inQuran = json['inQuran'];
    inSurah = json['inSurah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inQuran'] = this.inQuran;
    data['inSurah'] = this.inSurah;
    return data;
  }
}

class Image {
  String? primary;
  String? secondary;

  Image({this.primary, this.secondary});

  Image.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primary'] = this.primary;
    data['secondary'] = this.secondary;
    return data;
  }
}

class Tafsir {
  Kemenag? kemenag;
  String? quraish;
  String? jalalayn;

  Tafsir({this.kemenag, this.quraish, this.jalalayn});

  Tafsir.fromJson(Map<String, dynamic> json) {
    kemenag =
        json['kemenag'] != null ? new Kemenag.fromJson(json['kemenag']) : null;
    quraish = json['quraish'];
    jalalayn = json['jalalayn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kemenag != null) {
      data['kemenag'] = this.kemenag!.toJson();
    }
    data['quraish'] = this.quraish;
    data['jalalayn'] = this.jalalayn;
    return data;
  }
}

class Kemenag {
  String? short;
  String? long;

  Kemenag({this.short, this.long});

  Kemenag.fromJson(Map<String, dynamic> json) {
    short = json['short'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short'] = this.short;
    data['long'] = this.long;
    return data;
  }
}

class Meta {
  int? juz;
  int? page;
  int? manzil;
  int? ruku;
  int? hizbQuarter;
  Sajda? sajda;

  Meta(
      {this.juz,
      this.page,
      this.manzil,
      this.ruku,
      this.hizbQuarter,
      this.sajda});

  Meta.fromJson(Map<String, dynamic> json) {
    juz = json['juz'];
    page = json['page'];
    manzil = json['manzil'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'] != null ? new Sajda.fromJson(json['sajda']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['juz'] = this.juz;
    data['page'] = this.page;
    data['manzil'] = this.manzil;
    data['ruku'] = this.ruku;
    data['hizbQuarter'] = this.hizbQuarter;
    if (this.sajda != null) {
      data['sajda'] = this.sajda!.toJson();
    }
    return data;
  }
}

class Sajda {
  bool? recommended;
  bool? obligatory;

  Sajda({this.recommended, this.obligatory});

  Sajda.fromJson(Map<String, dynamic> json) {
    recommended = json['recommended'];
    obligatory = json['obligatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recommended'] = this.recommended;
    data['obligatory'] = this.obligatory;
    return data;
  }
}
