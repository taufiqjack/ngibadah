import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:monggo_sholat/cores/rest/network_interceptor.dart';
import 'package:monggo_sholat/cores/rest/rest_config.dart';
import 'package:monggo_sholat/cores/rest/rest_contract.dart';

class Injection {
  late RestConfig _restApi;
  late RestConfigSurah _restSurah;
  late RestConfigSurahv2 _restSurahv2;
  late Dio _dio;
  Alice alice = Alice(
    showNotification: true,
  );
  final locator = GetIt.instance;

  Injection.init() {
    _initDependencies();
  }

  Future _initDependencies() async {
    if (!kIsWeb) {
      locator.registerSingleton<Alice>(alice);
    }

    _dio = Dio(RestConfig.options());
    List<Interceptor> interceptors = [];
    if (kDebugMode) {
      _dio.interceptors
        ..add(alice.getDioInterceptor())
        ..add(LogInterceptor(
          requestBody: true,
          responseBody: true,
        ));
    }

    interceptors.add(NetworkInterceptor());
    _dio.interceptors.addAll(interceptors);

    _restApi = RestConfig(_dio);
    _restSurah = RestConfigSurah(_dio);
    _restSurahv2 = RestConfigSurahv2(_dio);
    locator.registerSingleton<RestConfig>(_restApi);
    locator.registerSingleton<RestConfigSurah>(_restSurah);
    locator.registerSingleton<RestConfigSurahv2>(_restSurahv2);
    locator.registerSingleton<RestContract>(RestContract());
    locator.registerSingleton<RestContract>(RestContract());
  }
}
