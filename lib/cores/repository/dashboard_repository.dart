import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/constants/constants.dart';
import 'package:monggo_sholat/cores/component/toast.dart';
import 'package:monggo_sholat/cores/helper/dio_exception.dart';
import 'package:monggo_sholat/cores/rest/rest_contract.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/models/shollu_model/jadwal_sholat_model.dart';

class DashboardRepository {
  final _rest = locator.get<RestContract>();
  Future<SholluModel?> getSchedule(BuildContext context) async {
    try {
      var response = await _rest.getPrayerSchedule();
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return SholluModel.fromJson(map);
      } else {
        logg.setString(MESSAGE, response.data['message']);
        toast(context, logg.getString(MESSAGE).toString());
        throw Exception(map[MESSAGE]);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
