class TimestampModel {
  int? code;
  String? status;
  String? data;

  TimestampModel({this.code, this.status, this.data});

  factory TimestampModel.fromJson(Map<String, dynamic> json) {
    return TimestampModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: json['data'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data,
      };
}
