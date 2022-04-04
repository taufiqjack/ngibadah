import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/models/prayer_today.dart';
import 'package:monggo_sholat/pages/base_view.dart';
import 'package:monggo_sholat/pages/hadish.dart';
import 'package:monggo_sholat/pages/quran.dart';
import 'package:monggo_sholat/services/api.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class MenuHome extends StatefulWidget {
  MenuHome({Key? key}) : super(key: key);

  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  Map? data;
  List? result;
  List? dateTime;
  List? barang;
  Map<dynamic, dynamic>? times;
  Map<dynamic, dynamic>? location;
  Map<dynamic, dynamic>? date;
  Map<dynamic, dynamic>? jadwal;
  bool nonactiveNotif = false;
  bool nonactiveNotif2 = false;
  bool nonactiveNotif3 = false;
  bool nonactiveNotif4 = false;
  bool nonactiveNotif5 = false;
  bool nonactiveNotif6 = false;
  bool switchValue = false;
  List<bool> switchValues = List.generate(6, (_) => false);

  Future getShollat() async {
    Response response =
        await Dio().get('${BaseUrl.shollu}/${formatTime.format(now)}');
    setState(() {
      jadwal = response.data['data']['jadwal'];
    });
    debugPrint('cek: ${jadwal.toString()}');
  }

  Future getLocation() async {
    Response response =
        await Dio().get('${BaseUrl.shollu}/${formatTime.format(now)}');
    setState(() {
      location = response.data['data'];
    });
    debugPrint('cek: ${location.toString()}');
  }

  Future getBarang() async {
    Response response = await Dio().get('${BaseUrl.item}');
    setState(() {
      barang = json.decode(response.data);
    });
    debugPrint('barang = ${barang.toString()}');
  }

  Map<dynamic, dynamic> time = {};
  DateTime now = DateTime.now();
  final formatTime = new DateFormat('yyyy/MM/dd');

  @override
  void initState() {
    super.initState();
    getLocation();
    getShollat();
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

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID');
    return BaseView<HomeViewModel>(
        onModelReady: (data) async {
          data.getDashboard(context);
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
                    child: data.prayerSchedule == null
                        ? null
                        : Text(
                            '${data.prayerSchedule!.data!.lokasi}',
                            textAlign: TextAlign.center,
                          ),
                  ),
                ],
              ),
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
                                onTap: () {
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
            body: data.prayerSchedule == null
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
                                Icon(Icons.notifications_none_outlined,
                                    color: Colors.white),
                                Text(
                                  '${data.prayerSchedule!.data!.jadwal!.maghrib}',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
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
                                  '${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.parse(data.prayerSchedule!.data!.jadwal!.date.toString()))} / ${HijriCalendar.fromDate(DateTime.parse(data.prayerSchedule!.data!.jadwal!.date.toString())).toFormat('dd MMMM yyyy')} H',
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
}
