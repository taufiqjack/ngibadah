import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/constants/constants.dart';
import 'package:monggo_sholat/cores/component/toast.dart';
import 'package:monggo_sholat/cores/helper/dio_exception.dart';
import 'package:monggo_sholat/cores/rest/rest_contract.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model/hadis_model.dart';
import 'package:monggo_sholat/models/read_surah_model.dart';
import 'package:monggo_sholat/models/shollu_model/jadwal_sholat_model.dart';
import 'package:monggo_sholat/models/surah_model.dart';

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

  Future<List<SurahModel>?> getSurah(BuildContext context) async {
    try {
      var response = await _rest.getSurah();
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        Iterable data = response!.data;
        return data.map((e) => SurahModel.fromJson(e)).toList();
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

  Future<ReadSurahModel?> getDetailSurah(int id, BuildContext context) async {
    try {
      var response = await _rest.getDetailSurah(id);
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return ReadSurahModel.fromJson(map);
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

  Future<HadisModel?> getHadis(BuildContext context) async {
    try {
      var response = await _rest.getHadis();
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return HadisModel.fromJson(map);
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

  Future<HadisDetailModel?> getDetailHadis(int id, BuildContext context) async {
    try {
      var response = await _rest.getHadisDetail(id);
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return HadisDetailModel.fromJson(map);
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
