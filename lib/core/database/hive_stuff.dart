import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:monggo_sholat/core/constants/constants.dart';
import 'package:monggo_sholat/core/database/main_storage.dart';
import 'package:monggo_sholat/models/surah/surah_model.dart';
import 'package:path_provider/path_provider.dart';

class HiveStuff {
  static Future<void> init() async {
    if (!kIsWeb) {
      var path = await getTemporaryDirectory();
      Hive.init(path.path);
    }

    Hive.registerAdapter(SurahModelAdapter()); // Adapter id: 4

    surahDataBox = await Hive.openBox<SurahModel>(QURAN);
  }
}
