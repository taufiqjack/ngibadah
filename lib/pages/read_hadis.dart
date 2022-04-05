import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/pages/base_view.dart';
import 'package:monggo_sholat/services/api.dart';

class DetailHadis extends StatefulWidget {
  final String hadis;
  final String i;
  DetailHadis({required this.hadis, required this.i});

  @override
  _DetailHadisState createState() => _DetailHadisState();
}

class _DetailHadisState extends State<DetailHadis> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getHadisDetail(context, widget.i);
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
                    '${widget.hadis}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          body: data.hadisDetail == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: ListView.builder(
                      itemCount: data.hadisDetail!.data!.hadiths!.length,
                      itemBuilder: (BuildContext context, int i) {
                        final hadis = data.hadisDetail!.data!.hadiths![i];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${hadis.arab}' +
                                  ' (${ArabicNumbers().convert(hadis.number)})',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '${hadis.number}. ' + '${hadis.id}',
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
                )),
    );
  }
}
