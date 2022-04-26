import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:monggo_sholat/core/local/db.dart';
import 'package:monggo_sholat/models/list_doa_model.dart';
import 'package:monggo_sholat/models/list_hadis_model.dart';
import 'package:monggo_sholat/models/surah_model.dart';
import 'package:monggo_sholat/services/api.dart';

class SyncLocal {
  Dio dio = Dio();
  Response? response;
  Future getSurahLocal() async {
    response = await dio.get(BaseUrl.listQuran);
    return response!.data.map((surah) {
      print('add $surah');

      LocalDb.sql.insertSurah(SurahModel.fromJson(surah));
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

  // Future getHadisDetail()async{
  //   response = await dio.get('${BaseUrl.hadis}');
  // }
}
