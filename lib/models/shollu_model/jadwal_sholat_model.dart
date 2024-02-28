import 'data.dart';
import 'request.dart';

class SholluModel {
  bool? status;
  Request? request;
  Data? data;

  SholluModel({this.status, this.request, this.data});

  factory SholluModel.fromJson(Map<String, dynamic> json) {
    return SholluModel(
      status: json['status'] as bool?,
      request: json['request'] == null
          ? null
          : Request.fromJson(json['request'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'request': request?.toJson(),
        'data': data?.toJson(),
      };
}
