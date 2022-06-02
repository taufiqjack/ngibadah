import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:location/location.dart';
import 'package:monggo_sholat/core/local/db.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/models/data_sholat_model.dart';
import 'package:monggo_sholat/pages/base_view.dart';
import 'package:monggo_sholat/pages/doa_view.dart';
import 'package:monggo_sholat/pages/hadish.dart';
import 'package:monggo_sholat/pages/quran.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuHome extends StatefulWidget {
  String? texttime;
  MenuHome({
    Key? key,
    this.texttime,
  }) : super(key: key);

  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
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
  String? _timeString;

  Map<dynamic, dynamic> time = {};
  DateTime now = DateTime.now();
  final formatTime = new DateFormat('yyyy/MM/dd');

  CountdownTimerController? controller;

  int? seconds;
  int? endtime;
  int? detik;
  int? magrib;
  int? thistime;

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());

    String jam = _timeString!;
    var parts = jam.split(':');
    var d = Duration(
        hours: int.parse(parts[0].trim()),
        minutes: int.parse(parts[1].trim()),
        seconds: int.parse(parts[2].trim()));
    seconds = d.abs().inSeconds;
    Future.delayed(Duration(seconds: 2), () {
      getSession();
    });
    getLoc();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var maghrib = '${prefs.getString('maghrib')}';
    var split = prefs.getInt('split');
    controller = CountdownTimerController(
      endTime: split!,
    );
    var part = maghrib.split(':');
    var c = Duration(
      hours: int.parse(part[0].trim()),
      minutes: int.parse(part[1].trim()),
    );
    detik = c.abs().inSeconds;

    int waktu = detik! - seconds!;
    // controller = CountdownTimerController(endTime: endtime!);
    endtime = (DateTime.now().millisecondsSinceEpoch + 1000 * waktu);
    magrib = (DateTime.now().millisecondsSinceEpoch + 1000 * detik!);
    thistime = DateTime.now().millisecondsSinceEpoch + 1000 * seconds!;

    print('magrib : $endtime');
    print('thistime : $thistime');
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
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

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID');
    return BaseView<HomeViewModel>(
        onModelReady: (data) async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // String city = '${prefs.getString('city')}';

          data.getDashboard(context);

          // Future.delayed(Duration(seconds: 5), () {
          //   data.getLocation(context, city);
          // });
        },
        builder: (context, data, child) => Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.green.shade800,
              centerTitle: true,
              title: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Center(
                      child: loc.isEmpty
                          ? null
                          : Text(
                              '${loc.first.lokasi}',
                            )
                      // data.prayerSchedule == null
                      //     ? null
                      //     : Text(
                      //         '${data.prayerSchedule!.data!.lokasi}',
                      //         textAlign: TextAlign.center,
                      //       ),
                      ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        getLocation();
                      });
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quran()));
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HadishPage()));
                            },
                          ),
                          ListTile(
                            leading: Image.asset(
                              'assets/images/praying.png',
                              height: 50,
                            ),
                            title: Text('Doa Sehari - hari'),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoaView(),
                                  ));
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
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.remove('maghrib');
                                  SystemNavigator.pop();
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
            body: data.prayerSchedule == null ||
                    thistime == null ||
                    endtime == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          height: 150,
                          child: Card(
                            color: Colors.blue.shade500,
                            semanticContainer: true,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                endtime == null
                                    ? SizedBox()
                                    : Text(
                                        _timeString! + ' WIB',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(Icons.notifications_none_outlined,
                                    color: Colors.white),
                                Text(
                                  '${data.prayerSchedule!.data!.jadwal!.maghrib}',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '- ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    thistime! >= endtime!
                                        ? CountdownTimer(
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            endTime: endtime,
                                            // controller: controller,
                                          )
                                        : SizedBox(),
                                    Text(
                                      ' Lagi',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                Text(
                                  'Maghrib',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.parse(data.prayerSchedule!.data!.jadwal!.date.toString()))} / ${HijriCalendar.fromDate(DateTime.parse(data.prayerSchedule!.data!.jadwal!.date.toString()).toLocal()).toFormat("dd MMMM yyyy")} H',
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
                                    '${data.prayerSchedule!.data!.jadwal!.imsak}',
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
                                      value: switchValues[0],
                                      onChanged: (value) {
                                        setState(() {
                                          switchValues[0] = value;
                                        });
                                      },
                                      activeColor: Colors.purple,
                                      thumbColor: Colors.white,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    '${data.prayerSchedule!.data!.jadwal!.subuh}',
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
                                      value: switchValues[1],
                                      onChanged: (value) {
                                        setState(() {
                                          switchValues[1] = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    '${data.prayerSchedule!.data!.jadwal!.dzuhur}',
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
                                      value: switchValues[2],
                                      onChanged: (value) {
                                        setState(() {
                                          switchValues[2] = value;
                                        });
                                      },
                                      activeColor: Colors.purple,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "${data.prayerSchedule!.data!.jadwal!.ashar}",
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
                                      value: switchValues[3],
                                      onChanged: (value) {
                                        setState(() {
                                          switchValues[3] = value;
                                        });
                                      },
                                      activeColor: Colors.purple,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    '${data.prayerSchedule!.data!.jadwal!.maghrib}',
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
                                      value: switchValues[4],
                                      onChanged: (value) {
                                        setState(() {
                                          switchValues[4] = value;
                                        });
                                      },
                                      activeColor: Colors.purple,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    '${data.prayerSchedule!.data!.jadwal!.isya}',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  minLeadingWidth: 120,
                                  leading: Text(
                                    'Isya',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  trailing: Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      value: switchValues[5],
                                      onChanged: (value) {
                                        setState(() {
                                          switchValues[5] = value;
                                        });
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
                  )));

    //   body: jadwal == null || location == null
    //       ? Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : Padding(
    //           padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    //           child: ListView(
    //             physics: NeverScrollableScrollPhysics(),
    //             children: [
    //               Container(
    //                 height: 150,
    //                 child: Card(
    //                   color: Colors.blue.shade500,
    //                   semanticContainer: true,
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Icon(Icons.notifications_none_outlined,
    //                           color: Colors.white),
    //                       Text(
    //                         '${jadwal!['maghrib']}',
    //                         style: GoogleFonts.nunitoSans(
    //                             fontSize: 24,
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.white),
    //                       ),
    //                       Text(
    //                         'Maghrib',
    //                         style: GoogleFonts.nunitoSans(
    //                             fontSize: 14, color: Colors.white),
    //                       ),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                       Text(
    //                         '${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.parse(jadwal!['date']))} / ${HijriCalendar.fromDate(DateTime.parse(jadwal!['date'])).toFormat('dd MMMM yyyy')} H',
    //                         textAlign: TextAlign.center,
    //                         style: GoogleFonts.nunitoSans(
    //                             fontSize: 14, color: Colors.white),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //               Card(
    //                 elevation: 2,
    //                 child: Padding(
    //                   padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                         children: [
    //                           Icon(
    //                             Icons.featured_play_list,
    //                             color: Colors.grey,
    //                           ),
    //                           Icon(
    //                             Icons.access_time,
    //                             color: Colors.grey,
    //                           ),
    //                           Icon(
    //                             Icons.alarm_on,
    //                             color: Colors.grey,
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 10,
    //                       ),
    //                       ListTile(
    //                         title: Text(
    //                           '${jadwal!['imsak']}',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         minLeadingWidth: 120,
    //                         leading: Text(
    //                           'Imsak',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                         trailing: Transform.scale(
    //                           scale: 0.8,
    //                           child: CupertinoSwitch(
    //                             value: switchValues[0],
    //                             onChanged: (value) {
    //                               setState(() {
    //                                 switchValues[0] = value;
    //                               });
    //                             },
    //                             activeColor: Colors.purple,
    //                             thumbColor: Colors.white,
    //                           ),
    //                         ),
    //                       ),
    //                       ListTile(
    //                         title: Text(
    //                           '${jadwal!['subuh']}',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         minLeadingWidth: 120,
    //                         leading: Text(
    //                           'Shubuh',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                         trailing: Transform.scale(
    //                           scale: 0.8,
    //                           child: CupertinoSwitch(
    //                             value: switchValues[1],
    //                             onChanged: (value) {
    //                               setState(() {
    //                                 switchValues[1] = value;
    //                               });
    //                             },
    //                           ),
    //                         ),
    //                       ),
    //                       ListTile(
    //                         title: Text(
    //                           '${jadwal!['dzuhur']}',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         minLeadingWidth: 120,
    //                         leading: Text(
    //                           'Dhuhur',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                         trailing: Transform.scale(
    //                           scale: 0.8,
    //                           child: CupertinoSwitch(
    //                             value: switchValues[2],
    //                             onChanged: (value) {
    //                               setState(() {
    //                                 switchValues[2] = value;
    //                               });
    //                             },
    //                             activeColor: Colors.purple,
    //                           ),
    //                         ),
    //                       ),
    //                       ListTile(
    //                         title: Text(
    //                           "${jadwal!['ashar']}",
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         minLeadingWidth: 120,
    //                         leading: Text(
    //                           "'Ashar",
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                         trailing: Transform.scale(
    //                           scale: 0.8,
    //                           child: CupertinoSwitch(
    //                             value: switchValues[3],
    //                             onChanged: (value) {
    //                               setState(() {
    //                                 switchValues[3] = value;
    //                               });
    //                             },
    //                             activeColor: Colors.purple,
    //                           ),
    //                           ),
    //                         ),
    //                       ),
    //                       ListTile(
    //                         title: Text(
    //                           '${jadwal!['maghrib']}',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         minLeadingWidth: 120,
    //                         leading: Text(
    //                           'Magrib',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                         trailing: Transform.scale(
    //                           scale: 0.8,
    //                           child: CupertinoSwitch(
    //                             value: switchValues[4],
    //                             onChanged: (value) {
    //                               setState(() {
    //                                 switchValues[4] = value;
    //                               });
    //                             },
    //                             activeColor: Colors.purple,
    //                           ),
    //                         ),
    //                       ),
    //                       ListTile(
    //                         title: Text(
    //                           '${jadwal!['isya']}',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         minLeadingWidth: 120,
    //                         leading: Text(
    //                           'Isya',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                           textAlign: TextAlign.center,
    //                         ),
    //                         trailing: Transform.scale(
    //                           scale: 0.8,
    //                           child: CupertinoSwitch(
    //                             value: switchValues[5],
    //                             onChanged: (value) {
    //                               setState(() {
    //                                 switchValues[5] = value;
    //                               });
    //                             },
    //                             activeColor: Colors.purple,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               Image.asset(
    //                 'assets/images/kufitdc.png',
    //                 height: 100,
    //                 width: 100,
    //               ),
    //               SizedBox(
    //                 height: 10,
    //               ),
    //             ],
    //           ),
    //         ),
    // );
  }

  clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('maghrib');
  }

  getLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LocationData? myLocation;
    String? error;

    Location location = Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Silahkan mengizinkan akses';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_MEVER_ASK') {
        error = 'izin ditolak, silahkan cek pengaturan lokasi anda';
        print(error);
      }
      myLocation = null;
    }
    final coordinat = Coordinates(myLocation!.latitude, myLocation.longitude);
    var addressess =
        await Geocoder.local.findAddressesFromCoordinates(coordinat);
    var data = addressess.first;
    prefs.setString('city', '${data.subLocality}');
    var str = data.subAdminArea;
    print('split ${str!.substring(10)}');
    print('lokasi ${data.subAdminArea}');
    Fluttertoast.showToast(
        msg: '${data.addressLine}',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG);
  }
  // var address = Geocoder.local.findAddressesFromCoordinates();
}
