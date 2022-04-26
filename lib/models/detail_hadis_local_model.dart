class HadisDetailModel {
  int? number;
  String? arab;
  String? id;

  HadisDetailModel({
    this.number,
    this.arab,
    this.id,
  });

  HadisDetailModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = number;
    data['arab'] = arab;
    data['id'] = id;
    return data;
  }
}
