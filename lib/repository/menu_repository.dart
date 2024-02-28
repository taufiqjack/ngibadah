import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:monggo_sholat/models/doa_model.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_time_model.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/models/read_surah_model.dart';
import 'package:monggo_sholat/models/shollu_model/jadwal_sholat_model.dart';
import 'package:monggo_sholat/models/surah/surah_model.dart';
import 'package:monggo_sholat/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/database/db.dart';

class MenuRepo extends ChangeNotifier {
  Response? response;
  Dio dio = Dio();
  DateTime now = DateTime.now();
  final formatTime = new DateFormat('yyyy/MM/dd');

  Future<SholluModel?> getDashboard(BuildContext context) async {
    try {
      response = await dio.get('$SHOLLU' + '/${formatTime.format(now)}');
      notifyListeners();
      final parsed = response!.data;
      final data = SholluModel.fromJson(parsed);
      print('respon : $parsed');
      print('jadwal ${parsed['data']['jadwal']}');
      print(formatTime.format(now));
      return data;
    } catch (e) {}
    return null;
  }

  Future<List<SurahModel>?> getSurah(BuildContext context) async {
    try {
      response = await dio.get('$LIST_QURAN');
      notifyListeners();
      Iterable data = response!.data;
      List<SurahModel> listdata =
          data.map((map) => SurahModel.fromJson(map)).toList();
      print(' respon surah : $listdata');
      return listdata;
    } catch (e) {}
    return null;
  }

  Future<ReadSurahModel?> getDetailSurah(int id, BuildContext context) async {
    try {
      response = await dio.get('$READ_QURAN' + '/$id');
      notifyListeners();
      final parser = response!.data;
      final data = ReadSurahModel.fromJson(parser);
      print('quranDetail : $parser');
      return data;
    } catch (e) {}
    return null;
  }

  Future<HadisModel?> getHadis(BuildContext context) async {
    try {
      response = await dio.get('$HADIS');
      notifyListeners();
      final parsed = response!.data;
      final data = HadisModel.fromJson(parsed);
      print('hadis : $parsed');
      return data;
    } catch (e) {}
    return null;
  }

  Future<HadisDetailModel?> getHadisDetail(
      BuildContext context, String id) async {
    try {
      response = await dio.get('$HADIS$id?range=1-100');
      notifyListeners();
      final parsed = response!.data;
      // print('details : ${parsed['data']['hadiths']}');
      final data = HadisDetailModel.fromJson(parsed);
      print('detail hadis : $parsed');
      return data;
    } catch (e) {}
    return null;
  }

  Future<bool?> getCity(BuildContext context, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      response = await dio.get('$SEARCH/$city');
      notifyListeners();
      print('data ${response!.data}');
      if (response!.data.containsKey('error')) {
        prefs.setString('error', response!.data['message']);
        prefs.setString('status', response!.data['status'].toString());
        return false;
      } else {
        Map<String, dynamic> map = response!.data['data'];
        print('data ${response!.data}');
        prefs.setString('id', map['id']);
        prefs.setString('lokasi', map['lokasi']);
        return true;
      }
    } catch (e) {}
    return null;
  }

  Future<DoaModel?> getDoa(BuildContext context) async {
    try {
      response = await dio.get('$DOA' + '/all');
      notifyListeners();
      final parsed = response!.data;
      final data = DoaModel.fromJson(parsed);
      print('doa : $parsed');
      return data;
    } catch (e) {}
    return null;
  }

  Future getTimestamp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      response = await dio.get(TIMESTAMP);
      notifyListeners();
      final parser = response!.data;
      print('timestamp : $parser');
      if (response!.data.containsKey('error')) {
        prefs.setString('error', response!.data['data']);
        prefs.setString('status', response!.data['status'].toString());
      } else {
        prefs.setString('timings', response!.data['data']);
      }
    } catch (e) {}
    return null;
  }

  Future<PrayerTimeModel?> getPrayerTime(
      BuildContext context, String latitude, String longitude) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String timings = prefs.getString('timings') ?? '';

    try {
      response = await dio
          .get('$PRAY_TODAY$timings?latitude=$latitude&longitude=$longitude');
      notifyListeners();
      final parser = response!.data;
      final map = response!.data;
      // print('timi : $parsing ');
      // LocalDb.sql.insertPrayer(PrayerModel.fromJson(parsing));
      LocalDb.sql.insertPrayer(PrayerTimeModel.fromJson(map));
      final data = PrayerTimeModel.fromJson(parser);
      var magrib = '${data.data!.timings!.maghrib}';
      var dzuhur = '${data.data!.timings!.dhuhr}';
      var asar = '${data.data!.timings!.asr}';
      var isya = '${data.data!.timings!.isha}';
      var subuh = '${data.data!.timings!.fajr}';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('subuh', subuh);
      prefs.setString('maghrib', magrib);
      prefs.setString('isya', isya);
      prefs.setString('dzuhur', dzuhur);
      prefs.setString('asar', asar);

      // print('prayertime : $parser');
      return data;
    } catch (e) {}
    return null;
  }
}
