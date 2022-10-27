import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/views/base_view.dart';

class DetailHadis extends StatefulWidget {
  final String hadis;
  final String i;
  final String id;
  DetailHadis({
    required this.hadis,
    required this.i,
    required this.id,
  });

  @override
  DetailHadisState createState() => DetailHadisState();
}

class DetailHadisState extends State<DetailHadis> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getHadisDetail(context, widget.i);
      },
      builder: (context, data, child) => Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            '${widget.hadis}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black45),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.black45,
            ),
          ),
        ),
        body: data.hadisDetail == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue.shade400),
                      child: Center(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/icon_islamic2.png',
                                  height: 35,
                                  color: Colors.white,
                                ),
                                Text(
                                  '${widget.id}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${data.hadisDetail!.data!.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              ' tersedia : ${data.hadisDetail!.data!.hadiths!.length}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
                    child: ListView.builder(
                        itemCount: data.hadisDetail!.data!.hadiths!.length,
                        itemBuilder: (BuildContext context, int i) {
                          final hadis = data.hadisDetail!.data!.hadiths![i];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
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
                                            '${hadis.number}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
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
                                            width: 5,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.bookmark,
                                            size: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${hadis.arab}',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 1, 30, 7)),
                              ),
                              Text(
                                '${hadis.id}',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 14, color: Colors.black45),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                height: 4,
                                color: Colors.grey.shade400,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
      ),
    );
  }
}
