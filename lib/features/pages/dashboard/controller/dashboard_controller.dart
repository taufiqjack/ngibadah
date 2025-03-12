import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:monggo_sholat/core/constants/constants.dart';
import 'package:monggo_sholat/core/database/db.dart';
import 'package:monggo_sholat/cores/bloc/cubit/prayer_cubit/prayer_cubit.dart';
import 'package:monggo_sholat/cores/bloc/cubit/prayer_location_cubit/prayer_location_cubit.dart';
import 'package:monggo_sholat/cores/bloc/cubit/timestamp_cubit/timestamp_cubit.dart';
import 'package:monggo_sholat/cores/component/toast.dart';
import 'package:monggo_sholat/cores/extensions/date_exstension.dart';
import 'package:monggo_sholat/features/pages/dashboard/view/dashboard_view.dart';
import 'package:monggo_sholat/models/data_sholat_model.dart';
import 'package:geolocator_platform_interface/src/enums/location_accuracy.dart'
    as geo;

class DashboardController extends State<DashboardView> {
  Map? data;
  List? result;
  List? dateTime;
  List? barang;

  bool nonactiveNotif = false;
  bool nonactiveNotif2 = false;
  bool nonactiveNotif3 = false;
  bool nonactiveNotif4 = false;
  bool nonactiveNotif5 = false;
  bool nonactiveNotif6 = false;
  bool switchValue = false;
  List<bool> switchValues = List.generate(6, (_) => false);
  String? timeString;

  Map<dynamic, dynamic> time = {};
  DateTime now = DateTime.now();

  CountdownTimerController? controller;

  PrayerCubit prayerCubit = PrayerCubit();
  TimestampCubit timestampCubit = TimestampCubit();
  PrayerLocationCubit prayerLocationCubit = PrayerLocationCubit();

  int? seconds;
  int? endtime;
  int? detik;
  int? secondDzuhur;
  int? secondIsya;
  int? secondSubuh;
  int? secondAshar;
  int? magrib;
  int? thistime;
  int? subuhtime;
  int? dzuhurtime;
  int? isyatime;
  int? ashartime;

  @override
  void initState() {
    super.initState();
    getPrayerNow();
    timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    String jam = timeString!;
    var parts = jam.split(':');
    var d = Duration(
        hours: int.parse(parts[0].trim()),
        minutes: int.parse(parts[1].trim()),
        seconds: int.parse(parts[2].trim()));
    seconds = d.abs().inSeconds;
    thistime = DateTime.now().millisecondsSinceEpoch + 1000 * seconds!;
    getLoc();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getSession() async {
    var subuh = '${logg.getString('subuh')}';
    var maghrib = '${logg.getString('maghrib')}';
    var dzuhur = '${logg.getString('dzuhur')}';
    var asar = '${logg.getString('asar')}';
    var isya = '${logg.getString('isya')}';
    var split = logg.getInt('split');

    // var partSubuh = subuh.split(':');
    // var s = Duration(
    //   hours: int.parse(partSubuh[0].trim()),
    //   minutes: int.parse(partSubuh[1].trim()),
    // );
    // subuhtime = s.abs().inSeconds;

    var part = maghrib.split(':');
    var dzuhurSplit = dzuhur.split(':');
    var isyaSplit = isya.split(':');
    var subuhSplit = subuh.split(':');
    var asharSplit = asar.split(':');

    /** MAGHRIB */
    var m = Duration(
      hours: int.parse(part[0].trim()),
      minutes: int.parse(part[1].trim()),
    );
    detik = m.abs().inSeconds;

    /** Dzuhur */
    var dz = Duration(
      hours: int.parse(dzuhurSplit[0].trim()),
      minutes: int.parse(dzuhurSplit[1].trim()),
    );
    secondDzuhur = dz.abs().inSeconds;
    /** ISYA' */
    var isy = Duration(
      hours: int.parse(isyaSplit[0].trim()),
      minutes: int.parse(isyaSplit[1].trim()),
    );
    secondIsya = isy.abs().inSeconds;

    /** Subuh */
    var su = Duration(
      hours: int.parse(subuhSplit[0].trim()),
      minutes: int.parse(subuhSplit[1].trim()),
    );
    secondSubuh = su.abs().inSeconds;

    /** Ashar */
    var ash = Duration(
      hours: int.parse(asharSplit[0].trim()),
      minutes: int.parse(asharSplit[1].trim()),
    );
    secondAshar = ash.abs().inSeconds;

    int waktu = detik! - seconds!;
    // controller = CountdownTimerController(endTime: endtime!);
    endtime = (DateTime.now().millisecondsSinceEpoch + 1000 * waktu);
    dzuhurtime = (DateTime.now().millisecondsSinceEpoch +
        1000 * (secondDzuhur! - seconds!));
    magrib = (DateTime.now().millisecondsSinceEpoch + 1000 * detik!);
    isyatime = (DateTime.now().millisecondsSinceEpoch +
        1000 * (secondIsya! - seconds!));
    if (Duration(hours: 23, minutes: 59, seconds: 59).inMilliseconds ==
        thistime) {
      subuhtime = (DateTime.now().millisecondsSinceEpoch +
          1000 * (seconds! - secondSubuh! - (Duration(hours: 15).inSeconds)));
    } else {
      subuhtime = (DateTime.now().millisecondsSinceEpoch +
          1000 * (secondSubuh! - seconds!));
    }
    ashartime = (DateTime.now().millisecondsSinceEpoch +
        1000 * (secondAshar! - seconds!));

    print('magrib : $endtime');
    print('thistime : $thistime');
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return dateTime.toHHMMSS();
  }

  void toggleNotif1() {
    setState(() {
      nonactiveNotif = !nonactiveNotif;
    });
  }

  void toggleNotif2() {
    setState(() {
      nonactiveNotif2 = !nonactiveNotif2;
    });
  }

  void toggleNotif3() {
    setState(() {
      nonactiveNotif3 = !nonactiveNotif3;
    });
  }

  void toggleNotif4() {
    setState(() {
      nonactiveNotif4 = !nonactiveNotif4;
    });
  }

  void toggleNotif5() {
    setState(() {
      nonactiveNotif5 = !nonactiveNotif5;
    });
  }

  void toggleNotif6() {
    setState(() {
      nonactiveNotif6 = !nonactiveNotif6;
    });
  }

  List<DataSholatModel> loc = [];
  getLoc() async {
    LocalDb.sql.getLocation().then((value) {
      setState(() {
        for (var item in value!) {
          loc.add(DataSholatModel(
            id: item.id,
            lokasi: item.lokasi,
            daerah: item.daerah,
          ));
        }
      });
    });
  }

  String city = '';
  String? latitude;
  String? longitude;

  clearSession() async {
    logg.remove('subuh');
    logg.remove('maghrib');
    logg.remove('isya');
    logg.remove('dzuhur');
    logg.remove('asar');
  }

  clearCity() async {
    logg.remove(CITY);
  }

  getGeoLocation() async {
    Position? position;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return toast(context, 'Location permissions are denied');
      }
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: geo.LocationAccuracy.high);
    logg.setString('latitude', position.latitude.toString());
    logg.setString('longitude', position.longitude.toString());

    context
        .read<PrayerLocationCubit>()
        .getPrayerLoca(latitude!, longitude!, context);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      print(placemarks[0]);
      logg.setString(
          CITY,
          placemarks[0].locality.toString().isEmpty
              ? placemarks[0].subLocality.toString()
              : placemarks[0].subLocality.toString() +
                  ', ${placemarks[0].locality.toString().split('Kecamatan').last}');

      toast(
        context,
        '${placemarks[0].street}',
      );
    } catch (err) {}

    Future.delayed(
      Duration(milliseconds: 500),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => DashboardView()),
          (Route<dynamic> route) => false),
    );
  }

  onSwitch(index, value) {
    switchValues[index] = value;
    setState(() {});
  }

  onBtnSeacrhLoc() async {
    clearCity();
    getGeoLocation();
    setState(() {});
    context.read<TimestampCubit>().getTimestamp(context);
  }

  getPrayerNow() {
    city = '${logg.getString(CITY)}';
    latitude = '${logg.getString('latitude')}';
    longitude = '${logg.getString('longitude')}';

    prayerCubit = context.read<PrayerCubit>()..getPrayer(context);
    if (latitude != null) {
      prayerLocationCubit = context.read<PrayerLocationCubit>()
        ..getPrayerLoca(latitude!, longitude!, context);
      getSession();
    }
  }

  @override
Widget build(BuildContext context) => widget.build(context, this);
}
