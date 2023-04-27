// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

BuildContext get globalContext {
  return Go.navigatorKey.currentContext!;
}

class Go {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static get currentContext {
    return navigatorKey.currentContext;
  }

  static to(Widget page, {Function(Object? data)? onHaveData}) async {
    final data = await navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    );
    if (data != null) {
      onHaveData?.call(data);
    }
  }

  static back({Object? data}) {
    Navigator.pop(globalContext, data);
  }

  static offAll(page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static off(page) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static double get width {
    return MediaQuery.of(currentContext).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext).size.width;
  }
}

extension ChangeNotifierExtension on State {
  update() {
    // ignore: invalid_use_of_visible_for_testing_member, unnecessary_this, invalid_use_of_protected_member
    this.setState(() {});
  }
}

class MvcController {}

// After many tries, I figured out that this lines bellow is still not working well.
// I'm still looking for a better solution.
// So, don't use this code for now.

abstract class Controller<V> extends State {
  V view;
  Controller(this.view);
  @override
  Widget build(BuildContext context) => (view as View).build(context, this);
}

abstract class View<C> extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  C get controller;

  @override
  State<StatefulWidget> createState() => controller as Controller;

  Widget build(BuildContext context, C controller);

  BuildContext get context => (controller as Controller).context;
}
