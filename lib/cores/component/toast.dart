import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:monggo_sholat/cores/component/color_constant.dart';
import 'package:monggo_sholat/cores/component/container.dart';
import 'package:monggo_sholat/widgets/common_textstyle.dart';

void toast(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
      child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: greyLightFour.withOpacity(0.8))]),
    child: CommonText(
      text: text,
      color: black,
    ),
  ));
}

Future showError(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.cancel,
      color: black,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showSuccess(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showWarning(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.error,
      color: Colors.yellow,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 1.3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future toastBasic(String text) async {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
  );
}

Future showWarningCenter(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.error,
      color: const Color.fromARGB(255, 135, 135, 135),
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        top: 0,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 3,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showWarningBottom(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.error,
      color: const Color.fromARGB(255, 135, 135, 135),
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Widget _toastContent(
    {required String text, required IconData icon, required Color color}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ).rightPadded8(),
        Flexible(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ],
    ),
  );
}

Widget _toastContentButton(
    {required String text,
    required IconData icon,
    required Color color,
    required Function()? onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ).rightPadded8(),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        Flexible(
          child: InkWell(
              onTap: onTap,
              child: CommonText(
                text: 'view'.tr(),
                color: orange,
              )),
        ),
      ],
    ),
  );
}

Future showErrorBottom(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.cancel,
      color: Colors.red,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showSuccessBottom(ctx, String text) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContent(
      text: text,
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 3),
  );
}

Future showSuccessBtn(ctx, String text, Function()? onTap) async {
  FToast fToast = FToast();
  fToast.init(ctx);
  fToast.showToast(
    child: _toastContentButton(
      onTap: onTap,
      text: text,
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    positionedToastBuilder: (context, child) {
      return Positioned(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).size.height / 8.5,
        child: child,
      );
    },
    toastDuration: const Duration(seconds: 4),
  );
}
