import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
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
}
