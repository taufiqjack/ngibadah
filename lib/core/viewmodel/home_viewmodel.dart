import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/view_state.dart';
import 'package:monggo_sholat/core/viewmodel/base_viewmodel.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/repository/menu_repository.dart';

class HomeViewModel extends BaseViewModel {
  MenuRepo menuRepo = locator<MenuRepo>();
  PrayerScheduleModel? prayerSchedule;

  Future getDashboard(BuildContext context) async {
    setState(ViewState.busy);
    prayerSchedule = await menuRepo.getDashboard(context);
    notifyListeners();
    setState(ViewState.idle);
  }
}
