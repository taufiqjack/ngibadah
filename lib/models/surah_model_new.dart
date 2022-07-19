class SurahModelNova {
  String? arti;
  String? asma;
  int? ayat;
  String? nama;
  String? type;
  String? urut;
  String? audio;
  String? nomor;
  String? rukuk;
  String? keterangan;

  SurahModelNova(
      {this.arti,
      this.asma,
      this.ayat,
      this.nama,
      this.type,
      this.urut,
      this.audio,
      this.nomor,
      this.rukuk,
      this.keterangan});

  SurahModelNova.fromJson(Map<String, dynamic> json) {
    arti = json['arti'];
    asma = json['asma'];
    ayat = json['ayat'];
    nama = json['nama'];
    type = json['type'];
    urut = json['urut'];
    audio = json['audio'];
    nomor = json['nomor'];
    rukuk = json['rukuk'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arti'] = this.arti;
    data['asma'] = this.asma;
    data['ayat'] = this.ayat;
    data['nama'] = this.nama;
    data['type'] = this.type;
    data['urut'] = this.urut;
    data['audio'] = this.audio;
    data['nomor'] = this.nomor;
    data['rukuk'] = this.rukuk;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
