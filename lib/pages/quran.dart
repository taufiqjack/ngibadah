import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/constans/color_constans.dart';
import 'package:monggo_sholat/core/local/db.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/pages/base_view.dart';
import 'package:monggo_sholat/pages/menu.dart';
import 'package:monggo_sholat/pages/read_surah.dart';
import 'package:flutter_svg/svg.dart';

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
  // double _val = 0.5;
  // Timer? _timer;

  @override
  void initState() {
    super.initState();
    getSurahLocal();
  }

  TextEditingController _search = TextEditingController();

  List<SurahModel> listSurah = [];

  getSurahLocal() async {
    LocalDb.sql.getSurah().then((value) {
      setState(() {
        for (var data in value!) {
          listSurah.add(SurahModel(
            nomor: data.nomor,
            nama: data.nama,
            namaLatin: data.namaLatin,
            jumlahAyat: data.jumlahAyat,
            tempatTurun: data.tempatTurun,
            arti: data.arti,
            deskripsi: data.deskripsi,
            audio: data.audio,
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final assetsAudioPlayer = AssetsAudioPlayer();

    // void togglePlayPause(x, i) {
    //   setState(() {
    //     playpause[i] = !playpause[i];
    //   });
    //   setState(() {
    //     try {
    //       playpause[i]
    //           ? assetsAudioPlayer.open(Audio.liveStream('$x'))
    //           : assetsAudioPlayer.stop();
    //     } catch (e) {}
    //   });
    // }

    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getSurah(context);
        playpause = List.generate(144, (_) => false);
      },
      builder: (context, data, child) => Scaffold(
        backgroundColor: brownLight,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Row(
            children: [
              Center(
                child: Text(
                  "Al - Qur'an",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: brownLightDark),
                ),
              ),
            ],
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: brownLightDark,
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuHome()));
            },
          ),
        ),
        body: data.surah == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 5,
                    right: 5,
                    child: SvgPicture.asset('assets/images/card_quran2.svg'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 230,
                    ),
                    child: Image.asset('assets/images/logo_ahlul_quran_in.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 170, left: 20, right: 20),
                    child: TextFormField(
                        controller: _search,
                        decoration: InputDecoration(
                          hintText: 'cari surah',
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(1)),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _search.clear();
                              });
                            },
                            child: Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 240, 20, 20),
                    child: ListView.builder(
                        itemCount: listSurah.length,
                        itemBuilder: (BuildContext context, int index) {
                          final x = listSurah[index];
                          return Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                ListTile(
                                  trailing: Text(
                                    '${x.nama}',
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  leading: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/islamic_icon.svg'),
                                      // Image.asset(
                                      //     'assets/images/icon_islamic.png',
                                      //     height: 35),
                                      Text(
                                        '${x.nomor}',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  title: Text('${x.namaLatin}'),
                                  subtitle: Text(
                                    '${x.arti} - ${x.jumlahAyat} ayat',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  onTap: () {
                                    print('cek index : $index');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReadSurah(
                                                  arti: x.arti,
                                                  index: index + 1,
                                                )));
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
                                          assetsAudioPlayer.open(
                                              Audio.liveStream('${x.audio}'));
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
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
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
