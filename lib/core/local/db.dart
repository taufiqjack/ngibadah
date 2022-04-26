import 'dart:io';

import 'package:monggo_sholat/models/doa_model.dart';
import 'package:monggo_sholat/models/hadis_model.dart';
import 'package:monggo_sholat/models/list_doa_model.dart';
import 'package:monggo_sholat/models/surah_model.dart';
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
          'create table Surah(nomor INTEGER PRIMARY KEY,nama TEXT, nama_latin TEXT, jumlah_ayat INTEGER, tempat_turun TEXT, arti TEXT, deskripsi TEXT, audio TEXT)');
      await db
          .execute('create table Hadis(nama TEXT, id TEXT, available INTEGER)');
      await db.execute(
          'create table Doa(id_doa TEXT, nama TEXT, lafal TEXT, transliterasi TEXT, arti TEXT, riwayat TEXT, keterangan TEXT, kata_kunci TEXT)');
    });
  }

  insertSurah(SurahModel model) async {
    var row = {
      'nomor': model.nomor,
      'nama': model.nama,
      'nama_latin': model.namaLatin,
      'jumlah_ayat': model.jumlahAyat,
      'tempat_turun': model.tempatTurun,
      'arti': model.arti,
      'deskripsi': model.deskripsi,
      'audio': model.audio,
    };
    final db = await database;
    final create = await db!.insert('Surah', row);
    return create;
  }

  Future<List<SurahModel>?> getSurah() async {
    Database? db = await database;

    var allData = await db!.rawQuery('SELECT * FROM Surah');
    List<SurahModel> list = allData.isNotEmpty
        ? allData.map((e) => SurahModel.fromJson(e)).toList()
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

  // Future<HadisModel?> getHadis() async {
  //   Database? db = await database;

  //   var allData = await db!.rawQuery('SELECT * FROM Hadis');
  //   var parsar
  //   var parse = HadisModel.fromJson(allData)

  //   return parse;
  // }
}
