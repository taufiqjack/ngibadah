import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monggo_sholat/core/local/db.dart';
import 'package:monggo_sholat/core/viewmodel/home_viewmodel.dart';
import 'package:monggo_sholat/models/list_hadis_model.dart';
import 'package:monggo_sholat/views/base_view.dart';
import 'package:monggo_sholat/views/menu.dart';
import 'package:monggo_sholat/views/read_hadis.dart';

class HadishPage extends StatefulWidget {
  HadishPage({Key? key}) : super(key: key);

  @override
  _HadishPageState createState() => _HadishPageState();
}

class _HadishPageState extends State<HadishPage> {
  List<HadisLocalModel> hadis = [];

  getHadisLocal() async {
    LocalDb.sql.getHadisLocal().then((value) {
      setState(() {
        for (var item in value!) {
          hadis.add(HadisLocalModel(
            name: item.name,
            id: item.id,
            available: item.available,
          ));
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getHadisLocal();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (data) {
        data.getHadis(context);
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
                  "Al - Hadist",
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MenuHome()));
            },
          ),
        ),
        body: hadis.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: ListView.builder(
                  itemCount: hadis.length,
                  itemBuilder: (BuildContext context, int index) {
                    final x = hadis[index];
                    return Card(
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Text(
                              'tersedia : \n${x.available}',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            leading: Text(
                              '${index + 1}',
                              style: GoogleFonts.nunitoSans(),
                            ),
                            title: Text(
                              '${x.name}',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailHadis(
                                            hadis: '${x.name}',
                                            i: '${x.id}',
                                            id: '${index + 1}',
                                          )));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
