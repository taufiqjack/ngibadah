import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/database/sync_local.dart';
import 'package:monggo_sholat/views/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    SyncLocal().getHadisBukhari();
    SyncLocal().getHadis();
    SyncLocal().getSurahLocal();
    SyncLocal().getDoa();
    SyncLocal().getJadwal();
    SyncLocal().getLoc();
    Future.delayed(Duration(seconds: 3), () {
      getPref();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MenuHome(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 19, 196, 134),
      child: Center(
        child: Image.asset(
          'assets/images/ngibadah_logo.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  getPref() async {
    int splittime = DateTime.now().millisecondsSinceEpoch + 1000 * 900;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('split', splittime);
  }
}
