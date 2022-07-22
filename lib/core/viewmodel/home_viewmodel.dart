import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/view_state.dart';
import 'package:monggo_sholat/core/viewmodel/base_viewmodel.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/models/doa_model.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/models/read_surah_model.dart';
import 'package:monggo_sholat/models/surah_detail_model.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/repository/menu_repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends BaseViewModel {
  MenuRepo menuRepo = locator<MenuRepo>();
  PrayerScheduleModel? prayerSchedule;
  List<SurahModel>? surah;
  ReadSurahModel? surahDetail;
  HadisModel? hadis;
  HadisDetailModel? hadisDetail;
  DoaModel? doa;

  Future getDashboard(BuildContext context) async {
    setState(ViewState.busy);
    prayerSchedule = await menuRepo.getDashboard(context);
    notifyListeners();
    setState(ViewState.idle);
  }

  Future getSurah(BuildContext context) async {
    setState(ViewState.busy);
    surah = await menuRepo.getSurah(context);
    notifyListeners();
    setState(ViewState.idle);
  }

  Future getDetailSurah(int id, BuildContext context) async {
    setState(ViewState.busy);
    surahDetail = await menuRepo.getDetailSurah(id, context);
    notifyListeners();
    setState(ViewState.idle);
  }

  Future getHadis(BuildContext context) async {
    setState(ViewState.busy);
    hadis = await menuRepo.getHadis(context);
    notifyListeners();
    setState(ViewState.idle);
  }

  Future getHadisDetail(BuildContext context, String id) async {
    setState(ViewState.busy);
    hadisDetail = await menuRepo.getHadisDetail(context, id);
    notifyListeners();
    setState(ViewState.idle);
  }

  Future getDoa(BuildContext context) async {
    setState(ViewState.busy);
    doa = await menuRepo.getDoa(context);
    notifyListeners();
    setState(ViewState.idle);
  }

  Future<bool?> getLocation(BuildContext context, String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.busy);

    var sucess = await menuRepo.getCity(context, city);
    setState(ViewState.idle);

    if (sucess == true) {
      return true;
    } else {
      Alert(
          context: context,
          type: AlertType.error,
          style: AlertStyle(
            descStyle: TextStyle(
              color: Colors.red.withOpacity(0.8),
            ),
          ),
          desc: prefs.getString('error'),
          buttons: [
            DialogButton(
              child: Text(
                'OK',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.grey.shade500,
            )
          ]).show();
      // Toast.show(prefs.getString('error'), context,
      //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      setState(ViewState.idle);
      return false;
    }
  }
}
