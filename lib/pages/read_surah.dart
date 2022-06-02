import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/pages/base_view.dart';

class ReadSurah extends StatefulWidget {
  final String? arti;
  final int index;

  ReadSurah({this.arti, required this.index});

  @override
  _ReadSurahState createState() => _ReadSurahState();
}

class _ReadSurahState extends State<ReadSurah> {
  @override
  void initState() {
    print('${widget.index}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getDetailSurah(widget.index, context);
      },
      builder: (context, data, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: data.surahDetail == null
              ? null
              : Text(
                  '${data.surahDetail!.namaLatin}',
                  style: TextStyle(color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black45),
          ),
        ),
        body: data.surahDetail == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 135, 197, 203)),
                      child: Center(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/icon_islamic2.png',
                                  color: Colors.white,
                                  height: 40,
                                ),
                                Text(
                                  '${data.surahDetail!.nomor}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data.surahDetail!.namaLatin}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              '${widget.arti}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${data.surahDetail!.tempatTurun} -',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ' ${data.surahDetail!.jumlahAyat} ayat',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 130, left: 30, right: 30),
                    child: HtmlWidget(
                      "<div style='text-align:center;'><span style='font-size: medium;'><span class='messageBody' data-ft='{&quot;type&quot;:3}'><span dir='rtl'>ب&#1616;س&#1618;ــــــــــــــــم&#1616; اﷲ&#1616;الر&#1614;&#1617;ح&#1618;م&#1614;ن&#1616; اار&#1614;&#1617;ح&#1616;يم</span></span></span></div><br/>",
                      textStyle:
                          TextStyle(color: Colors.blue.shade400, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 160, 20, 20),
                    child: ListView.builder(
                        itemCount: data.surahDetail!.ayat!.length,
                        itemBuilder: (BuildContext context, int i) {
                          final quran = data.surahDetail!.ayat![i];
                          return Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blueGrey),
                                        child: Center(
                                          child: Text(
                                            '${quran.nomor}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.shareNodes,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.bookmark,
                                            size: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '${quran.ar}',
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 0, 32, 4)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: HtmlWidget(
                                  '${quran.tr}',
                                  textStyle: TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '${quran.idn}',
                                  style: GoogleFonts.nunitoSans(
                                      fontSize: 14, color: Colors.black45),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 4,
                                color: Colors.grey.shade400,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          );
                        }),
                    // ]),
                  ),
                ],
              ),
      ),
    );
  }
}
