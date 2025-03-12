import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:monggo_sholat/core/constants/constants.dart';

class RestConfig {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[SHOLLU]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;
  RestConfig(this._dio);

  Dio dio() {
    return _dio;
  }
}

class RestConfigSurah {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[SURAH]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;
  RestConfigSurah(this._dio);

  Dio dio() {
    return _dio;
  }
}

class RestConfigSurahv2 {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[READQURAN]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;
  RestConfigSurahv2(this._dio);

  Dio dio() {
    return _dio;
  }
}

class RestConfigHadis {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[HADISLIST]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;

  RestConfigHadis(this._dio);

  Dio dio() {
    return _dio;
  }
}

class RestConfigAdhan {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[ADHAN]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;

  RestConfigAdhan(this._dio);

  Dio dio() {
    return _dio;
  }
}

class RestConfigDoa {
  static BaseOptions options() => BaseOptions(
        baseUrl: '${dotenv.env[DOAA]}',
        sendTimeout: const Duration(hours: 24),
        connectTimeout: const Duration(milliseconds: 100000),
        receiveTimeout: const Duration(milliseconds: 100000),
        followRedirects: false,
        validateStatus: (status) => true,
      );
  final Dio _dio;

  RestConfigDoa(this._dio);

  Dio dio() {
    return _dio;
  }
}
