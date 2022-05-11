import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/local/sync_local.dart';
import 'package:monggo_sholat/pages/menu.dart';

class SplashScreenView extends StatefulWidget {
  SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    SyncLocal().getHadis();
    SyncLocal().getSurahLocal();
    SyncLocal().getDoa();
    SyncLocal().getJadwal();
    SyncLocal().getLoc();
    Future.delayed(Duration(seconds: 3), () {
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
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
