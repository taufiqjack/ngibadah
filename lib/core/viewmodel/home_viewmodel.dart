import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/view_state.dart';
import 'package:monggo_sholat/core/viewmodel/base_viewmodel.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/models/hadis_detail_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/pages/read_hadis.dart';
import 'package:monggo_sholat/repository/menu_repository.dart';

class HomeViewModel extends BaseViewModel {
  MenuRepo menuRepo = locator<MenuRepo>();
  PrayerScheduleModel? prayerSchedule;
  List<SurahModel>? surah;
  HadisModel? hadis;
  HadisDetailModel? hadisDetail;

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
}
