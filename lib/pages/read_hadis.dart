import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:monggo_sholat/services/api.dart';

class DetailHadis extends StatefulWidget {
  final List hadis;
  final String i;
  DetailHadis({required this.hadis, required this.i});

  @override
  _DetailHadisState createState() => _DetailHadisState();
}

class _DetailHadisState extends State<DetailHadis> {
  List? hadisDetail;
  Map? riwayat;

  Future getHadisDetail() async {
    Response response =
        await Dio().get('${BaseUrl.hadis}/${widget.i}?range=1-100');
    setState(() {
      hadisDetail = response.data['data']['hadiths'];
    });
    debugPrint('cek: ${hadisDetail.toString()}');
  }

  Future getHadis() async {
    Response response =
        await Dio().get('${BaseUrl.hadis}/${widget.i}?range=1-100');
    setState(() {
      riwayat = response.data['data'];
    });
    debugPrint('cek: ${riwayat.toString()}');
  }

  @override
  void initState() {
    super.initState();
    getHadisDetail().then((value) {
      setState(() {});
    });
    getHadis();
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
                  '${riwayat!['name']}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ListView.builder(
              itemCount: hadisDetail!.length,
              itemBuilder: (BuildContext context, int i) {
                final hadis = hadisDetail![i];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${hadis['arab']}' +
                          ' (${ArabicNumbers().convert(hadis['number'])})',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${hadis['id']}',
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
        ));
  }
}
