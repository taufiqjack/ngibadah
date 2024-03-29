import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/database/db.dart';
import 'package:monggo_sholat/core/routes/state_route.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/models/surah_model_new.dart';
import 'package:monggo_sholat/views/base_view.dart';
import 'package:monggo_sholat/views/read_surah.dart';

class Quran extends StatefulWidget {
  Quran({Key? key}) : super(key: key);

  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List? quranList;
  List? barang;
  bool playPause = false;

  List<bool> playpause = [];

  @override
  void initState() {
    super.initState();
    getSurahLocal();
  }

  List<SurahModelNova> listSurah = [];

  getSurahLocal() async {
    LocalDb.sql.getSurah().then((value) {
      setState(() {
        for (var data in value!) {
          listSurah.add(SurahModelNova(
            arti: data.arti,
            asma: data.asma,
            ayat: data.ayat,
            nama: data.nama,
            type: data.type,
            urut: data.urut,
            audio: data.audio,
            nomor: data.nomor,
            rukuk: data.rukuk,
            keterangan: data.keterangan,
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getSurah(context);
        playpause = List.generate(144, (_) => false);
      },
      builder: (context, data, child) => Scaffold(
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
          leading: InkWell(
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            ),
            onTap: () {
              Go.back();
              Go.back();
            },
          ),
        ),
        body: data.surah == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ListView.builder(
                    itemCount: listSurah.length,
                    itemBuilder: (BuildContext context, int index) {
                      final x = listSurah[index];
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              trailing: Text(
                                '${x.asma}',
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              leading: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset('assets/images/icon_islamic.png',
                                      height: 35),
                                  Text(
                                    '${x.nomor}',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              title: Text('${x.nama}'),
                              subtitle: Text(
                                '${x.type} - ${x.ayat} ayat',
                                style: TextStyle(fontSize: 12),
                              ),
                              onTap: () {
                                print('cek index : $index');
                                /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadSurah(
                                              arti: x.arti,
                                              index: index + 1,
                                            ))); */

                                Go.to(ReadSurah(
                                  index: index + 1,
                                  arti: x.arti,
                                ));
                              },
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Icon(
                                      FontAwesomeIcons.play,
                                      size: 20,
                                      color: Colors.pink,
                                    ),
                                    // child: playpause[index]
                                    //     ? Icon(
                                    //         Icons.stop_circle_outlined,
                                    //         color: Colors.pink,
                                    //       )
                                    //     : Icon(
                                    //         Icons.play_circle_outline,
                                    //         color: Colors.pink,
                                    //       ),
                                    onTap: () async {
                                      // togglePlayPause(x.audio, index);
                                      assetsAudioPlayer
                                          .open(Audio.liveStream('${x.audio}'));
                                    },
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      assetsAudioPlayer.pause();
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.pause,
                                      size: 20,
                                      color: Colors.red.shade800,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      assetsAudioPlayer.stop();
                                    },
                                    child: Icon(
                                      FontAwesomeIcons.stop,
                                      size: 20,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Slider(
                                  //     value: _val,
                                  //     min: 0,
                                  //     max: 1,
                                  //     divisions: 100,
                                  //     onChanged: (vol) {
                                  //       _val = vol;
                                  //       setState(() {
                                  //         PerfectVolumeControl.setVolume(vol);
                                  //         setState(() {});
                                  //         // if (_timer != null) {
                                  //         //   _timer!.cancel();
                                  //         // }

                                  //         // _timer = Timer(
                                  //         //     Duration(milliseconds: 200), () {
                                  //         //   VolumeControl.volume.asStream();
                                  //         print('volume : $vol');
                                  //         // });
                                  //       });
                                  //     })
                                ]),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
      ),
    );
    //  Scaffold(
    //   backgroundColor: Colors.grey[100],
    //   appBar: AppBar(
    //     backgroundColor: Colors.green.shade800,
    //     centerTitle: true,
    //     title: Row(
    //       children: [
    //         Center(
    //           child: Text(
    //             "Al - Qur'an",
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //       ],
    //     ),
    //     leading: InkWell(
    //       child: Icon(
    //         Icons.keyboard_backspace,
    //         color: Colors.white,
    //       ),
    //       onTap: () {
    //         Navigator.push(
    //             context, MaterialPageRoute(builder: (context) => MenuHome()));
    //       },
    //     ),
    //   ),
    //   body: quranList == null
    //       ? Center(
    //           child: CircularProgressIndicator(),
    //         )
    //       : Padding(
    //           padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    //           child: ListView.builder(
    //               itemCount: quranList!.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 final x = quranList![index];
    //                 return Card(
    //                   child: Column(
    //                     children: [
    //                       ListTile(
    //                         trailing: Text(
    //                           '${x['nama']}',
    //                           style: GoogleFonts.nunitoSans(
    //                               fontSize: 16, fontWeight: FontWeight.bold),
    //                         ),
    //                         leading: Text('${x['nomor']}'),
    //                         title: Text('Surah : ${x['nama_latin']}'),
    //                         subtitle: Text('Jumlah Ayat : ${x['jumlah_ayat']}'),
    //                         onTap: () {
    //                           Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) => ReadSurah(
    //                                         surah: [x],
    //                                         index: index,
    //                                       )));
    //                         },
    //                       ),
    //                       Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             Text('Putar Murrotal'),
    //                             SizedBox(
    //                               width: 10,
    //                             ),
    //                             GestureDetector(
    //                               child: playPause
    //                                   ? Icon(
    //                                       Icons.stop_circle_outlined,
    //                                       color: Colors.pink,
    //                                     )
    //                                   : Icon(
    //                                       Icons.play_circle_outline,
    //                                       color: Colors.pink,
    //                                     ),
    //                               onTap: () async {
    //                                 togglePlayPause(x);
    //                               },
    //                             )
    //                           ]),
    //                       SizedBox(
    //                         height: 5,
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               }),
    //         ),
    // );
  }
}
