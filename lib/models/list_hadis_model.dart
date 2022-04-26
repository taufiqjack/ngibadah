class HadisLocalModel {
  String? name;
  String? id;
  int? available;

  HadisLocalModel({
    this.name,
    this.id,
    this.available,
  });

  HadisLocalModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['id'] = id;
    data['available'] = available;
    return data;
  }
}
