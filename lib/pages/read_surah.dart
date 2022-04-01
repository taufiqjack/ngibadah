import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/services/api.dart';
import 'package:arabic_numbers/arabic_numbers.dart';

class ReadSurah extends StatefulWidget {
  final List surah;
  final int index;

  ReadSurah({required this.surah, required this.index});

  @override
  _ReadSurahState createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {
  List? quranList;
  Map? surah;

  Future getQuranDetail() async {
    Response response =
        await Dio().get('${BaseUrl.listQuran}/${widget.index + 1}');
    setState(() {
      quranList = response.data['ayat'];
    });
    debugPrint('cek: ${quranList.toString()}');
  }

  Future getSurah() async {
    Response response =
        await Dio().get('${BaseUrl.listQuran}/${widget.index + 1}');
    setState(() {
      surah = response.data;
    });
    debugPrint('cek: ${surah.toString()}');
  }

  @override
  void initState() {
    super.initState();
    getQuranDetail().then((value) {
      setState(() {});
    });
    getSurah();
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
              child: surah == null
                  ? null
                  : Text(
                      '${surah!['nama_latin']}',
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ),
      body: quranList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView.builder(
                  itemCount: quranList!.length,
                  itemBuilder: (BuildContext context, int i) {
                    final quran = quranList![i];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${quran['ar']}' +
                              ' (${ArabicNumbers().convert(quran['nomor'])})',
                          textAlign: TextAlign.right,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${quran['nomor']}. ' + '${quran['idn']}',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    );
                  }),
            ),
    );
  }
}
