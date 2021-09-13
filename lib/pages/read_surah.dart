import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/services/api.dart';

class ReadSurah extends StatefulWidget {
  final List surah;
  final int index;

  ReadSurah({required this.surah, required this.index});

  @override
  _ReadSurahState createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {
  List? quranList;

  Future getQuranDetail() async {
    Response response =
        await Dio().get('${BaseUrl.listQuran}/${widget.index + 1}');
    setState(() {
      quranList = response.data['ayat'];
    });
    debugPrint('cek: ${quranList.toString()}');
  }

  @override
  void initState() {
    super.initState();
    getQuranDetail();
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
            itemBuilder: (BuildContext context, int i) {
              final quran = quranList![i];
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${quran['ar']}' + ' (${quran['nomor']}),',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${quran['idn']}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 12,
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
