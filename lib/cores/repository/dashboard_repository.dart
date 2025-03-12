import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:monggo_sholat/core/constants/constants.dart';
import 'package:monggo_sholat/core/database/db.dart';
import 'package:monggo_sholat/cores/component/toast.dart';
import 'package:monggo_sholat/cores/helper/dio_exception.dart';
import 'package:monggo_sholat/cores/rest/rest_contract.dart';
import 'package:monggo_sholat/models/doa_model.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_time_model.dart';
import 'package:monggo_sholat/models/read_surah_model.dart';
import 'package:monggo_sholat/models/shollu_model/jadwal_sholat_model.dart';
import 'package:monggo_sholat/models/surah/surah_model.dart';
import 'package:monggo_sholat/models/timestamp_model.dart';

class DashboardRepository {
  final RestContract _rest = GetIt.instance.get<RestContract>();

  Future<TimestampModel?> getTimestamp(BuildContext context) async {
    try {
      var response = await _rest.getPrayerSchedule();
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        logg.setString('timings', response.data['data']);
        return TimestampModel.fromJson(map);
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

  Future<PrayerTimeModel?> getPrayerLocation(
      String latitude, String longitude, BuildContext context) async {
    try {
      var response = await _rest.getPrayerLoc(latitude, longitude);
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        LocalDb.sql.insertPrayer(PrayerTimeModel.fromJson(map));
        final data = PrayerTimeModel.fromJson(map);
        var magrib = '${data.data!.timings!.maghrib}';
        var dzuhur = '${data.data!.timings!.dhuhr}';
        var asar = '${data.data!.timings!.asr}';
        var isya = '${data.data!.timings!.isha}';
        var subuh = '${data.data!.timings!.fajr}';
        logg.setString('subuh', subuh);
        logg.setString('maghrib', magrib);
        logg.setString('isya', isya);
        logg.setString('dzuhur', dzuhur);
        logg.setString('asar', asar);
        return PrayerTimeModel.fromJson(map);
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
        Iterable data = response.data;
        List<SurahModel> listData =
            data.map((e) => SurahModel.fromJson(e)).toList();
        return listData;
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

  Future<DoaModel?> getDoa(BuildContext context) async {
    try {
      var response = await _rest.getDoa();
      var map = response.data;
      logg.setInt(STATUSCODE, response.statusCode!);
      if (response.statusCode == 200) {
        return DoaModel.fromJson(map);
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
