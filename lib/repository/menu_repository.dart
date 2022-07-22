import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:monggo_sholat/models/doa_model.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/models/read_surah_model.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      print('jadwal ${parsed['data']['jadwal']}');
      var magrib = '${data.data!.jadwal!.maghrib}';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('maghrib', magrib);
      print(formatTime.format(now));
      return data;
    } catch (e) {}
    return null;
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
    return null;
  }

  Future<ReadSurahModel?> getDetailSurah(int id, BuildContext context) async {
    try {
      response = await dio.get('${BaseUrl.readQuran}' + '/$id');
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
      response = await dio.get('${BaseUrl.hadis}');
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
      response = await dio.get('${BaseUrl.hadis}$id?range=1-100');
      notifyListeners();
      final parsed = response!.data;
      final data = HadisDetailModel.fromJson(parsed);
      print('detail hadis : $parsed');
      return data;
    } catch (e) {}
    return null;
  }

  Future<bool?> getCity(BuildContext context, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      response = await dio.get('${BaseUrl.searchCity}/$city');
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
      response = await dio.get('${BaseUrl.doa}' + '/all');
      notifyListeners();
      final parsed = response!.data;
      final data = DoaModel.fromJson(parsed);
      print('doa : $parsed');
      return data;
    } catch (e) {}
    return null;
  }
}
