import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:monggo_sholat/cores/bloc/cubit/prayer_cubit/prayer_cubit.dart';
import 'package:monggo_sholat/cores/bloc/cubit/prayer_location_cubit/prayer_location_cubit.dart';
import 'package:monggo_sholat/cores/bloc/cubit/timestamp_cubit/timestamp_cubit.dart';
import 'package:monggo_sholat/cores/rest/network_interceptor.dart';
import 'package:monggo_sholat/cores/rest/rest_config.dart';
import 'package:monggo_sholat/cores/rest/rest_contract.dart';

final locator = GetIt.instance;

class Injection {
  late RestConfig _restApi;
  late RestConfigSurah _restSurah;
  late RestConfigSurahv2 _restSurahv2;
  late RestConfigHadis _restConfigHadis;
  late RestConfigAdhan _restConfigAdhan;
  late RestConfigDoa _restConfigDoa;
  late Dio _dio;
  late Dio dioSurah;
  late Dio dioSurahv2;
  late Dio dioHadis;
  late Dio dioAdhan;
  late Dio dioDoa;
  Alice alice = Alice(
    showNotification: true,
  );

  Injection.init() {
    _initDependencies();
  }

  Future _initDependencies() async {
    if (!kIsWeb) {
      locator.registerSingleton<Alice>(alice);
    }

    _dio = Dio(RestConfig.options());
    dioSurah = Dio(RestConfigSurah.options());
    dioSurahv2 = Dio(RestConfigSurahv2.options());
    dioHadis = Dio(RestConfigHadis.options());
    dioAdhan = Dio(RestConfigAdhan.options());
    dioDoa = Dio(RestConfigDoa.options());
    List<Interceptor> interceptors = [];
    if (kDebugMode) {
      _dio.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
      dioSurah.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
      dioSurahv2.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
      dioHadis.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
      dioAdhan.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
      dioDoa.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
    }

    interceptors.add(NetworkInterceptor());
    _dio.interceptors.addAll(interceptors);
    dioSurah.interceptors.addAll(interceptors);
    dioSurahv2.interceptors.addAll(interceptors);
    dioHadis.interceptors.addAll(interceptors);
    dioAdhan.interceptors.addAll(interceptors);
    dioDoa.interceptors.addAll(interceptors);

    _restApi = RestConfig(_dio);
    _restSurah = RestConfigSurah(dioSurah);
    _restSurahv2 = RestConfigSurahv2(dioSurahv2);
    _restConfigHadis = RestConfigHadis(dioHadis);
    _restConfigAdhan = RestConfigAdhan(dioAdhan);
    _restConfigDoa = RestConfigDoa(dioDoa);

    locator.registerSingleton<RestContract>(RestContract());
    locator.registerSingleton<RestConfig>(_restApi);
    locator.registerSingleton<RestConfigSurah>(_restSurah);
    locator.registerSingleton<RestConfigSurahv2>(_restSurahv2);
    locator.registerSingleton<RestConfigHadis>(_restConfigHadis);
    locator.registerSingleton<RestConfigAdhan>(_restConfigAdhan);
    locator.registerSingleton<RestConfigDoa>(_restConfigDoa);
    locator.registerSingleton<PrayerCubit>(PrayerCubit());
    locator.registerSingleton<TimestampCubit>(TimestampCubit());
    locator.registerSingleton<PrayerLocationCubit>(PrayerLocationCubit());
  }
}
