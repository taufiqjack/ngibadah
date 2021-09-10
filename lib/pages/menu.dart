import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:monggo_sholat/services/api.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
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
            Card(
              child: ListTile(
                leading: Text('Imsak : ${times!['Imsak']}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Shubuh : ${times!['Fajr']}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Dhuhur : ${times!['Dhuhr']}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("'Ashar : ${times!['Asr']}"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Magrib : ${times!['Maghrib']}'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Isya : ${times!['Isha']}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
