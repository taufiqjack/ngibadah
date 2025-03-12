import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:monggo_sholat/core/constants/constants.dart';
import 'package:monggo_sholat/cores/extensions/date_exstension.dart';
import 'package:monggo_sholat/cores/rest/rest_config.dart';

class RestContract {
  final GetIt _getIt = GetIt.instance;
  late RestConfig _restConfig;
  late RestConfigSurah restConfigSurah;
  late RestConfigSurahv2 restConfigSurahv2;
  late RestConfigHadis restConfigHadis;
  late RestConfigAdhan restConfigAdhan;
  late RestConfigDoa restConfigDoa;
  late Dio _dio;
  late Dio dioSurah;
  late Dio dioSurahv2;
  late Dio dioHadis;
  late Dio dioAdhan;
  late Dio dioDoa;

  RestContract() {
    _restConfig = _getIt.get<RestConfig>();
    restConfigSurah = _getIt.get<RestConfigSurah>();
    restConfigSurahv2 = _getIt.get<RestConfigSurahv2>();
    restConfigHadis = _getIt.get<RestConfigHadis>();
    restConfigAdhan = _getIt.get<RestConfigAdhan>();
    restConfigDoa = _getIt.get<RestConfigDoa>();
    _dio = _restConfig.dio();
    dioSurah = restConfigSurah.dio();
    dioSurahv2 = restConfigSurahv2.dio();
    dioSurahv2 = restConfigSurahv2.dio();
    dioHadis = restConfigSurahv2.dio();
    dioAdhan = restConfigAdhan.dio();
    dioDoa = restConfigDoa.dio();
  }

  Future<Response> getPrayerSchedule() async {
    return await _dio.get(
      '$schedule/${getToday().toYYYYMMDD()}',
    );
  }

  Future<Response> getSurah() async {
    return await dioSurah.get(
      '$SURAH$surah',
    );
  }

  Future<Response> getDetailSurah(id) async {
    return await dioSurahv2.get('/$id');
  }

  Future<Response> getHadis() async {
    return await dioHadis.get('$hadis');
  }

  Future<Response> getHadisDetail(id) async {
    return await dioHadis.get('$id?range=1-100');
  }

  Future<Response> getTimeStamp() async {
    return await dioAdhan.get('$currentTime');
  }

  Future<Response> getPrayerLoc(latitude, longitude) async {
    return await dioAdhan.get(
        '$prayer${logg.getString('timings')}?latitude=$latitude&longitude=$longitude');
  }

  Future<Response> getDoa() async {
    return await dioDoa.get('$doa');
  }
}
