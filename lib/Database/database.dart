// ignore_for_file: avoid_print

import 'package:flappy_bird/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sql{

  static Database? _db ;

  Future<Database?> get db async {
    if (_db == null){
      _db  = await initial() ;
      return _db ;
    }else {
      return _db ;
    }
  }

  initial() async {
    String file = await getDatabasesPath() ;
    String path = join(file , 'database.db') ;
    Database database = await openDatabase(path , onCreate: _onCreate, version: 1) ;
    return database ;
  }

  _onCreate(Database database , int version) async {
    await database.execute('''
  CREATE TABLE "$User" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "best" INTEGER NOT NULL
  )
 ''') ;
    print(" onCreate =====================================") ;
  }

  readData(String name,int score) async {
    Database? database = await db ;
    List<Map> response = await  database!.rawQuery("Statement");
    return response ;
  }

  insertData(String name,int score) async {
    Database? database = await db ;
    int  response = await  database!.rawInsert("Statement");
    return response ;
  }

  // updateData(String sql) async {
  //   Database? database = await db ;
  //   int  response = await  database!.rawUpdate(sql);
  //   return response ;
  // }

  // deleteData(String sql) async {
  //   Database? database = await db ;
  //   int  response = await  database!.rawDelete(sql);
  //   return response ;
  // }

  // _onUpgrade(Database db , int oldVersion , int newVersion ) {
  //   print("onUpgrade =====================================") ;
  // }
}