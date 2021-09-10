import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/services/api.dart';
import 'package:tanggal_indonesia/tanggal_indonesia.dart';
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
  Map<dynamic, dynamic>? times;
  Map<dynamic, dynamic>? location;
  Map<dynamic, dynamic>? date;
  bool nonactiveNotif = false;
  bool nonactiveNotif2 = false;
  bool nonactiveNotif3 = false;
  bool nonactiveNotif4 = false;
  bool nonactiveNotif5 = false;
  bool nonactiveNotif6 = false;

  Future getTimes() async {
    Response response = await Dio().get(BaseUrl.today);
    setState(() {
      times = response.data['results']['datetime'][0]['times'];
    });
    debugPrint('cek: ${times.toString()}');
  }

  Future getLocation() async {
    Response response = await Dio().get(BaseUrl.today);
    setState(() {
      date = response.data['results']['datetime'][0]['date'];
    });
    debugPrint('cek: ${date.toString()}');
  }

  Future getTanggal() async {
    Response response = await Dio().get(BaseUrl.today);
    setState(() {
      location = response.data['results']['location'];
    });
    debugPrint('cek: ${location.toString()}');
  }

  Map<dynamic, dynamic> time = {};

  @override
  void initState() {
    super.initState();
    getTimes();
    getLocation();
    getTanggal();
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Row(
          children: [
            Icon(Icons.location_on),
            Center(
              child: Text(
                '${location!['city']}',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView(
          children: [
            Text(
              '${DateFormat('EEEE, d MMMM yyyy').format(DateTime.parse(date!['gregorian']))} / ${HijriCalendar.fromDate(DateTime.parse(date!['gregorian'])).toFormat('MMMM dd yyyy')}',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Imsak : ${times!['Imsak']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    nonactiveNotif
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color: nonactiveNotif ? Colors.grey[300] : Colors.grey,
                  ),
                  onTap: () {
                    toggleNotif1();
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Shubuh : ${times!['Fajr']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    nonactiveNotif2
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color: nonactiveNotif2 ? Colors.grey[300] : Colors.grey,
                  ),
                  onTap: () {
                    toggleNotif2();
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Dhuhur : ${times!['Dhuhr']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    nonactiveNotif3
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color: nonactiveNotif3 ? Colors.grey[300] : Colors.grey,
                  ),
                  onTap: () {
                    toggleNotif3();
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  "'Ashar : ${times!['Asr']}",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    nonactiveNotif4
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color: nonactiveNotif4 ? Colors.grey[300] : Colors.grey,
                  ),
                  onTap: () {
                    toggleNotif4();
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Magrib : ${times!['Maghrib']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    nonactiveNotif5
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color: nonactiveNotif5 ? Colors.grey[300] : Colors.grey,
                  ),
                  onTap: () {
                    toggleNotif5();
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text(
                  'Isya : ${times!['Isha']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: GestureDetector(
                  child: Icon(
                    nonactiveNotif6
                        ? Icons.notifications_off
                        : Icons.notifications_active,
                    color: nonactiveNotif6 ? Colors.grey[300] : Colors.grey,
                  ),
                  onTap: () {
                    toggleNotif6();
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
              'https://yt3.ggpht.com/ytc/AKedOLSJ4hdZlT9DSTLf1jxvRX5zRr9NsoARgq1DsvZ4Mw=s900-c-k-c0x00ffffff-no-rj',
              height: 200,
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
