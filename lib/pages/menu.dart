import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Row(
          children: [
            Icon(Icons.location_on),
            Center(
              child: Text(
                '${location!['lokasi']}',
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
              '${DateFormat("EEEE, d MMMM yyyy", "id_ID").format(DateTime.parse(jadwal!['date']))} / ${HijriCalendar.fromDate(DateTime.parse(jadwal!['date'])).toFormat('MMMM dd yyyy')}',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Imsak : ${jadwal!['imsak']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                title: Text(
                  'Shubuh : ${jadwal!['subuh']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                title: Text(
                  'Dhuhur : ${jadwal!['dzuhur']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                title: Text(
                  "'Ashar : ${jadwal!['ashar']}",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                title: Text(
                  'Magrib : ${jadwal!['maghrib']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
                title: Text(
                  'Isya : ${jadwal!['isya']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
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
            Image.asset(
              'assets/images/kufitdc.png',
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
