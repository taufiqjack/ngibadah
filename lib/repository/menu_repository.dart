import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:monggo_sholat/models/adhan_time_model.dart';
import 'package:monggo_sholat/models/doa_model.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/models/surah_detail_model.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuRepo extends ChangeNotifier {
  Response? response;
  Dio dio = Dio();
  DateTime now = DateTime.now();
  final formatTime = new DateFormat('yyyy/MM/dd');

  Future<bool?> getTimestamp(BuildContext context) async {
    try {
      response = await dio.get(BaseUrl.timestramp);
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('timestamp', response!.data['data']);
      print('timestamp : ${response!.data['data']}');
    } catch (e) {
      return null;
    }
  }

  Future<AdhanTime?> getAdhan(
      String latitude, String longitude, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String timestamp = prefs.getString('timestamp') ?? '';
    try {
      response = await dio.get('${BaseUrl.jadwalLongitude}' +
          '/$timestamp?latitude=$latitude&longitude=$longitude');
      notifyListeners();
      final parser = response!.data;
      final data = AdhanTime.fromJson(parser);
      print('jadwal latitude : ' + parser);
      return data;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error');
    }
    return null;
  }

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
      var dhuhur = '${data.data!.jadwal!.dzuhur}';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('maghrib', magrib);
      prefs.setString('dzuhur', dhuhur);
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

  Future<SurahDetailModel?> getDetailSurah(int id, BuildContext context) async {
    try {
      response = await dio.get('${BaseUrl.listQuran}' + '/$id');
      notifyListeners();
      final parser = response!.data;
      final data = SurahDetailModel.fromJson(parser);
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
