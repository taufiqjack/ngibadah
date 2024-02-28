class DataSholatModel {
  int? id;
  String? lokasi;
  String? daerah;

  DataSholatModel({
    this.id,
    this.lokasi,
    this.daerah,
  });

  DataSholatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lokasi = json['lokasi'];
    daerah = json['daerah'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['lokasi'] = lokasi;
    data['daerah'] = daerah;
    return data;
  }
}
