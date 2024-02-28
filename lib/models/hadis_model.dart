import 'package:freezed_annotation/freezed_annotation.dart';
part 'hadis_model.freezed.dart';
part 'hadis_model.g.dart';

@freezed
class HadisModel with _$HadisModel {
  const factory HadisModel({
    int? code,
    String? message,
    List<Data>? data,
    bool? error,
  }) = _HadisModel;

  factory HadisModel.fromJson(Map<String, dynamic> json) =>
      _$HadisModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? name,
    String? id,
    int? available,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

// class HadisModel {
//   int? code;
//   String? message;
//   List<Data>? data;
//   bool? error;

//   HadisModel({this.code, this.message, this.data, this.error});

//   HadisModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     error = json['error'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['error'] = this.error;
//     return data;
//   }
// }

// class Data {
//   String? name;
//   String? id;
//   int? available;

//   Data({this.name, this.id, this.available});

//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     id = json['id'];
//     available = json['available'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['id'] = this.id;
//     data['available'] = this.available;
//     return data;
//   }
// }
