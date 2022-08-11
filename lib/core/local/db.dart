import 'dart:io';

import 'package:monggo_sholat/models/data_sholat_model.dart';
import 'package:monggo_sholat/models/jadwal_sholat_model.dart';
import 'package:monggo_sholat/models/list_doa_model.dart';
import 'package:monggo_sholat/models/list_hadis_model.dart';
import 'package:monggo_sholat/models/prayer_time.dart';
import 'package:monggo_sholat/models/prayer_time_model.dart';
import 'package:monggo_sholat/models/surah_model_new.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  static Database? db;
  static LocalDb sql = LocalDb._();
  LocalDb._();

  Future<Database?> get database async {
    db = await _initDatabase();
    return db;
  }

  _initDatabase() async {
    Directory databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path, 'monggo_sholat.db');

    return await openDatabase(path, version: 1, onOpen: (sql) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'create table Surah(arti TEXT,asma TEXT, ayat INTEGER, nama TEXT, type TEXT, urut TEXT, audio TEXT, nomor TEXT, rukuk TEXT, keterangan TEXT)');
      await db
          .execute('create table Hadis(name TEXT, id TEXT, available INTEGER)');
      await db.execute(
          'create table Doa(id_doa TEXT, nama TEXT, lafal TEXT, transliterasi TEXT, arti TEXT, riwayat TEXT, keterangan TEXT, kata_kunci TEXT)');
      await db.execute(
          'create table Jadwal(tanggal TEXT, imsak TEXT, subuh TEXT, terbit TEXT, dhuha TEXT, dzuhur TEXT, ashar TEXT, maghrib TEXT, isya TEXT,date TEXT)');
      await db
          .execute('create table Lokasi(id TEXT, lokasi TEXT, daerah TEXT)');
      await db.execute(
          'create table Sholat(imsak TEXT, subuh TEXT, dhuha TEXT, dzuhur TEXT, ashar TEXT, maghrib TEXT, isya TEXT, tanggal TEXT)');
    });
  }

  insertSurah(SurahModelNova model) async {
    var row = {
      'arti': model.arti,
      'asma': model.asma,
      'ayat': model.ayat,
      'nama': model.nama,
      'type': model.type,
      'urut': model.urut,
      'audio': model.audio,
      'nomor': model.nomor,
      'rukuk': model.rukuk,
      'keterangan': model.keterangan,
    };
    final db = await database;
    final create = await db!.insert('Surah', row);
    return create;
  }

  Future<List<SurahModelNova>?> getSurah() async {
    Database? db = await database;

    var allData = await db!.rawQuery('SELECT * FROM Surah');
    List<SurahModelNova> list = allData.isNotEmpty
        ? allData.map((e) => SurahModelNova.fromJson(e)).toList()
        : [];

    return list;
  }

  insertHadis(HadisLocalModel model) async {
    var row = {
      'name': model.name,
      'id': model.id,
      'available': model.available,
    };

    final db = await database;
    final create = await db!.insert('Hadis', row);
    return create;
  }

  Future<List<HadisLocalModel>?> getHadisLocal() async {
    Database? db = await database;

    var hadisData = await db!.rawQuery('SELECT * FROM Hadis');
    List<HadisLocalModel> list = hadisData.isNotEmpty
        ? hadisData.map((e) => HadisLocalModel.fromJson(e)).toList()
        : [];

    return list;
  }

  insertDoa(DoaListModel model) async {
    var data = {
      'id_doa': model.idDoa,
      'nama': model.nama,
      'lafal': model.lafal,
      'transliterasi': model.transliterasi,
      'arti': model.arti,
      'riwayat': model.riwayat,
      'keterangan': model.keterangan,
    };

    final db = await database;
    final create = await db!.insert('Doa', data);
    return create;
  }

  Future<List<DoaListModel>?> getDoa() async {
    Database? db = await database;

    var doaList = await db!.rawQuery('SELECT * FROM Doa');
    List<DoaListModel> list = doaList.isNotEmpty
        ? doaList.map((e) => DoaListModel.fromJson(e)).toList()
        : [];

    return list;
  }

  Future<List<HadisLocalModel>?> getHadisDetail() async {
    Database? db = await database;

    var hadisDetail = await db!.rawQuery('SELECT * FROM HadisDetail');
    List<HadisLocalModel> list = hadisDetail.isNotEmpty
        ? hadisDetail.map((e) => HadisLocalModel.fromJson(e)).toList()
        : [];

    return list;
  }

  insertJadwal(JadwalSholatModel model) async {
    var data = {
      'tanggal': model.tanggal,
      'imsak': model.imsak,
      'subuh': model.subuh,
      'terbit': model.terbit,
      'dhuha': model.dhuha,
      'dzuhur ': model.dzuhur,
      'ashar': model.ashar,
      'maghrib': model.maghrib,
      'isya': model.isya,
      'date': model.date,
    };

    final db = await database;
    final create = await db!.insert('Jadwal', data);
    return create;
  }

  insertGetLoc(DataSholatModel model) async {
    var data = {
      'id': model.id,
      'lokasi': model.lokasi,
      'daerah': model.daerah,
    };
    final db = await database;
    final create = await db!.insert('Lokasi', data);
    return create;
  }

  Future<List<DataSholatModel>?> getLocation() async {
    Database? db = await database;

    var lokasi = await db!.rawQuery('SELECT * FROM Lokasi');
    List<DataSholatModel> list = lokasi.isNotEmpty
        ? lokasi.map((e) => DataSholatModel.fromJson(e)).toList()
        : [];
    return list;
  }

  // Future<HadisModel?> getHadis() async {
  //   Database? db = await database;

  //   var allData = await db!.rawQuery('SELECT * FROM Hadis');
  //   var parsar
  //   var parse = HadisModel.fromJson(allData)

  //   return parse;
  // }

  insertPrayer(PrayerTimeModel model) async {
    var data = {
      'imsak': model.data!.timings!.imsak,
      'subuh': model.data!.timings!.fajr,
      'dhuha': model.data!.timings!.sunrise,
      'dzuhur ': model.data!.timings!.dhuhr,
      'ashar': model.data!.timings!.asr,
      'maghrib': model.data!.timings!.maghrib,
      'isya': model.data!.timings!.isha,
      'tanggal': model.data!.date!.gregorian!.date,
    };
    // / insertPrayer(PrayerModel model) async {
    //   var data = {
    //     'imsak': model.imsak,
    //     'subuh': model.fajr,
    //     'dhuha': model.sunrise,
    //     'dzuhur ': model.dhuhr,
    //     'ashar': model.asr,
    //     'maghrib': model.maghrib,
    //     'isya': model.isha,
    //     // 'tanggal':model.ta
    //   };

    final db = await database;
    final create = await db!.insert('Sholat', data);
    return create;
  }
}
