import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/pages/base_view.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getDetailSurah(widget.index + 1, context);
      },
      builder: (context, data, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.green.shade800,
          centerTitle: true,
          title: Row(
            children: [
              Center(
                child: data.surahDetail == null
                    ? null
                    : Text(
                        '${data.surahDetail!.namaLatin}',
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          ),
        ),
        body: data.surahDetail == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ListView.builder(
                    itemCount: data.surahDetail!.ayat!.length,
                    itemBuilder: (BuildContext context, int i) {
                      final quran = data.surahDetail!.ayat![i];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${quran.ar}' +
                                ' (${ArabicNumbers().convert(quran.nomor)})',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${quran.nomor}. ' + '${quran.idn}',
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
      ),
    );
  }
}
