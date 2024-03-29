import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/database/hive_stuff.dart';
import 'package:monggo_sholat/core/routes/state_route.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await HiveStuff.init();
  await dotenv.load(fileName: '.env');
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.montserrat(fontSize: 14).fontFamily),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SplashScreenView(),
      ),
      navigatorKey: Go.navigatorKey,
    );
  }
}
