import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/pages/menu.dart';
import 'package:monggo_sholat/pages/read_hadis.dart';
import 'package:monggo_sholat/services/api.dart';

class HadishPage extends StatefulWidget {
  HadishPage({Key? key}) : super(key: key);

  @override
  _HadishPageState createState() => _HadishPageState();
}

class _HadishPageState extends State<HadishPage> {
  List? hadisList;

  Future getHadist() async {
    Response response = await Dio().get('${BaseUrl.hadis}');
    setState(() {
      hadisList = response.data['data'];
    });
    debugPrint('list : ${hadisList.toString()}');
  }

  @override
  void initState() {
    super.initState();
    getHadist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        centerTitle: true,
        title: Row(
          children: [
            Center(
              child: Text(
                "Al - Hadist",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        leading: InkWell(
          child: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuHome()));
          },
        ),
      ),
      body: hadisList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView.builder(
                itemCount: hadisList!.length,
                itemBuilder: (BuildContext context, int index) {
                  final x = hadisList![index];
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          trailing: Text(
                            'tersedia : \n${x['available']}',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          leading: Text(
                            '${index + 1}',
                            style: GoogleFonts.nunitoSans(),
                          ),
                          title: Text(
                            '${x['name']}',
                            style: GoogleFonts.nunitoSans(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailHadis(hadis: [x], i: x['id'])));
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
