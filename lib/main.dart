import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monggo_sholat/locator.dart';
import 'package:monggo_sholat/pages/menu.dart';

void main() {
  setupLocator();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MenuHome(),
    ),
  ));
}
