class HadisDetailsModel {
  int? number;
  String? arab;
  String? id;

  HadisDetailsModel({
    this.number,
    this.arab,
    this.id,
  });

  HadisDetailsModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['arab'] = this.arab;
    data['id'] = this.id;

    return data;
  }
}
