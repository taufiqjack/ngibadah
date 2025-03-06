import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/routes/state_route.dart';
import 'package:monggo_sholat/cores/component/color_constant.dart';
import 'package:monggo_sholat/widgets/common_textstyle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShadowedContainer extends StatelessWidget {
  final List<Widget> children;
  final Widget? hero;
  final bool noPadding;
  final double? width;
  final double? borderRadius;
  final double padding;

  const ShadowedContainer({
    Key? key,
    required this.children,
    this.hero,
    this.borderRadius,
    this.noPadding = false,
    this.width,
    this.padding = 16,
  }) : super(key: key);

  @override
  Widget build(context) {
    final content = LeftAlignedColumn(
      children: children,
    );
    final padded = Padding(
      padding: EdgeInsets.all(padding),
      child: content,
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
      ),
      width: width,
      child: hero == null
          ? (noPadding ? content : padded)
          : Column(
              children: [
                hero!,
                (noPadding ? content : padded),
              ],
            ),
    );
  }
}

showConfirmationDialog({
  required BuildContext context,
  required String message,
  String? title,
  DialogType? dialogType,
}) {
  AwesomeDialog(
          context: context,
          dialogType: dialogType ?? DialogType.error,
          animType: AnimType.bottomSlide,
          title: title,
          descTextStyle: const TextStyle(fontSize: 16),
          desc: message,
          btnOkOnPress: () {},
          btnOkColor: red,
          btnOkText: 'OK')
      .show();
}

showErrorDialog({
  required BuildContext context,
  required String message,
  String? title,
}) {
  Alert(
      context: context,
      type: AlertType.error,
      style: AlertStyle(descStyle: TextStyle(color: red.withOpacity(0.8))),
      desc: message,
      buttons: [
        DialogButton(
          child: Text(
            'OK',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.grey.shade500,
        )
      ]).show();
}

showFailed({
  required BuildContext context,
  required String message,
  String? title,
}) {
  Alert(
      context: context,
      type: AlertType.error,
      content: CommonText(
        text: message,
        textAlign: TextAlign.center,
        color: red,
      ).topPadded(10),
      buttons: [
        DialogButton(
          child: const CommonText(
            text: 'OK',
            color: white,
            fontWeight: FontWeight.w700,
          ),
          onPressed: () => Go.back(),
        )
      ]).show();
}

showCupertinoAlert({
  required BuildContext context,
  required String message,
  String? title,
}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: CommonText(
          text: message,
          textAlign: TextAlign.center,
        ),
        actions: [
          CupertinoDialogAction(
            child: const CommonText(text: 'OK'),
            onPressed: () => Go.back(),
          )
        ],
      );
    },
  );
}

class LeftAlignedColumn extends StatelessWidget {
  final List<Widget> children;

  const LeftAlignedColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
}

class RightAlignedColumn extends StatelessWidget {
  final List<Widget> children;

  const RightAlignedColumn({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
}

class LeftAlignedRow extends StatelessWidget {
  final List<Widget> children;

  const LeftAlignedRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
}

class RightAlignedRow extends StatelessWidget {
  final List<Widget> children;

  const RightAlignedRow({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
}

class CenterAlignedRow extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;

  final List<Widget> children;

  const CenterAlignedRow({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
}

class SideToSideRow extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;

  final Widget left;

  final Widget right;

  const SideToSideRow({
    Key? key,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(context) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          left,
          right,
        ],
      );
}

Widget containerBottomWithShadowTopWidget({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      border:
          const Border(top: BorderSide(color: Color(0xFFE2E3E4), width: 0.5)),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 5.0,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    ),
    width: double.infinity,
    alignment: Alignment.bottomCenter,
    child: child,
  );
}

Widget containerTopWithShadowBottomWidget({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      border: const Border(
          bottom: BorderSide(color: Color(0xFFE2E3E4), width: 0.5)),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 5.0,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    ),
    width: double.infinity,
    alignment: Alignment.bottomCenter,
    child: child,
  );
}

Widget containerBottomWithShadowTopType3Widget({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
      border: const Border(
        top: BorderSide(
          color: Color(0xFFE2E3E4),
          width: 0.5,
        ),
      ),
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          offset: const Offset(0.0, -5.0),
          blurRadius: 4.0,
          color: Colors.black.withOpacity(0.3),
        ),
      ],
    ),
    width: double.infinity,
    alignment: Alignment.bottomCenter,
    child: child,
  );
}

extension PaddedWidget on Widget {
  Widget topPadded4([final value = const EdgeInsets.only(top: 4)]) => Padding(
        padding: value,
        child: this,
      );

  Widget topPadded12([final value = const EdgeInsets.only(top: 12)]) => Padding(
        padding: value,
        child: this,
      );

  Widget topPadded16([final value = const EdgeInsets.only(top: 16)]) => Padding(
        padding: value,
        child: this,
      );

  Widget topPadded20([final value = const EdgeInsets.only(top: 20)]) => Padding(
        padding: value,
        child: this,
      );

  Widget topPadded30([final value = const EdgeInsets.only(top: 30)]) => Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded24([final value = const EdgeInsets.only(bottom: 24)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded20([final value = const EdgeInsets.only(bottom: 20)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded16([final value = const EdgeInsets.only(bottom: 16)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded12([final value = const EdgeInsets.only(bottom: 12)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded8([final value = const EdgeInsets.only(bottom: 8)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded4([final value = const EdgeInsets.only(bottom: 4)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded6([final value = const EdgeInsets.only(bottom: 6)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget bottomPadded2([final value = const EdgeInsets.only(bottom: 2)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget padded16([final value = const EdgeInsets.all(16)]) => Padding(
        padding: value,
        child: this,
      );

  Widget verticalpadded16([
    final value = const EdgeInsets.symmetric(vertical: 16),
  ]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget horizontalpadded16([
    final value = const EdgeInsets.symmetric(horizontal: 16),
  ]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget withoutTopPadded16(
          [final value = const EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
          )]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget padded8([final value = const EdgeInsets.all(8)]) => Padding(
        padding: value,
        child: this,
      );

  Widget leftPadded16([final value = const EdgeInsets.only(left: 16)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget leftPadded14([final value = const EdgeInsets.only(left: 14)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget leftPadded8([final value = const EdgeInsets.only(left: 8)]) => Padding(
        padding: value,
        child: this,
      );

  Widget leftPadded4([final value = const EdgeInsets.only(left: 4)]) => Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded14([final value = const EdgeInsets.only(right: 14)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded12([final value = const EdgeInsets.only(right: 12)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded20([final value = const EdgeInsets.only(right: 20)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded16([final value = const EdgeInsets.only(right: 16)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded10([final value = const EdgeInsets.only(right: 10)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded8([final value = const EdgeInsets.only(right: 8)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded6([final value = const EdgeInsets.only(right: 6)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget rightPadded4([final value = const EdgeInsets.only(right: 4)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget sliderPadded20(
          [final value = const EdgeInsets.only(right: 20, left: 20)]) =>
      Padding(
        padding: value,
        child: this,
      );

  Widget padded([final value = 16]) => Padding(
        padding: EdgeInsets.all(value.toDouble()),
        child: this,
      );

  Widget paddedWithoutBottom([final value = 16]) => Padding(
        padding: EdgeInsets.only(
          left: value.toDouble(),
          right: value.toDouble(),
          top: value.toDouble(),
        ),
        child: this,
      );

  Widget paddedLTRB({
    double left = 16,
    double top = 16,
    double right = 16,
    double bottom = 16,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Widget topPadded([final value = 16]) => Padding(
        padding: EdgeInsets.only(top: value.toDouble()),
        child: this,
      );

  Widget bottomPadded([final value = 16]) => Padding(
        padding: EdgeInsets.only(bottom: value.toDouble()),
        child: this,
      );

  Widget rightPadded([final value = 16]) => Padding(
        padding: EdgeInsets.only(right: value.toDouble()),
        child: this,
      );

  Widget leftPadded([final value = 16]) => Padding(
        padding: EdgeInsets.only(left: value.toDouble()),
        child: this,
      );

  Widget horizontalPadded([final value = 16]) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value.toDouble()),
        child: this,
      );

  Widget verticalPadded([final value = 16]) => Padding(
        padding: EdgeInsets.symmetric(vertical: value.toDouble()),
        child: this,
      );
}
