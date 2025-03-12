import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijriyah_indonesia/hijriyah_indonesia.dart';
import 'package:monggo_sholat/cores/bloc/cubit/prayer_cubit/prayer_cubit.dart';
import 'package:monggo_sholat/cores/bloc/cubit/prayer_location_cubit/prayer_location_cubit.dart';
import 'package:monggo_sholat/cores/component/color_constant.dart';
import 'package:monggo_sholat/cores/extensions/date_exstension.dart';
import 'package:monggo_sholat/features/pages/dashboard/controller/dashboard_controller.dart';
import 'package:monggo_sholat/widgets/common_loading_progress.dart';
import 'package:monggo_sholat/widgets/common_textstyle.dart';
import 'package:monggo_sholat/widgets/styles.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  Widget build(BuildContext context, DashboardController controller) {
    return BlocBuilder<PrayerCubit, PrayerState>(builder: (context, state) {
      return state.when(
        initial: () => Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.green.shade800,
            centerTitle: true,
            title: SkeletonAnimation(
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: greeTwo),
              ),
            ),
          ),
          body: CommonCircularProgress(),
        ),
        error: (message) => CommonText(text: 'Loading...'),
        success: (prayer) => Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            backgroundColor: Colors.green.shade800,
            centerTitle: true,
            title: prayer?.data == null
                ? Text('Loading...')
                : Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      BlocBuilder<PrayerLocationCubit, PrayerLocationState>(
                          builder: (context, state) {
                        return state.when(
                          initial: () => SkeletonAnimation(
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: greeTwo),
                            ),
                          ),
                          error: (message) =>
                              CommonText(text: prayer!.data!.daerah.toString()),
                          success: (prayertime) => Center(
                              child: prayertime == null
                                  ? Text(
                                      '${prayer!.data!.daerah}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    )
                                  : Expanded(
                                      flex: 1,
                                      child: Text(
                                        '${controller.city}',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                              // data.prayerSchedule == null
                              //     ? null
                              //     : Text(
                              //         '${data.prayerSchedule!.data!.lokasi}',
                              //         textAlign: TextAlign.center,
                              //       ),
                              ),
                        );
                      }),
                    ],
                  ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () async {
                    //
                  },
                  child: Icon(Icons.location_on),
                ),
              ),
            ],
          ),
          drawer: SafeArea(
            child: Drawer(
              child: Column(
                children: [
                  Flexible(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/quran.png',
                            width: 50,
                            height: 50,
                          ),
                          title: Text("Al - Qur'an"),
                          onTap: () {
                            /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quran())); */
                            // Go.to(Quran());
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/quran.png',
                            width: 50,
                            height: 50,
                          ),
                          title: Text("Al - Hadist"),
                          onTap: () {
                            /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HadishPage())); */
                            // Go.to(HadishPage());
                          },
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/praying.png',
                            height: 50,
                          ),
                          title: Text('Doa Sehari - hari'),
                          onTap: () {
                            /*   Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoaView(),
                                  )); */
                            // Go.to(DoaView());
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        child: Column(
                          children: [
                            Divider(
                              thickness: 2,
                            ),
                            ListTile(
                              leading: Icon(Icons.logout),
                              title: Text("Exit"),
                              onTap: () async {
                                /*  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove('maghrib');
                              SystemNavigator.pop();
                              exit(0); */
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: prayer == null || controller.thistime == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: BlocBuilder<PrayerLocationCubit, PrayerLocationState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (message) => SizedBox(),
                        success: (prayertime) => ListView(
                          physics: AlwaysScrollableScrollPhysics(),
                          children: [
                            Container(
                              height: 150,
                              child: Card(
                                color: Colors.blue.shade500,
                                semanticContainer: true,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.timeString!,
                                      style: TextStyles.timeToday,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print(
                                            'cek ${Duration(hours: 12).inMilliseconds}');
                                      },

                                      //1686411286428
                                      //1686426226440
                                      child: Icon(
                                          Icons.notifications_none_outlined,
                                          color: Colors.white),
                                    ),
                                    prayer.data == null ||
                                            controller.subuhtime == null ||
                                            controller.isyatime == null ||
                                            controller.endtime == null ||
                                            controller.ashartime == null ||
                                            controller.dzuhurtime == null
                                        ? Text(
                                            '${prayer.data!.jadwal!.subuh}',
                                            style: TextStyles.prayerIncoming,
                                          )
                                        : Text(
                                            controller.isyatime! >=
                                                        controller.subuhtime! &&
                                                    controller.thistime! >=
                                                        controller.subuhtime!
                                                ? "${prayertime!.data!.timings!.fajr}"
                                                : controller.thistime! <=
                                                        controller.dzuhurtime!
                                                    ? '${prayertime!.data!.timings!.dhuhr}'
                                                    : controller.thistime! <=
                                                            controller
                                                                .ashartime!
                                                        ? '${prayertime!.data!.timings!.asr}'
                                                        : controller.thistime! <=
                                                                controller
                                                                    .endtime!
                                                            ? '${prayertime!.data!.timings!.maghrib}'
                                                            : "${prayertime!.data!.timings!.isha}",
                                            style: TextStyles.prayerIncoming,
                                          ),
                                    prayer.data == null ||
                                            controller.subuhtime == null ||
                                            controller.isyatime == null ||
                                            controller.endtime == null ||
                                            controller.ashartime == null ||
                                            controller.dzuhurtime == null
                                        ? SizedBox()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '- ',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              controller.isyatime! >=
                                                          controller
                                                              .subuhtime! &&
                                                      controller.thistime! >=
                                                          controller.subuhtime!
                                                  ? CountdownTimer(
                                                      textStyle: TextStyle(
                                                          color: Colors.white),
                                                      endTime:
                                                          controller.subuhtime,
                                                      // controller: controller,
                                                    )
                                                  : controller.thistime! <=
                                                          controller.dzuhurtime!
                                                      ? CountdownTimer(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          endTime: controller
                                                              .dzuhurtime,
                                                          // controller: controller,
                                                        )
                                                      : controller.thistime! <=
                                                              controller
                                                                  .ashartime!
                                                          ? CountdownTimer(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                              endTime: controller
                                                                  .ashartime,
                                                              // controller: controller,
                                                            )
                                                          : controller.thistime! <=
                                                                  controller
                                                                      .endtime!
                                                              ? CountdownTimer(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  endTime:
                                                                      controller
                                                                          .endtime,
                                                                  // controller: controller,
                                                                )
                                                              : CountdownTimer(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                  endTime:
                                                                      controller
                                                                          .isyatime,
                                                                  // controller: controller,
                                                                ),
                                              Text(
                                                ' Lagi',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                    prayertime == null ||
                                            controller.subuhtime == null ||
                                            controller.isyatime == null ||
                                            controller.endtime == null ||
                                            controller.ashartime == null ||
                                            controller.dzuhurtime == null
                                        ? Text(
                                            'Shubuh',
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 14,
                                                color: Colors.white),
                                          )
                                        : Text(
                                            controller.isyatime! >=
                                                        controller.subuhtime! &&
                                                    controller.thistime! >=
                                                        controller.subuhtime!
                                                ? 'Shubuh'
                                                : controller.thistime! >=
                                                        controller.dzuhurtime!
                                                    ? 'Dzuhur'
                                                    : controller.thistime! >=
                                                            controller
                                                                .ashartime!
                                                        ? "'Ashar"
                                                        : controller.thistime! >=
                                                                controller
                                                                    .endtime!
                                                            ? "Magrib"
                                                            : "'Isya",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${(DateTime.parse(prayer.data!.jadwal!.date.toString()).toDaysIndonesiaFormat())} / ${Hijriyah.fromDate(DateTime.parse(prayer.data!.jadwal!.date.toString()).toLocal()).toFormat("dd MMMM yyyy")} H',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunitoSans(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          Icons.featured_play_list,
                                          color: Colors.grey,
                                        ),
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.grey,
                                        ),
                                        Icon(
                                          Icons.alarm_on,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListTile(
                                      title: Text(
                                        prayertime == null
                                            ? '${prayer.data!.jadwal!.imsak}'
                                            : '${prayertime.data!.timings!.imsak}',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minLeadingWidth: 120,
                                      leading: Text(
                                        'Imsak',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                          value: controller.switchValues[0],
                                          onChanged: (value) {
                                            controller.onSwitch(0, value);
                                          },
                                          activeColor: Colors.purple,
                                          thumbColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        prayertime == null
                                            ? '${prayer.data!.jadwal!.subuh}'
                                            : '${prayertime.data!.timings!.fajr}',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minLeadingWidth: 120,
                                      leading: Text(
                                        'Shubuh',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                          value: controller.switchValues[1],
                                          onChanged: (value) {
                                            controller.onSwitch(1, value);
                                          },
                                          activeColor: Colors.purple,
                                          thumbColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        prayertime == null
                                            ? '${prayer.data!.jadwal!.dzuhur}'
                                            : '${prayertime.data!.timings!.dhuhr}',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minLeadingWidth: 120,
                                      leading: Text(
                                        'Dhuhur',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                          value: controller.switchValues[2],
                                          onChanged: (value) {
                                            controller.onSwitch(2, value);
                                          },
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        prayertime == null
                                            ? "${prayer.data!.jadwal!.ashar}"
                                            : "${prayertime.data!.timings!.asr}",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minLeadingWidth: 120,
                                      leading: Text(
                                        "'Ashar",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                          value: controller.switchValues[3],
                                          onChanged: (value) {
                                            controller.onSwitch(3, value);
                                          },
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        prayertime == null
                                            ? "${prayer.data!.jadwal!.maghrib}"
                                            : "${prayertime.data!.timings!.maghrib}",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minLeadingWidth: 120,
                                      leading: Text(
                                        'Magrib',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                          value: controller.switchValues[4],
                                          onChanged: (value) {
                                            controller.onSwitch(4, value);
                                          },
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        prayertime == null
                                            ? '${prayer.data!.jadwal!.isya}'
                                            : '${prayertime.data!.timings!.isha}',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      minLeadingWidth: 120,
                                      leading: Text(
                                        "Isya'",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      trailing: Transform.scale(
                                        scale: 0.8,
                                        child: CupertinoSwitch(
                                          value: controller.switchValues[5],
                                          onChanged: (value) {
                                            controller.onSwitch(5, value);
                                          },
                                          activeColor: Colors.purple,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image.asset(
                              'assets/images/kufitdc.png',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
        ),
      );
    });
  }

  @override
  State<StatefulWidget> createState() => DashboardController();
}
