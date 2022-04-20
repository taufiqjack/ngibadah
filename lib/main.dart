import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/pages/menu.dart';

void main() {
  setupLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
    home: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MenuHome(),
    ),
  ));
}
