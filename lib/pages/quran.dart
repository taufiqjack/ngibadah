import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/services/api.dart';

class Quran extends StatefulWidget {
  Quran({Key? key}) : super(key: key);

  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List? quranList;

  Future getListQuran() async {
    Response response = await Dio().get('${BaseUrl.listQuran}');
    setState(() {
      quranList = response.data;
    });
    // debugPrint('cek: ${quranList.toString()}');
  }

  @override
  void initState() {
    super.initState();
    getListQuran();
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
                "Al - Qur'an",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView.builder(
            itemCount: quranList!.length,
            itemBuilder: (BuildContext context, int index) {
              final x = quranList![index];
              return Card(
                  child: ListTile(
                trailing: Text(
                  '${x['nama']}',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                leading: Text('${x['nomor']}'),
                title: Text('Surah : ${x['nama_latin']}'),
                subtitle: Text('Jumlah Ayat : ${x['jumlah_ayat']}'),
              ));
            }),
      ),
    );
  }
}
