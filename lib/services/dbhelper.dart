import 'dart:async';
import 'dart:io' as io;
import 'package:jtblotto/data/listmodel.dart';
import 'package:jtblotto/data/lottoinfo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DBHelper 
{ 
  static Database _db;
  static const String TABLE = 'LottoInfo';
  static const String ID = 'drwNo';
  static const String DB_NAME = 'LottoInfo.db';
 
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
 
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
 
  _onCreate(Database db, int version) async {
    await db
        .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, totSellamnt INTEGER,  returnValue TEXT, drwNoDate TEXT, firstWinamnt INTEGER, firstPrzwnerCo INTEGER, firstAccumamnt INTEGER, drwtNo1 INTEGER, drwtNo2 INTEGER, drwtNo3 INTEGER, drwtNo4 INTEGER, drwtNo5 INTEGER, drwtNo6 INTEGER, bnusNo INTEGER,)");
  }

  Future<void> save(LottoInfo lottoInfo) async {
    var dbClient = await db;
    await dbClient.insert(TABLE, lottoInfo.toMap());
    
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }
 
  Future<List<ListItem>> getListItem() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [TABLE]);
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<ListItem> listItems = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        listItems.add(ListItem.fromMap(maps[i]));
      }
    }
    return listItems;
  }
 
  Future<int> delete(int drwNo) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [drwNo]);
  }
 
  Future<int> update(ListItem listItem) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, listItem.toMap(),
        where: '$ID = ?', whereArgs: [listItem.drwNo]);
  }
 
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

}

