library pkg_database;

import 'package:path/path.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;
  int? version;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDb();
      return _database!;
    }
  }

  initDb() async {
    print('Init DB');
    var ourDb = await openDatabase(
      'movieku.db',
      onCreate: _onCreate,
      version: 1,
      onUpgrade: (db, oldVersion, newVersion) {},
    );

    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await _createParametersTable(db);
    await _createProfileTable(db);
  }

  //GENERAL
  Future<void> _createParametersTable(Database db) async {
    await db.execute('''
    CREATE TABLE parameters (
      parameter VARCHAR(50) PRIMARY KEY,
      value VARCHAR(200)
    )
  ''');
  }

  Future<void> _createProfileTable(Database db) async {
    await db.execute('''
    CREATE TABLE profile (
      username VARCHAR(20) PRIMARY KEY,
      contact VARCHAR(100),
      birth_date VARCHAR(50),
      address VARCHAR(200),
      image VARCHAR(200)
    )
  ''');
  }
}
