import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:monggo_sholat/core/local/db.dart';
import 'package:monggo_sholat/models/data_sholat_model.dart';
import 'package:monggo_sholat/models/jadwal_sholat_model.dart';
import 'package:monggo_sholat/models/list_doa_model.dart';
import 'package:monggo_sholat/models/list_hadis_model.dart';
import 'package:monggo_sholat/models/surah_model_new.dart';
import 'package:monggo_sholat/services/api.dart';

class SyncLocal {
  Dio dio = Dio();
  Response? response;
  DateTime now = DateTime.now();
  final formatTime = new DateFormat('yyyy/MM/dd');

  Future getSurahLocal() async {
    response = await dio.get(BaseUrl.surah);
    return response!.data.map((surah) {
      print('add $surah');

      LocalDb.sql.insertSurah(SurahModelNova.fromJson(surah));
    }).toList();
  }

  // Future getHadisLocal() async {
  //   response = await dio.get(BaseUrl.hadis);
  //   return response!.data.map((hadis) {
  //     print('add $hadis');

  //     LocalDb.sql.insertHadis(HadisModel.fromJson(hadis));
  //   }).toList();
  // }

  Future getDoa() async {
    response = await dio.get('${BaseUrl.doa}/all');
    return response!.data['data'].map((doa) {
      print('doa $doa');

      LocalDb.sql.insertDoa(DoaListModel.fromJson(doa));
    }).toList();
  }

  Future getHadis() async {
    response = await dio.get(BaseUrl.hadis);
    return response!.data['data'].map((hadis) {
      print('hadis $hadis');

      LocalDb.sql.insertHadis(HadisLocalModel.fromJson(hadis));
    }).toList();
  }

  Future getJadwal() async {
    response =
        await dio.get('${BaseUrl.shollu}' + '/${formatTime.format(now)}');
    var parse = response!.data['data']['jadwal'];
    // print('jadwal $jadwal');

    LocalDb.sql.insertJadwal(JadwalSholatModel.fromJson(parse));
  }

  Future getLoc() async {
    response =
        await dio.get('${BaseUrl.shollu}' + '/${formatTime.format(now)}');
    var parsing = response!.data['data'];
    print(parsing);

    LocalDb.sql.insertGetLoc(DataSholatModel.fromJson(parsing));
  }

  // Future getHadisDetail()async{
  //   response = await dio.get('${BaseUrl.hadis}');
  // }
}
