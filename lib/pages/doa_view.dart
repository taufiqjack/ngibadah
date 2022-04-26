import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/core/local/db.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/models/list_doa_model.dart';
import 'package:monggo_sholat/pages/base_view.dart';
import 'package:monggo_sholat/pages/details_doa_view.dart';
import 'package:monggo_sholat/pages/menu.dart';

class DoaView extends StatefulWidget {
  DoaView({Key? key}) : super(key: key);

  @override
  State<DoaView> createState() => _DoaViewState();
}

class _DoaViewState extends State<DoaView> {
  @override
  void initState() {
    super.initState();
    getDoaLocal();
  }

  List<DoaListModel> doaList = [];

  getDoaLocal() async {
    LocalDb.sql.getDoa().then((value) {
      setState(() {
        for (var data in value!) {
          doaList.add(DoaListModel(
            idDoa: data.idDoa,
            nama: data.nama,
            lafal: data.lafal,
            transliterasi: data.transliterasi,
            arti: data.arti,
            riwayat: data.riwayat,
            keterangan: data.keterangan,
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getDoa(context);
      },
      builder: (context, data, child) => Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.green.shade800,
              leading: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuHome()));
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Doa Sehari -hari',
              )),
          body: doaList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: doaList.length,
                    itemBuilder: (context, i) {
                      var doa = doaList[i];
                      return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailDoaView(
                                          nama: doa.nama,
                                          lafal: doa.lafal,
                                          latin: doa.transliterasi,
                                          arti: doa.arti,
                                          riwayat: doa.riwayat,
                                        )));
                          },
                          child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Colors.grey.shade200)
                                  ]),
                              child: Row(
                                children: [
                                  Text('${doa.idDoa}. '),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Flexible(
                                    child: Text(
                                      '${doa.nama}',
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              )),
                          //  ListTile(
                          //   title: Text(
                          //     '${doa.lafal},',
                          //     textAlign: TextAlign.end,
                          //     style: TextStyle(fontSize: 15),
                          //   ),
                          //   subtitle: Column(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       crossAxisAlignment:
                          //           CrossAxisAlignment.start,
                          //       children: [
                          //         Text(
                          //           '${doa.transliterasi}',
                          //           style: TextStyle(
                          //               fontStyle: FontStyle.italic),
                          //         ),
                          //         SizedBox(
                          //           height: 5,
                          //         ),
                          //         Text(
                          //           'Arti : ${doa.arti}',
                          //         ),
                          //         SizedBox(
                          //           height: 5,
                          //         ),
                          //         Text(
                          //           '(${doa.riwayat})',
                          //           style: TextStyle(fontSize: 12),
                          //         )
                          //       ]),
                          //   trailing:
                          //       Text(arabicNumbers.convert('.${i + 1}')),
                          // ),
                        ),
                      );
                    },
                  )),
                )),
    );
  }
}
