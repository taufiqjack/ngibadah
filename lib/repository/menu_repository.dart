import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/services/api.dart';

class MenuRepo extends ChangeNotifier {
  Response? response;
  Dio dio = Dio();
  DateTime now = DateTime.now();
  final formatTime = new DateFormat('yyyy/MM/dd');

  Future<PrayerScheduleModel?> getDashboard(BuildContext context) async {
    try {
      response =
          await dio.get('${BaseUrl.shollu}' + '/${formatTime.format(now)}');
      notifyListeners();
      final parsed = response!.data;
      final data = PrayerScheduleModel.fromJson(parsed);
      print('respon : $parsed');
      print(formatTime.format(now));
      return data;
    } catch (e) {}
  }

  Future<List<SurahModel>?> getSurah(BuildContext context) async {
    try {
      response = await dio.get('${BaseUrl.listQuran}');
      notifyListeners();
      Iterable data = response!.data;
      List<SurahModel> listdata =
          data.map((map) => SurahModel.fromJson(map)).toList();
      print(' respon surah : $listdata');
      return listdata;
    } catch (e) {}
  }

  Future<HadisModel?> getHadis(BuildContext context) async {
    try {
      response = await dio.get('${BaseUrl.hadis}');
      notifyListeners();
      final parsed = response!.data;
      final data = HadisModel.fromJson(parsed);
      print('hadis : $parsed');
      return data;
    } catch (e) {}
  }

  Future<HadisDetailModel?> getHadisDetail(
      BuildContext context, String id) async {
    try {
      response = await dio.get('${BaseUrl.hadis}$id?range=1-100');
      notifyListeners();
      final parsed = response!.data;
      final data = HadisDetailModel.fromJson(parsed);
      print('detail hadis : $parsed');
      return data;
    } catch (e) {}
  }
}
