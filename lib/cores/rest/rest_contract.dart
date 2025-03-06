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
  late Dio _dio;
  late Dio dioSurah;
  late Dio dioSurahv2;

  RestContract() {
    _restConfig = _getIt.get<RestConfig>();
    restConfigSurah = _getIt.get<RestConfigSurah>();
    restConfigSurahv2 = _getIt.get<RestConfigSurahv2>();
    _dio = _restConfig.dio();
    dioSurah = restConfigSurah.dio();
    dioSurahv2 = restConfigSurahv2.dio();
  }

  Future<Response> getPrayerSchedule() async {
    return await _dio.get(
      '$schedule/${getToday().toYYYYMMDD()}',
    );
  }

  Future<Response> getSurah() async {
    return await _dio.get(
      '$SURAH$surah',
    );
  }

  Future<Response> getDetailSurah(id) async {
    return await _dio.get(
      '$READQURAN/$detailSurah/$id}',
    );
  }
}
