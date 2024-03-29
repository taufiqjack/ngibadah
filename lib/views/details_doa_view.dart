import 'package:flutter/material.dart';
import 'package:monggo_sholat/views/doa_view.dart';

class DetailDoaView extends StatefulWidget {
  final String? nama;
  final String? lafal;
  final String? latin;
  final String? arti;
  DetailDoaView({
    Key? key,
    this.nama,
    this.latin,
    this.lafal,
    this.arti,
  }) : super(key: key);

  @override
  State<DetailDoaView> createState() => DetailDoaViewState();
}

class DetailDoaViewState extends State<DetailDoaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade800,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoaView(),
                  ));
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text('${widget.nama}'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: SingleChildScrollView(
                  child: ListTile(
                title: Text(
                  '${widget.lafal},',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 15),
                ),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.latin}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Arti : ${widget.arti}',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ]),
              )),
            ),
          ),
        ));
  }
}
