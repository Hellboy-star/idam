import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'item.dart';

class DatabaseClient {

  late Database _database;

  FutureOr<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      //Créer cette database.
      _database = await create();
      return _database;
    }
  }
  Future create() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String database_directory = join(directory.path, 'database.db');
    var bdd = await openDatabase(database_directory, version: 2, onCreate: _onCreate);
    return bdd;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE item (
      firstname TEXT
      lastname TEXT
      birthday TEXT
      adress TEXT
      phone INTERGER
      mail TEXT
      gender TEXT
      image TEXT
      citation TEXT)
    ''');
  }



  Future<Item> ajoutItem(Item item) async {
    Database maDatabase = await database;
    item.firstname = (await maDatabase.insert('item', item.toJson())) as String;
    return item;
  }

  Future<List<Item>> allItem() async {
    Database maDatabase = await database;
    List<Map<String, dynamic>> resultat = await maDatabase.rawQuery('SELECT * From item');
    List<Item> items = [];
    resultat.forEach((Map) {
      Item item = new Item.fromJson(Map);
      item.toJson(Map);
      items.add(item);
    });
    return items;
  }

}
