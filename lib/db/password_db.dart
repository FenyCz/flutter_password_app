import 'dart:async';
import 'dart:io';
import 'package:first_app/model/password_item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class PasswordDatabase {
  // db constructor
  PasswordDatabase._privateConstructor();
  static final PasswordDatabase instance =
      PasswordDatabase._privateConstructor();

  static Database? _database;
  // use existing db or make instance
  Future<Database> get database async => _database ??= await _initDatabase();

  // db init
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'passwords.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

// create table in db
  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE passwords(id INTEGER PRIMARY KEY, name STRING, user STRING, pwd STRING)',
    );
  }

  Future<List<PasswordItem>> getItems() async {
    Database db = await instance.database;
    var pwds = await db.query('passwords', orderBy: 'name');

    List<PasswordItem> pwdList = pwds.isNotEmpty
        ? pwds.map((c) => PasswordItem.fromMap(c)).toList()
        : [];
    return pwdList;
  }

  Future<int> add(PasswordItem item) async {
    Database db = await instance.database;
    return await db.insert('passwords', item.toMap());
  }

  Future<int> deleteAll() async {
    Database db = await instance.database;
    return await db.rawDelete('Delete from passwords');
  }
}
