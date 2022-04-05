class HadisDetailModel {
  int? code;
  String? message;
  Data? data;
  bool? error;

  HadisDetailModel({this.code, this.message, this.data, this.error});

  HadisDetailModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String? name;
  String? id;
  int? available;
  int? requested;
  List<Hadiths>? hadiths;

  Data({this.name, this.id, this.available, this.requested, this.hadiths});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'];
    requested = json['requested'];
    if (json['hadiths'] != null) {
      hadiths = <Hadiths>[];
      json['hadiths'].forEach((v) {
        hadiths!.add(new Hadiths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['available'] = this.available;
    data['requested'] = this.requested;
    if (this.hadiths != null) {
      data['hadiths'] = this.hadiths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hadiths {
  int? number;
  String? arab;
  String? id;

  Hadiths({this.number, this.arab, this.id});

  Hadiths.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['arab'] = this.arab;
    data['id'] = this.id;
    return data;
  }
}
