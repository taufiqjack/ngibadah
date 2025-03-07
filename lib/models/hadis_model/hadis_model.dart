import 'datum.dart';

class HadisModel {
  int? code;
  String? message;
  List<Datum>? data;
  bool? error;

  HadisModel({this.code, this.message, this.data, this.error});

  factory HadisModel.fromJson(Map<String, dynamic> json) => HadisModel(
        code: json['code'] as int?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        error: json['error'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'error': error,
      };
}
