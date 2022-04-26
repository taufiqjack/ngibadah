class DoaListModel {
  String? idDoa;
  String? nama;
  String? lafal;
  String? transliterasi;
  String? arti;
  String? riwayat;
  String? keterangan;

  DoaListModel({
    this.idDoa,
    this.nama,
    this.lafal,
    this.transliterasi,
    this.arti,
    this.riwayat,
    this.keterangan,
  });

  DoaListModel.fromJson(Map<String, dynamic> json) {
    idDoa = json['id_doa'];
    nama = json['nama'];
    lafal = json['lafal'];
    transliterasi = json['transliterasi'];
    arti = json['arti'];
    riwayat = json['riwayat'];
    keterangan = null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_doa'] = idDoa;
    data['nama'] = nama;
    data['lafal'] = lafal;
    data['transliterasi'] = transliterasi;
    data['arti'] = arti;
    data['riwayat'] = riwayat;
    data['keterangan'] = keterangan;
    return data;
  }
}
